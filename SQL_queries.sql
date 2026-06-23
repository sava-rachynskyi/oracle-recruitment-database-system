--1.Join

-- 1. Zwraca szczegółowe informacje o aktywnych wakatach (których data ważności jest późniejsza niż 15 stycznia 2026).
-- W wyniku otrzymamy stanowisko, proponowaną pensję, nazwę firmy, lokalizację (miasto i kraj) oraz imię i nazwisko przypisanego rekrutera.
-- Zapytanie sortuje wyniki od najwyższej pensji.
SELECT 
    w.stanowisko, 
    w.pensja, 
    p.nazwa_firmy, 
    m.nazwa AS miasto, 
    kr.nazwa AS kraj, 
    o.Imie AS imie_rekrutera, 
    o.nazwisko AS nazwisko_rekrutera
FROM wakat w
INNER JOIN pracodawca p ON w.pracodawca_id = p.pracodawca_id
INNER JOIN address a ON w.address_id = a.id
INNER JOIN miasto m ON a.miasto_id = m.id
INNER JOIN kraj kr ON m.kraj_id = kr.id
INNER JOIN osoba o ON w.rekruter_id = o.osoba_id
WHERE w.data_waznosci > TO_DATE('2026-01-15', 'YYYY-MM-DD')
ORDER BY w.pensja DESC;

-- 2. Zwraca pełną historię procesów rekrutacyjnych kandydatów (imię, nazwisko, telefon).
-- Wykorzystuje LEFT JOIN, aby pokazać wszystkie podania, nawet jeśli rozmowa kwalifikacyjna (i powiązana z nią decyzja) jeszcze się nie odbyła.
-- Wyniki są posortowane według daty złożenia podania (od najnowszego).
SELECT 
    o.Imie, 
    o.nazwisko, 
    o.telefon, 
    w.stanowisko, 
    sp.nazwa AS obecny_status, 
    p.data_zlozenia, 
    rk.data_rozmowy
FROM podanie p
INNER JOIN cv c ON p.cv_cv_id = c.cv_id
INNER JOIN osoba o ON c.kandydat_id = o.osoba_id
INNER JOIN wakat w ON p.wakat_id = w.wakat_id
INNER JOIN status_podania sp ON p.status_podania_id = sp.id
LEFT JOIN rozmowa_kwalifikacyjna rk ON p.id = rk.podanie_id
WHERE p.data_zlozenia >= TO_DATE('2025-12-01', 'YYYY-MM-DD')
ORDER BY p.data_zlozenia DESC;

-- 3. Zwraca statystyki rekrutacyjne zgrupowane po branży.
-- Pokazuje nazwę branży, łączną liczbę złożonych podań oraz średnią oferowaną pensję.
-- Za pomocą klauzuli HAVING filtrujemy wyniki tylko do tych branż, gdzie średnia pensja na wakatach przekracza 13000.
SELECT 
    w.branza, 
    COUNT(p.id) AS liczba_zlozonych_podan, 
    ROUND(AVG(w.pensja), 2) AS srednia_pensja
FROM wakat w
LEFT JOIN podanie p ON w.wakat_id = p.wakat_id
GROUP BY w.branza
HAVING AVG(w.pensja) > 13000
ORDER BY liczba_zlozonych_podan DESC;
-------------------------------------------------------------------------
--2 Podzapytania

-- 4. Zwraca imię, nazwisko oraz e-mail kandydatów, którzy w swoim CV zadeklarowali znajomość języka 'Angielski'.
-- Podzapytanie szuka w tabelach słownikowych i łączących numerów CV, które posiadają powiązanie z tym językiem.
SELECT 
    o.Imie, 
    o.nazwisko, 
    o.email
FROM kandydat k
INNER JOIN osoba o ON k.id = o.osoba_id
INNER JOIN cv c ON k.id = c.kandydat_id
WHERE c.cv_id IN (
    SELECT jc.cv_id 
    FROM jezyk_cv jc
    INNER JOIN znajomosc_jezykow zj ON jc.znajomosc_jezykow_id = zj.id
    WHERE zj.nazwa = 'Angielski'
);

-- 5. Zwraca listę wakatów (stanowisko, branża, pensja), 
-- w których oferowana pensja jest ściśle wyższa niż całkowita średnia pensja ze wszystkich wakatów wprowadzonych do bazy.
SELECT 
    stanowisko, 
    branza, 
    pensja 
FROM wakat
WHERE pensja > (
    SELECT AVG(pensja) 
    FROM wakat
)
ORDER BY pensja DESC;
----------------------------------------------------
--3 Podzapytania skorelowane

-- 6. Zwraca imię i nazwisko rekruterów, którzy zatrudnili kogoś w 2026 roku.
-- Podzapytanie skorelowane (EXISTS) sprawdza dla każdego rekrutera, 
-- czy istnieje związana z nim rozmowa kwalifikacyjna zakończona pozytywną decyzją (czy_wziety = 1).
SELECT 
    o.Imie, 
    o.nazwisko 
FROM rekruter r
INNER JOIN osoba o ON r.id = o.osoba_id
WHERE EXISTS (
    SELECT 1 
    FROM rozmowa_kwalifikacyjna rk
    INNER JOIN decyzja d ON rk.decyzja_id = d.id
    WHERE rk.rekruter_id = r.id 
      AND d.czy_wziety = 1
      AND d.data >= TO_DATE('2026-01-01', 'YYYY-MM-DD')
);

-- 7. Zwraca nazwę firmy wraz ze zliczoną ilością wakatów opublikowanych przez tę firmę
-- oraz maksymalną (najnowszą) ofertą. Dane są pobierane bezpośrednio w selekcie za pomocą skorelowanych podzapytań.
SELECT 
    p.nazwa_firmy,
    (SELECT COUNT(*) FROM wakat w WHERE w.pracodawca_id = p.pracodawca_id) AS liczba_aktywnych_wakatow,
    (SELECT MAX(data_dodania) FROM wakat w WHERE w.pracodawca_id = p.pracodawca_id) AS najnowszy_wakat
FROM pracodawca p
ORDER BY liczba_aktywnych_wakatow DESC;

-- 8. Zwraca wakaty (stanowisko, pensja, branża), w których pensja jest wyższa 
-- niż średnia pensja ze wszystkich wakatów wystawionych przez TEGO SAMEGO pracodawcę.
SELECT 
    w1.stanowisko, 
    w1.branza, 
    w1.pensja
FROM wakat w1
WHERE w1.pensja > (
    SELECT AVG(w2.pensja) 
    FROM wakat w2 
    WHERE w2.pracodawca_id = w1.pracodawca_id
)
ORDER BY w1.pensja DESC;

-----------------------------------------
--3.Update

-- 9. Podnosi pensję o 10% (mnożnik 1.1) na wakatach wystawionych przez firmę 'ArtFlow',
-- na które wpłynęły już więcej niż 2 podania.
-- Wykorzystuje podzapytania do wyciągnięcia ID pracodawcy oraz ID wakatów z dużą liczbą aplikacji.
UPDATE wakat 
SET pensja = pensja * 1.1
WHERE pracodawca_id = (
        SELECT pracodawca_id FROM pracodawca WHERE nazwa_firmy = 'ArtFlow'
    ) 
  AND wakat_id IN (
        SELECT wakat_id 
        FROM podanie 
        GROUP BY wakat_id 
        HAVING COUNT(id) > 2
  );

-- 10. Zmienia status podania na 'Zakończone' dla wszystkich podań, 
-- które przeszły rozmowę kwalifikacyjną, ale wydano po nich ostatecznie decyzję negatywną (czy_wziety = 0).
UPDATE podanie 
SET status_podania_id = (SELECT id FROM status_podania WHERE nazwa = 'Zakończone')
WHERE id IN (
    SELECT rk.podanie_id 
    FROM rozmowa_kwalifikacyjna rk
    INNER JOIN decyzja d ON rk.decyzja_id = d.id
    WHERE d.czy_wziety = 0
);

--------------------------------------------------
--4. Delete


-- 11. Usuwa umiejętności z CV (czyści tabelę łączącą), dla tych CV, 
-- które nigdy nie zostały użyte w żadnym procesie rekrutacyjnym (nie figurują w tabeli podanie).
DELETE FROM umietnosci_cv
WHERE cv_id IN (
    SELECT c.cv_id 
    FROM cv c 
    WHERE c.cv_id NOT IN (
        SELECT cv_cv_id FROM podanie
    )
);

-- 12. Usuwa z bazy stare wakaty (data ważności minęła przed 1 lutego 2026),
-- na które nie zgłosił się absolutnie nikt (brak wpisów w tabeli podanie dla tego wakatu).
DELETE FROM wakat w
WHERE w.data_waznosci < TO_DATE('2026-02-01', 'YYYY-MM-DD')
  AND NOT EXISTS (
      SELECT 1 
      FROM podanie p 
      WHERE p.wakat_id = w.wakat_id
  );
