-- procedura automatycznie zamyka stare podania o pracę dla wakatów, których termin ważności już minął

CREATE OR REPLACE PROCEDURE p1 AS
    CURSOR wygasle_wakaty IS
        SELECT wakat_id
        FROM wakat
        WHERE data_waznosci < SYSDATE;

    wakatId Integer;
    licznik  INTEGER := 0;
BEGIN
    OPEN wygasle_wakaty;
    LOOP
        FETCH wygasle_wakaty INTO wakatId;
        EXIT WHEN wygasle_wakaty%NOTFOUND;

        UPDATE podanie
        SET status_podania_id = 5
        WHERE wakat_id = wakatId
        AND status_podania_id != 5;

        licznik := licznik + SQL%ROWCOUNT;
    END LOOP;
    CLOSE wygasle_wakaty;

    DBMS_OUTPUT.PUT_LINE('Zakończono proces. Zaktualizowano podania w liczbie: ' || licznik);
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        IF wygasle_wakaty%ISOPEN THEN CLOSE wygasle_wakaty; END IF;
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20100, 'Błąd podczas zamykania podań: ' || SQLERRM);
END;
/

CALL p1();

ROLLBACK;
---------------------------------------------------------------------------------------------------------------------
-- Procedura analizuje dopasowanie kandydata do wymagań wakatu. Wykorzystuje kursor do przejścia przez aplikantów i oblicza wynik punktowy.

CREATE OR REPLACE PROCEDURE p2 (p_wakat_id INTEGER, p_min_score NUMBER) AS
    cvId INTEGER;
    podanieId INTEGER;
    reqSkills INTEGER;
    matchSkills INTEGER;
    score NUMBER;

    CURSOR c_aplikanci IS
        SELECT cv_cv_id, id FROM podanie WHERE wakat_id = p_wakat_id;
BEGIN
    SELECT COUNT(*) INTO reqSkills FROM umietnosci_wakat WHERE wakat_id = p_wakat_id;

    OPEN c_aplikanci;
    LOOP
        FETCH c_aplikanci INTO cvId, podanieId;
        EXIT WHEN c_aplikanci%NOTFOUND;

        SELECT COUNT(*) INTO matchSkills
        FROM umietnosci_cv
        WHERE cv_id = cvId
        AND umiejetnosci_id IN (SELECT umiejetnosci_id FROM umietnosci_wakat WHERE wakat_id = p_wakat_id);

        score := 0;
        IF reqSkills > 0 THEN
            score := (matchSkills / reqSkills) * 100;
        END IF;

        DBMS_OUTPUT.PUT_LINE('Podanie ID: ' || podanieId || ' Score: ' || score);

        IF score >= p_min_score THEN
            UPDATE podanie SET status_podania_id = 2 WHERE id = podanieId;
        END IF;
    END LOOP;
    CLOSE c_aplikanci;
END;
/

CALL p2(1, 50);

ROLLBACK;
------------------------------------------------------------------------------------------
-- wyzwalacz pilnuje, aby data dodania wakatu nie była z przyszłości oraz sprawdza, czy pensja nie jest ujemna przy wstawianiu lub aktualizacji

CREATE OR REPLACE TRIGGER t1
BEFORE INSERT OR UPDATE ON wakat
FOR EACH ROW
DECLARE
    dzisiejsza_data DATE;
BEGIN
    dzisiejsza_data := SYSDATE;

    IF :new.data_dodania > dzisiejsza_data THEN
        RAISE_APPLICATION_ERROR(-20101, 'Data dodania nie moze byc z przyszlosci!');
    END IF;

    IF :new.pensja <= 0 THEN
        RAISE_APPLICATION_ERROR(-20102, 'Pensja musi byc wieksza od zera!');
    END IF;
END;
/

-- ODCZYT: Próba dodania daty z przyszłości wywoła błąd i przerwie skrypt (odkomentuj poniżej, aby przetestować błąd)
-- INSERT INTO wakat(wakat_id, pracodawca_id, stanowisko, branza, data_dodania, data_waznosci, pensja, address_id, rekruter_id, wymagane_doswiadczenie)
-- VALUES (5, 1, 'Test Dev', 'IT', SYSDATE + 100, SYSDATE+110, 5000, 110, 1, 3);

-- Prawidłowe wstawienie zgodne z nowym DDL:
INSERT INTO wakat(wakat_id, pracodawca_id, stanowisko, branza, data_dodania, data_waznosci, pensja, address_id, rekruter_id, wymagane_doswiadczenie)
VALUES (6, 1, 'Valid Dev', 'IT', SYSDATE, SYSDATE+30, 8000, 110, 1, 5);

ROLLBACK;
-----------------------------------------------------------------
-- wyzwalacz wykonuje zaawansowane operacje po aktualizacji statusu podania.
-- Jeśli status zmienia się na "Rozmowa kwalifikacyjna" ,
-- a nie ma jeszcze przypisanego rekrutera w systemie rozmów,
-- wyzwalacz blokuje zmianę lub wykonuje logowanie.
-- Dodatkowo, jeśli podanie jest usuwane, wyzwalacz czyści powiązane rekordy.

CREATE OR REPLACE TRIGGER t2
AFTER UPDATE OR DELETE ON podanie
FOR EACH ROW
DECLARE
    liczba_rozmow INTEGER;
    id_statusu_rozmowa INTEGER;
BEGIN
    id_statusu_rozmowa := 3;

    IF UPDATING THEN
        IF :new.status_podania_id = id_statusu_rozmowa THEN
            SELECT COUNT(*) INTO liczba_rozmow
            FROM rozmowa_kwalifikacyjna
            WHERE podanie_id = :new.id;

            IF liczba_rozmow = 0 THEN
                RAISE_APPLICATION_ERROR(-20103, 'Nie mozna ustawic statusu rozmowy bez przypisania rekrutera w terminarzu!');
            END IF;

            DBMS_OUTPUT.PUT_LINE('Status podania ' || :new.id || ' pomyslnie zweryfikowany.');
        END IF;
    END IF;

    IF DELETING THEN
        DELETE FROM rozmowa_kwalifikacyjna WHERE podanie_id = :old.id;
        DBMS_OUTPUT.PUT_LINE('Usunieto powiazane terminy rozmow dla podania: ' || :old.id);
    END IF;
END;
/

-- Próba zmiany na status 3 wywoła błąd z wyzwalacza, bo podanie nr 3 nie ma zaplanowanej rozmowy (odkomentuj by przetestować)
-- UPDATE podanie SET status_podania_id = 3 WHERE id = 3;

-- Bezpieczna zmiana statusu:
UPDATE podanie SET status_podania_id = 2 WHERE id = 3;

-- Testowanie kaskadowego usuwania (wyzwalacz sam usunie powiązaną rozmowę kwalifikacyjną)
DELETE FROM podanie WHERE id = 10;
SELECT * FROM rozmowa_kwalifikacyjna WHERE podanie_id = 10; 

ROLLBACK;