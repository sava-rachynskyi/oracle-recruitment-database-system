-- Table: kraj
INSERT INTO kraj (id, nazwa) VALUES (1, 'Polska');
INSERT INTO kraj (id, nazwa) VALUES (2, 'Wielka Brytania');
INSERT INTO kraj (id, nazwa) VALUES (3, 'Hiszpania');
INSERT INTO kraj (id, nazwa) VALUES (4, 'Francja');

-- Table: miasto
INSERT INTO miasto (id, nazwa, kraj_id) VALUES (11, 'Warszawa', 1);
INSERT INTO miasto (id, nazwa, kraj_id) VALUES (12, 'Kraków', 1);
INSERT INTO miasto (id, nazwa, kraj_id) VALUES (13, 'Wrocław', 1);
INSERT INTO miasto (id, nazwa, kraj_id) VALUES (21, 'Londyn', 2);
INSERT INTO miasto (id, nazwa, kraj_id) VALUES (31, 'Madryt', 3);
INSERT INTO miasto (id, nazwa, kraj_id) VALUES (32, 'Barcelona', 3);
INSERT INTO miasto (id, nazwa, kraj_id) VALUES (41, 'Paryż', 4);

-- Table: status_podania
INSERT INTO status_podania(id, nazwa) VALUES (1, 'Nowe');
INSERT INTO status_podania(id, nazwa) VALUES (2, 'Weryfikacja');
INSERT INTO status_podania(id, nazwa) VALUES (3, 'Rozmowa kwal.');
INSERT INTO status_podania(id, nazwa) VALUES (4, 'Oczekiwanie');
INSERT INTO status_podania(id, nazwa) VALUES (5, 'Zakończone');

-- Table: wyksztalcenie
INSERT INTO wyksztalcenie (id, nazwa) VALUES (1, 'Podstawowe');
INSERT INTO wyksztalcenie (id, nazwa) VALUES (2, 'Średnie');
INSERT INTO wyksztalcenie (id, nazwa) VALUES (3, 'Wyższe - Licencjat');
INSERT INTO wyksztalcenie (id, nazwa) VALUES (4, 'Wyższe - Magister');

-- Table: umiejetnosci
INSERT INTO umiejetnosci (id, nazwa) VALUES (1, 'Programowanie Java');
INSERT INTO umiejetnosci (id, nazwa) VALUES (2, 'SQL i bazy danych');
INSERT INTO umiejetnosci (id, nazwa) VALUES (3, 'Analiza danych (Python/R)');
INSERT INTO umiejetnosci (id, nazwa) VALUES (4, 'Zarządzanie projektami (Agile/Scrum)');
INSERT INTO umiejetnosci (id, nazwa) VALUES (5, 'Strategia marketingowa');
INSERT INTO umiejetnosci (id, nazwa) VALUES (6, 'Przywództwo i zarządzanie zespołem');
INSERT INTO umiejetnosci (id, nazwa) VALUES (7, 'Projektowanie UI/UX');
INSERT INTO umiejetnosci (id, nazwa) VALUES (8, 'Montaż wideo i efekty specjalne');
INSERT INTO umiejetnosci (id, nazwa) VALUES (9, 'Grafika komputerowa (Adobe Suite)');
INSERT INTO umiejetnosci (id, nazwa) VALUES (10, 'Komunikacja interpersonalna');
INSERT INTO umiejetnosci (id, nazwa) VALUES (11, 'Praca w zespole');
INSERT INTO umiejetnosci (id, nazwa) VALUES (12, 'Kreatywne rozwiązywanie problemów');

-- Table: decyzja
INSERT INTO decyzja(id, czy_wziety, data) VALUES (1, 1, TO_DATE('2026-01-05', 'YYYY-MM-DD'));
INSERT INTO decyzja(id, czy_wziety, data) VALUES (2, 1, TO_DATE('2026-01-08', 'YYYY-MM-DD'));
INSERT INTO decyzja(id, czy_wziety, data) VALUES (3, 0, TO_DATE('2026-01-04', 'YYYY-MM-DD'));
INSERT INTO decyzja(id, czy_wziety, data) VALUES (4, 0, TO_DATE('2026-01-07', 'YYYY-MM-DD'));
INSERT INTO decyzja(id, czy_wziety, data) VALUES (5, 0, TO_DATE('2026-01-07', 'YYYY-MM-DD'));

-- Table: znajomosc_jezykow
INSERT INTO znajomosc_jezykow(id, nazwa) VALUES (1, 'Angielski');
INSERT INTO znajomosc_jezykow(id, nazwa) VALUES (2, 'Niemiecki');
INSERT INTO znajomosc_jezykow(id, nazwa) VALUES (3, 'Francuski');
INSERT INTO znajomosc_jezykow(id, nazwa) VALUES (4, 'Hiszpański');
INSERT INTO znajomosc_jezykow(id, nazwa) VALUES (5, 'Japoński');
INSERT INTO znajomosc_jezykow(id, nazwa) VALUES (6, 'Polski');

-- Table: address
INSERT INTO address(id, miasto_id, ulica, local) VALUES (101, 11, 'Chmielna', '4');
INSERT INTO address(id, miasto_id, ulica, local) VALUES (102, 12, 'Grodzka', '12A');
INSERT INTO address(id, miasto_id, ulica, local) VALUES (103, 13, 'Świdnicka', '10');
INSERT INTO address(id, miasto_id, ulica, local) VALUES (104, 11, 'Wspólna', '125');
INSERT INTO address(id, miasto_id, ulica, local) VALUES (105, 11, 'Nowy Świat', '15A');
INSERT INTO address(id, miasto_id, ulica, local) VALUES (106, 12, 'Floriańska', '1');
INSERT INTO address(id, miasto_id, ulica, local) VALUES (107, 12, 'Rynek', '20');
INSERT INTO address(id, miasto_id, ulica, local) VALUES (108, 12, 'Długa', '55');
INSERT INTO address(id, miasto_id, ulica, local) VALUES (109, 11, 'Złota', '10');
INSERT INTO address(id, miasto_id, ulica, local) VALUES (110, 11, 'Prosta', '33');
INSERT INTO address(id, miasto_id, ulica, local) VALUES (111, 11, 'Krucza', '11');
INSERT INTO address(id, miasto_id, ulica, local) VALUES (201, 21, 'Oxford', '250');
INSERT INTO address(id, miasto_id, ulica, local) VALUES (202, 21, 'Baker', '221B');
INSERT INTO address(id, miasto_id, ulica, local) VALUES (301, 31, 'Alcala', '102');
INSERT INTO address(id, miasto_id, ulica, local) VALUES (302, 31, 'Gran Via', '15');
INSERT INTO address(id, miasto_id, ulica, local) VALUES (303, 32, 'Diagonal', '40');
INSERT INTO address(id, miasto_id, ulica, local) VALUES (401, 32, 'La Rambla', '50');
INSERT INTO address(id, miasto_id, ulica, local) VALUES (402, 41, 'Champs', '10');

-- Table: osoba
INSERT INTO osoba (osoba_id, Imie, nazwisko, email, telefon, address_id) VALUES (1, 'Andrzej', 'Nowak', 'AndrzejNowak@gmail.com', '555123123', 101);
INSERT INTO osoba (osoba_id, Imie, nazwisko, email, telefon, address_id) VALUES (2, 'Piotr', 'Lewandowski', 'PiotrLew@gmail.com', '555773767', 102);
INSERT INTO osoba (osoba_id, Imie, nazwisko, email, telefon, address_id) VALUES (3, 'Agnieszka', 'Wiśniewska', 'Wisniewska@gmail.com', '555321321', 103);
INSERT INTO osoba (osoba_id, Imie, nazwisko, email, telefon, address_id) VALUES (4, 'Katarzyna', 'Wójcik', 'KWojcik@gmail.com', '555111767', 104);
INSERT INTO osoba (osoba_id, Imie, nazwisko, email, telefon, address_id) VALUES (5, 'Jakub', 'Zieliński', 'Jakub356@gmail.com', '555123456', 105);
INSERT INTO osoba (osoba_id, Imie, nazwisko, email, telefon, address_id) VALUES (6, 'Paweł', 'Mazur', 'MazurPawel@gmail.com', '555963852', 106);
INSERT INTO osoba (osoba_id, Imie, nazwisko, email, telefon, address_id) VALUES (7, 'Michał', 'Król', 'm.krol@gmail.com', '555000111', 107);
INSERT INTO osoba (osoba_id, Imie, nazwisko, email, telefon, address_id) VALUES (8, 'Anna', 'Woźniak', 'a.wozniak@outlook.com', '555222333', 108);
INSERT INTO osoba (osoba_id, Imie, nazwisko, email, telefon, address_id) VALUES (9, 'John', 'Smith', 'jsmith@yahoo.com', '447123456', 201);
INSERT INTO osoba (osoba_id, Imie, nazwisko, email, telefon, address_id) VALUES (10, 'Carlos', 'Garcia', 'c.garcia@gmail.com', '349123456', 301);
INSERT INTO osoba (osoba_id, Imie, nazwisko, email, telefon, address_id) VALUES (11, 'Sato', 'Tanaka', 's.tanaka@jp.com', '813555000', 302);
INSERT INTO osoba (osoba_id, Imie, nazwisko, email, telefon, address_id) VALUES (12, 'Elena', 'Rodriguez', 'elena.r@gmail.com', '349654321', 303);
INSERT INTO osoba (osoba_id, Imie, nazwisko, email, telefon, address_id) VALUES (13, 'Marek', 'Dąbrowski', 'marek.dab@gmail.com', '555444555', 109);
INSERT INTO osoba (osoba_id, Imie, nazwisko, email, telefon, address_id) VALUES (14, 'Alice', 'Brown', 'abrown@yahoo.com', '447987654', 202);
INSERT INTO osoba (osoba_id, Imie, nazwisko, email, telefon, address_id) VALUES (15, 'Lucas', 'Dubois', 'l.dubois@fr.com', '331000222', 401);
INSERT INTO osoba (osoba_id, Imie, nazwisko, email, telefon, address_id) VALUES (16, 'Luc', 'Bertrand', 'l.bertrand@hr.fr', '336123456', 402);

-- Table: kandydat
INSERT INTO kandydat(id) VALUES (5);  -- Kandydat: Jakub Zieliński
INSERT INTO kandydat(id) VALUES (6);  -- Kandydat: Paweł Mazur
INSERT INTO kandydat(id) VALUES (7);  -- Kandydat: Michał Król
INSERT INTO kandydat(id) VALUES (8);  -- Kandydat: Anna Woźniak
INSERT INTO kandydat(id) VALUES (9);  -- Kandydat: John Smith
INSERT INTO kandydat(id) VALUES (10); -- Kandydat: Carlos Garcia
INSERT INTO kandydat(id) VALUES (11); -- Kandydat: Sato Tanaka
INSERT INTO kandydat(id) VALUES (12); -- Kandydat: Elena Rodriguez
INSERT INTO kandydat(id) VALUES (13); -- Kandydat: Marek Dąbrowski
INSERT INTO kandydat(id) VALUES (14); -- Kandydat: Alice Brown
INSERT INTO kandydat(id) VALUES (15); -- Kandydat: Lucas Dubois
INSERT INTO kandydat(id) VALUES (16); -- Kandydat: Luc Bertrand

-- Table: rekruter
INSERT INTO rekruter(id, pensja) VALUES (1, 7000.00); -- Rekruter: Andrzej Nowak
INSERT INTO rekruter(id, pensja) VALUES (2, 7200.00); -- Rekruter: Piotr Lewandowski
INSERT INTO rekruter(id, pensja) VALUES (3, 7500.00); -- Rekruter: Agnieszka Wiśniewska
INSERT INTO rekruter(id, pensja) VALUES (4, 7500.00); -- Rekruter: Katarzyna Wójcik

-- Table: cv 
INSERT INTO cv(cv_id, kandydat_id, poczatek_pirwsz_pracy) VALUES (1, 16, TO_DATE('14-07-2020', 'DD-MM-YYYY')); -- CV 1 należy do: Luc Bertrand
INSERT INTO cv(cv_id, kandydat_id, poczatek_pirwsz_pracy) VALUES (2, 15, TO_DATE('17-05-2016', 'DD-MM-YYYY')); -- CV 2 należy do: Lucas Dubois
INSERT INTO cv(cv_id, kandydat_id, poczatek_pirwsz_pracy) VALUES (3, 14, TO_DATE('16-01-2014', 'DD-MM-YYYY')); -- CV 3 należy do: Alice Brown
INSERT INTO cv(cv_id, kandydat_id, poczatek_pirwsz_pracy) VALUES (4, 13, TO_DATE('12-06-2024', 'DD-MM-YYYY')); -- CV 4 należy do: Marek Dąbrowski
INSERT INTO cv(cv_id, kandydat_id, poczatek_pirwsz_pracy) VALUES (5, 5,  TO_DATE('24-03-2022', 'DD-MM-YYYY')); -- CV 5 należy do: Jakub Zieliński
INSERT INTO cv(cv_id, kandydat_id, poczatek_pirwsz_pracy) VALUES (6, 6,  TO_DATE('19-09-2025', 'DD-MM-YYYY')); -- CV 6 należy do: Paweł Mazur
INSERT INTO cv(cv_id, kandydat_id, poczatek_pirwsz_pracy) VALUES (7, 7,  TO_DATE('16-12-2021', 'DD-MM-YYYY')); -- CV 7 należy do: Michał Król
INSERT INTO cv(cv_id, kandydat_id, poczatek_pirwsz_pracy) VALUES (8, 8,  TO_DATE('03-03-2025', 'DD-MM-YYYY')); -- CV 8 należy do: Anna Woźniak
INSERT INTO cv(cv_id, kandydat_id, poczatek_pirwsz_pracy) VALUES (9, 9,  TO_DATE('12-11-2008', 'DD-MM-YYYY')); -- CV 9 należy do: John Smith
INSERT INTO cv(cv_id, kandydat_id, poczatek_pirwsz_pracy) VALUES (10, 10, TO_DATE('10-07-2004', 'DD-MM-YYYY')); -- CV 10 należy do: Carlos Garcia
INSERT INTO cv(cv_id, kandydat_id, poczatek_pirwsz_pracy) VALUES (11, 11, TO_DATE('02-04-2024', 'DD-MM-YYYY')); -- CV 11 należy do: Sato Tanaka
INSERT INTO cv(cv_id, kandydat_id, poczatek_pirwsz_pracy) VALUES (12, 12, TO_DATE('12-08-2010', 'DD-MM-YYYY')); -- CV 12 należy do: Elena Rodriguez
INSERT INTO cv(cv_id, kandydat_id, poczatek_pirwsz_pracy) VALUES (99, 16, TO_DATE('01-01-2026', 'DD-MM-YYYY'));

-- Table: pracodawca
INSERT INTO pracodawca (pracodawca_id, nazwa_firmy, address_id) VALUES (1, 'TechnoWorld', 110);
INSERT INTO pracodawca (pracodawca_id, nazwa_firmy, address_id) VALUES (2, 'ArtFlow', 111);

-- Table: wakat 
INSERT INTO wakat(wakat_id, pracodawca_id, stanowisko, branza, data_dodania, data_waznosci, pensja, address_id, rekruter_id, wymagane_doswiadczenie)
VALUES (1, 1, 'Java Developer', 'IT / Software', TO_DATE('2026-01-01', 'YYYY-MM-DD'), TO_DATE('2026-02-01', 'YYYY-MM-DD'), 16000, 110, 1, 3);

INSERT INTO wakat(wakat_id, pracodawca_id, stanowisko, branza, data_dodania, data_waznosci, pensja, address_id, rekruter_id, wymagane_doswiadczenie)
VALUES (2, 1, 'Project Manager', 'IT Management', TO_DATE('2026-01-02', 'YYYY-MM-DD'), TO_DATE('2026-02-15', 'YYYY-MM-DD'), 18000, 110, 2, 5);

INSERT INTO wakat(wakat_id, pracodawca_id, stanowisko, branza, data_dodania, data_waznosci, pensja, address_id, rekruter_id, wymagane_doswiadczenie)
VALUES (3, 2, 'UI/UX Designer', 'Design / Arts', TO_DATE('2026-01-03', 'YYYY-MM-DD'), TO_DATE('2026-02-03', 'YYYY-MM-DD'), 12000, 111, 3, 2);

INSERT INTO wakat(wakat_id, pracodawca_id, stanowisko, branza, data_dodania, data_waznosci, pensja, address_id, rekruter_id, wymagane_doswiadczenie)
VALUES (4, 2, 'Creative Manager', 'Management / Design', TO_DATE('2025-12-15', 'YYYY-MM-DD'), TO_DATE('2026-01-01', 'YYYY-MM-DD'), 14000, 111, 4, 4);

-- Table: podanie 
INSERT INTO podanie(id, wakat_id, data_zlozenia, status_podania_id, cv_cv_id) VALUES (1, 1, TO_DATE('2026-01-01', 'YYYY-MM-DD'), 3, 5);  -- Aplikuje Jakub (CV 5) na Java Dev (Wakat 1)
INSERT INTO podanie(id, wakat_id, data_zlozenia, status_podania_id, cv_cv_id) VALUES (2, 1, TO_DATE('2026-01-02', 'YYYY-MM-DD'), 2, 1);  -- Aplikuje Luc (CV 1) na Java Dev (Wakat 1)
INSERT INTO podanie(id, wakat_id, data_zlozenia, status_podania_id, cv_cv_id) VALUES (3, 1, TO_DATE('2026-01-03', 'YYYY-MM-DD'), 1, 11); -- Aplikuje Sato (CV 11) na Java Dev (Wakat 1)
INSERT INTO podanie(id, wakat_id, data_zlozenia, status_podania_id, cv_cv_id) VALUES (4, 2, TO_DATE('2026-01-01', 'YYYY-MM-DD'), 3, 2);  -- Aplikuje Lucas (CV 2) na Project Manager (Wakat 2)
INSERT INTO podanie(id, wakat_id, data_zlozenia, status_podania_id, cv_cv_id) VALUES (5, 2, TO_DATE('2026-01-02', 'YYYY-MM-DD'), 2, 3);  -- Aplikuje Alice (CV 3) na Project Manager (Wakat 2)
INSERT INTO podanie(id, wakat_id, data_zlozenia, status_podania_id, cv_cv_id) VALUES (6, 2, TO_DATE('2026-01-03', 'YYYY-MM-DD'), 1, 4);  -- Aplikuje Marek (CV 4) na Project Manager (Wakat 2)
INSERT INTO podanie(id, wakat_id, data_zlozenia, status_podania_id, cv_cv_id) VALUES (7, 3, TO_DATE('2026-01-01', 'YYYY-MM-DD'), 5, 12); -- Aplikuje Elena (CV 12) na UI/UX (Wakat 3)
INSERT INTO podanie(id, wakat_id, data_zlozenia, status_podania_id, cv_cv_id) VALUES (8, 3, TO_DATE('2026-01-02', 'YYYY-MM-DD'), 4, 8);  -- Aplikuje Anna (CV 8) na UI/UX (Wakat 3)
INSERT INTO podanie(id, wakat_id, data_zlozenia, status_podania_id, cv_cv_id) VALUES (9, 3, TO_DATE('2026-01-03', 'YYYY-MM-DD'), 4, 9);  -- Aplikuje John (CV 9) na UI/UX (Wakat 3)
INSERT INTO podanie(id, wakat_id, data_zlozenia, status_podania_id, cv_cv_id) VALUES (10, 4, TO_DATE('2025-12-20', 'YYYY-MM-DD'), 3, 6); -- Aplikuje Paweł (CV 6) na Creative Manager (Wakat 4)
INSERT INTO podanie(id, wakat_id, data_zlozenia, status_podania_id, cv_cv_id) VALUES (11, 4, TO_DATE('2025-12-21', 'YYYY-MM-DD'), 2, 7); -- Aplikuje Michał (CV 7) na Creative Manager (Wakat 4)
INSERT INTO podanie(id, wakat_id, data_zlozenia, status_podania_id, cv_cv_id) VALUES (12, 4, TO_DATE('2025-12-22', 'YYYY-MM-DD'), 1, 10); -- Aplikuje Carlos (CV 10) na Creative Manager (Wakat 4)

-- Table: rozmowa_kwalifikacyjna 
INSERT INTO rozmowa_kwalifikacyjna(rozmowa_id, podanie_id, rekruter_id, data_rozmowy, decyzja_id) VALUES (1, 7, 3, TO_DATE('2026-01-04', 'YYYY-MM-DD'), 1); -- Podanie 7 (Elena) z rekruterem 3 (Agnieszka)
INSERT INTO rozmowa_kwalifikacyjna(rozmowa_id, podanie_id, rekruter_id, data_rozmowy, decyzja_id) VALUES (2, 1, 1, TO_DATE('2026-01-07', 'YYYY-MM-DD'), 2); -- Podanie 1 (Jakub) z rekruterem 1 (Andrzej)
INSERT INTO rozmowa_kwalifikacyjna(rozmowa_id, podanie_id, rekruter_id, data_rozmowy, decyzja_id) VALUES (3, 6, 2, TO_DATE('2026-01-03', 'YYYY-MM-DD'), 3); -- Podanie 6 (Marek) z rekruterem 2 (Piotr)
INSERT INTO rozmowa_kwalifikacyjna(rozmowa_id, podanie_id, rekruter_id, data_rozmowy, decyzja_id) VALUES (4, 4, 2, TO_DATE('2026-01-05', 'YYYY-MM-DD'), 4); -- Podanie 4 (Lucas) z rekruterem 2 (Piotr)
INSERT INTO rozmowa_kwalifikacyjna(rozmowa_id, podanie_id, rekruter_id, data_rozmowy, decyzja_id) VALUES (5, 10, 4, TO_DATE('2026-01-06', 'YYYY-MM-DD'), 5); -- Podanie 10 (Paweł) z rekruterem 4 (Katarzyna)
INSERT INTO rozmowa_kwalifikacyjna(rozmowa_id, podanie_id, rekruter_id, data_rozmowy, decyzja_id) VALUES (6, 2, 1, TO_DATE('2026-01-08', 'YYYY-MM-DD'), 2); -- Podanie 2 (Luc) z rekruterem 1 (Andrzej)
INSERT INTO rozmowa_kwalifikacyjna(rozmowa_id, podanie_id, rekruter_id, data_rozmowy, decyzja_id) VALUES (7, 8, 3, TO_DATE('2026-01-05', 'YYYY-MM-DD'), 4); -- Podanie 8 (Anna) z rekruterem 3 (Agnieszka)
INSERT INTO rozmowa_kwalifikacyjna(rozmowa_id, podanie_id, rekruter_id, data_rozmowy, decyzja_id) VALUES (8, 9, 3, TO_DATE('2026-01-05', 'YYYY-MM-DD'), 5); -- Podanie 9 (John) z rekruterem 3 (Agnieszka)

-- Table: wyksztalcenie_cv
INSERT INTO wyksztalcenie_cv(cv_id, wyksztalcenie_id) VALUES (1, 3);  -- CV 1 (Luc) ma: Wyższe - Licencjat
INSERT INTO wyksztalcenie_cv(cv_id, wyksztalcenie_id) VALUES (2, 4);  -- CV 2 (Lucas) ma: Wyższe - Magister
INSERT INTO wyksztalcenie_cv(cv_id, wyksztalcenie_id) VALUES (3, 4);  -- CV 3 (Alice) ma: Wyższe - Magister
INSERT INTO wyksztalcenie_cv(cv_id, wyksztalcenie_id) VALUES (4, 2);  -- CV 4 (Marek) ma: Średnie
INSERT INTO wyksztalcenie_cv(cv_id, wyksztalcenie_id) VALUES (5, 4);  -- CV 5 (Jakub) ma: Wyższe - Magister
INSERT INTO wyksztalcenie_cv(cv_id, wyksztalcenie_id) VALUES (6, 3);  -- CV 6 (Paweł) ma: Wyższe - Licencjat
INSERT INTO wyksztalcenie_cv(cv_id, wyksztalcenie_id) VALUES (7, 4);  -- CV 7 (Michał) ma: Wyższe - Magister
INSERT INTO wyksztalcenie_cv(cv_id, wyksztalcenie_id) VALUES (8, 4);  -- CV 8 (Anna) ma: Wyższe - Magister
INSERT INTO wyksztalcenie_cv(cv_id, wyksztalcenie_id) VALUES (9, 3);  -- CV 9 (John) ma: Wyższe - Licencjat
INSERT INTO wyksztalcenie_cv(cv_id, wyksztalcenie_id) VALUES (10, 3); -- CV 10 (Carlos) ma: Wyższe - Licencjat
INSERT INTO wyksztalcenie_cv(cv_id, wyksztalcenie_id) VALUES (11, 4); -- CV 11 (Sato) ma: Wyższe - Magister
INSERT INTO wyksztalcenie_cv(cv_id, wyksztalcenie_id) VALUES (12, 3); -- CV 12 (Elena) ma: Wyższe - Licencjat

-- Table: wyksztalcenie_wakat
INSERT INTO wyksztalcenie_wakat(wyksztalcenie_id, wakat_id) VALUES (3, 1); -- Wakat 1 (Java Dev) wymaga: Wyższe - Licencjat
INSERT INTO wyksztalcenie_wakat(wyksztalcenie_id, wakat_id) VALUES (4, 2); -- Wakat 2 (Project Manager) wymaga: Wyższe - Magister
INSERT INTO wyksztalcenie_wakat(wyksztalcenie_id, wakat_id) VALUES (3, 3); -- Wakat 3 (UI/UX) wymaga: Wyższe - Licencjat
INSERT INTO wyksztalcenie_wakat(wyksztalcenie_id, wakat_id) VALUES (2, 4); -- Wakat 4 (Creative Manager) wymaga: Średnie

-- Table: umietnosci_cv
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (1, 5);   -- CV 5 (Jakub) potrafi: Programowanie Java
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (2, 5);   -- CV 5 (Jakub) potrafi: SQL i bazy danych
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (11, 5);  -- CV 5 (Jakub) potrafi: Praca w zespole
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (1, 1);   -- CV 1 (Luc) potrafi: Programowanie Java
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (3, 1);   -- CV 1 (Luc) potrafi: Analiza danych
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (1, 11);  -- CV 11 (Sato) potrafi: Programowanie Java
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (4, 2);   -- CV 2 (Lucas) potrafi: Zarządzanie projektami
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (6, 2);   -- CV 2 (Lucas) potrafi: Przywództwo
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (10, 2);  -- CV 2 (Lucas) potrafi: Komunikacja interpersonalna
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (6, 3);   -- CV 3 (Alice) potrafi: Przywództwo
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (10, 3);  -- CV 3 (Alice) potrafi: Komunikacja interpersonalna
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (11, 3);  -- CV 3 (Alice) potrafi: Praca w zespole
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (10, 4);  -- CV 4 (Marek) potrafi: Komunikacja interpersonalna
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (11, 4);  -- CV 4 (Marek) potrafi: Praca w zespole
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (7, 12);  -- CV 12 (Elena) potrafi: Projektowanie UI/UX
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (9, 12);  -- CV 12 (Elena) potrafi: Grafika komputerowa
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (12, 12); -- CV 12 (Elena) potrafi: Kreatywne rozwiązywanie problemów
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (8, 8);   -- CV 8 (Anna) potrafi: Montaż wideo
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (9, 8);   -- CV 8 (Anna) potrafi: Grafika komputerowa
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (9, 9);   -- CV 9 (John) potrafi: Grafika komputerowa
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (12, 9);  -- CV 9 (John) potrafi: Kreatywne rozwiązywanie problemów
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (5, 6);   -- CV 6 (Paweł) potrafi: Strategia marketingowa
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (6, 6);   -- CV 6 (Paweł) potrafi: Przywództwo
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (11, 6);  -- CV 6 (Paweł) potrafi: Praca w zespole
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (5, 7);   -- CV 7 (Michał) potrafi: Strategia marketingowa
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (12, 7);  -- CV 7 (Michał) potrafi: Kreatywność
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (6, 10);  -- CV 10 (Carlos) potrafi: Przywództwo
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (11, 10); -- CV 10 (Carlos) potrafi: Praca w zespole
INSERT INTO umietnosci_cv(umiejetnosci_id, cv_id) VALUES (7, 99); -- cv 99 (luc) Projektowanie UI/UX

-- Table: umietnosci_wakat
INSERT INTO umietnosci_wakat(umiejetnosci_id, wakat_id) VALUES (1, 1);  -- Wakat 1 (Java Dev) wymaga: Programowanie Java
INSERT INTO umietnosci_wakat(umiejetnosci_id, wakat_id) VALUES (2, 1);  -- Wakat 1 (Java Dev) wymaga: SQL i bazy danych
INSERT INTO umietnosci_wakat(umiejetnosci_id, wakat_id) VALUES (4, 2);  -- Wakat 2 (Project Manager) wymaga: Zarządzanie projektami
INSERT INTO umietnosci_wakat(umiejetnosci_id, wakat_id) VALUES (6, 2);  -- Wakat 2 (Project Manager) wymaga: Przywództwo
INSERT INTO umietnosci_wakat(umiejetnosci_id, wakat_id) VALUES (10, 2); -- Wakat 2 (Project Manager) wymaga: Komunikacja interpersonalna
INSERT INTO umietnosci_wakat(umiejetnosci_id, wakat_id) VALUES (7, 3);  -- Wakat 3 (UI/UX) wymaga: Projektowanie UI/UX
INSERT INTO umietnosci_wakat(umiejetnosci_id, wakat_id) VALUES (9, 3);  -- Wakat 3 (UI/UX) wymaga: Grafika komputerowa
INSERT INTO umietnosci_wakat(umiejetnosci_id, wakat_id) VALUES (12, 3); -- Wakat 3 (UI/UX) wymaga: Kreatywność
INSERT INTO umietnosci_wakat(umiejetnosci_id, wakat_id) VALUES (5, 4);  -- Wakat 4 (Creative Manager) wymaga: Strategia marketingowa
INSERT INTO umietnosci_wakat(umiejetnosci_id, wakat_id) VALUES (6, 4);  -- Wakat 4 (Creative Manager) wymaga: Przywództwo
INSERT INTO umietnosci_wakat(umiejetnosci_id, wakat_id) VALUES (11, 4); -- Wakat 4 (Creative Manager) wymaga: Praca w zespole

-- Table: jezyk_cv
INSERT INTO jezyk_cv(znajomosc_jezykow_id, cv_id) VALUES (6, 1);  -- CV 1 (Luc) zna: Polski
INSERT INTO jezyk_cv(znajomosc_jezykow_id, cv_id) VALUES (1, 1);  -- CV 1 (Luc) zna: Angielski
INSERT INTO jezyk_cv(znajomosc_jezykow_id, cv_id) VALUES (6, 2);  -- CV 2 (Lucas) zna: Polski
INSERT INTO jezyk_cv(znajomosc_jezykow_id, cv_id) VALUES (3, 2);  -- CV 2 (Lucas) zna: Francuski
INSERT INTO jezyk_cv(znajomosc_jezykow_id, cv_id) VALUES (1, 3);  -- CV 3 (Alice) zna: Angielski
INSERT INTO jezyk_cv(znajomosc_jezykow_id, cv_id) VALUES (6, 4);  -- CV 4 (Marek) zna: Polski
INSERT INTO jezyk_cv(znajomosc_jezykow_id, cv_id) VALUES (4, 4);  -- CV 4 (Marek) zna: Hiszpański
INSERT INTO jezyk_cv(znajomosc_jezykow_id, cv_id) VALUES (6, 5);  -- CV 5 (Jakub) zna: Polski
INSERT INTO jezyk_cv(znajomosc_jezykow_id, cv_id) VALUES (1, 5);  -- CV 5 (Jakub) zna: Angielski
INSERT INTO jezyk_cv(znajomosc_jezykow_id, cv_id) VALUES (2, 5);  -- CV 5 (Jakub) zna: Niemiecki
INSERT INTO jezyk_cv(znajomosc_jezykow_id, cv_id) VALUES (6, 6);  -- CV 6 (Paweł) zna: Polski
INSERT INTO jezyk_cv(znajomosc_jezykow_id, cv_id) VALUES (5, 6);  -- CV 6 (Paweł) zna: Japoński
INSERT INTO jezyk_cv(znajomosc_jezykow_id, cv_id) VALUES (6, 7);  -- CV 7 (Michał) zna: Polski
INSERT INTO jezyk_cv(znajomosc_jezykow_id, cv_id) VALUES (1, 7);  -- CV 7 (Michał) zna: Angielski
INSERT INTO jezyk_cv(znajomosc_jezykow_id, cv_id) VALUES (6, 8);  -- CV 8 (Anna) zna: Polski
INSERT INTO jezyk_cv(znajomosc_jezykow_id, cv_id) VALUES (2, 8);  -- CV 8 (Anna) zna: Niemiecki
INSERT INTO jezyk_cv(znajomosc_jezykow_id, cv_id) VALUES (6, 9);  -- CV 9 (John) zna: Polski
INSERT INTO jezyk_cv(znajomosc_jezykow_id, cv_id) VALUES (1, 9);  -- CV 9 (John) zna: Angielski
INSERT INTO jezyk_cv(znajomosc_jezykow_id, cv_id) VALUES (4, 10); -- CV 10 (Carlos) zna: Hiszpański
INSERT INTO jezyk_cv(znajomosc_jezykow_id, cv_id) VALUES (1, 10); -- CV 10 (Carlos) zna: Angielski
INSERT INTO jezyk_cv(znajomosc_jezykow_id, cv_id) VALUES (5, 11); -- CV 11 (Sato) zna: Japoński
INSERT INTO jezyk_cv(znajomosc_jezykow_id, cv_id) VALUES (1, 11); -- CV 11 (Sato) zna: Angielski
INSERT INTO jezyk_cv(znajomosc_jezykow_id, cv_id) VALUES (6, 12); -- CV 12 (Elena) zna: Polski
INSERT INTO jezyk_cv(znajomosc_jezykow_id, cv_id) VALUES (3, 12); -- CV 12 (Elena) zna: Francuski

-- Table: jezyk_wakat
INSERT INTO jezyk_wakat(wakat_id, znajomosc_jezykow_id) VALUES (1, 6); -- Wakat 1 (Java Dev) wymaga: Polski
INSERT INTO jezyk_wakat(wakat_id, znajomosc_jezykow_id) VALUES (1, 1); -- Wakat 1 (Java Dev) wymaga: Angielski
INSERT INTO jezyk_wakat(wakat_id, znajomosc_jezykow_id) VALUES (2, 6); -- Wakat 2 (Project Manager) wymaga: Polski
INSERT INTO jezyk_wakat(wakat_id, znajomosc_jezykow_id) VALUES (2, 1); -- Wakat 2 (Project Manager) wymaga: Angielski
INSERT INTO jezyk_wakat(wakat_id, znajomosc_jezykow_id) VALUES (2, 2); -- Wakat 2 (Project Manager) wymaga: Niemiecki
INSERT INTO jezyk_wakat(wakat_id, znajomosc_jezykow_id) VALUES (3, 1); -- Wakat 3 (UI/UX) wymaga: Angielski
INSERT INTO jezyk_wakat(wakat_id, znajomosc_jezykow_id) VALUES (4, 3); -- Wakat 4 (Creative Manager) wymaga: Francuski
INSERT INTO jezyk_wakat(wakat_id, znajomosc_jezykow_id) VALUES (4, 1); -- Wakat 4 (Creative Manager) wymaga: Angielski
commit;