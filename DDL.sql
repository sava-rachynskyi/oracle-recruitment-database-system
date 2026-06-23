-- tables
-- Table: address
CREATE TABLE address (
    id integer  NOT NULL,
    miasto_id integer  NOT NULL,
    ulica varchar2(32)  NOT NULL,
    local varchar2(5)  NOT NULL,
    CONSTRAINT address_pk PRIMARY KEY (id)
) ;

-- Table: cv
CREATE TABLE cv (
    cv_id integer  NOT NULL,
    kandydat_id integer  NOT NULL,
    poczatek_pirwsz_pracy date  NULL,
    CONSTRAINT cv_pk PRIMARY KEY (cv_id)
) ;

-- Table: decyzja
CREATE TABLE decyzja (
    id integer  NOT NULL,
    czy_wziety smallint  NOT NULL,
    data date  NOT NULL,
    CONSTRAINT decyzja_pk PRIMARY KEY (id)
) ;

-- Table: jezyk_cv
CREATE TABLE jezyk_cv (
    znajomosc_jezykow_id integer  NOT NULL,
    cv_id integer  NOT NULL,
    CONSTRAINT jezyk_cv_pk PRIMARY KEY (znajomosc_jezykow_id,cv_id)
) ;

-- Table: jezyk_wakat
CREATE TABLE jezyk_wakat (
    wakat_id integer  NOT NULL,
    znajomosc_jezykow_id integer  NOT NULL,
    CONSTRAINT jezyk_wakat_pk PRIMARY KEY (wakat_id,znajomosc_jezykow_id)
) ;

-- Table: kandydat
CREATE TABLE kandydat (
    id integer  NOT NULL,
    CONSTRAINT kandydat_pk PRIMARY KEY (id)
) ;

-- Table: kraj
CREATE TABLE kraj (
    id integer  NOT NULL,
    nazwa varchar2(32)  NOT NULL,
    CONSTRAINT kraj_pk PRIMARY KEY (id)
) ;

-- Table: miasto
CREATE TABLE miasto (
    id integer  NOT NULL,
    nazwa varchar2(32)  NOT NULL,
    kraj_id integer  NOT NULL,
    CONSTRAINT miasto_pk PRIMARY KEY (id)
) ;

-- Table: osoba
CREATE TABLE osoba (
    osoba_id integer  NOT NULL,
    Imie varchar2(32)  NOT NULL,
    nazwisko varchar2(32)  NOT NULL,
    email varchar2(32)  NULL,
    telefon varchar2(9)  NOT NULL,
    address_id integer  NOT NULL,
    CONSTRAINT osoba_pk PRIMARY KEY (osoba_id)
) ;

-- Table: podanie
CREATE TABLE podanie (
    id integer  NOT NULL,
    wakat_id integer  NOT NULL,
    data_zlozenia date  NOT NULL,
    status_podania_id integer  NOT NULL,
    cv_cv_id integer  NOT NULL,
    CONSTRAINT podanie_pk PRIMARY KEY (id)
) ;

-- Table: pracodawca
CREATE TABLE pracodawca (
    pracodawca_id integer  NOT NULL,
    nazwa_firmy varchar2(32)  NOT NULL,
    address_id integer  NOT NULL,
    CONSTRAINT pracodawca_pk PRIMARY KEY (pracodawca_id)
) ;

-- Table: rekruter
CREATE TABLE rekruter (
    id integer  NOT NULL,
    pensja number(7,2)  NOT NULL,
    CONSTRAINT rekruter_pk PRIMARY KEY (id)
) ;

-- Table: rozmowa_kwalifikacyjna
CREATE TABLE rozmowa_kwalifikacyjna (
    rozmowa_id integer  NOT NULL,
    podanie_id integer  NOT NULL,
    rekruter_id integer  NOT NULL,
    data_rozmowy date  NULL,
    decyzja_id integer  NOT NULL,
    CONSTRAINT rozmowa_kwalifikacyjna_pk PRIMARY KEY (rozmowa_id)
) ;

-- Table: status_podania
CREATE TABLE status_podania (
    id integer  NOT NULL,
    nazwa varchar2(16)  NOT NULL,
    CONSTRAINT status_podania_pk PRIMARY KEY (id)
) ;

-- Table: umiejetnosci
CREATE TABLE umiejetnosci (
    id integer  NOT NULL,
    nazwa varchar2(64)  NOT NULL,
    CONSTRAINT umiejetnosci_pk PRIMARY KEY (id)
) ;

-- Table: umietnosci_cv
CREATE TABLE umietnosci_cv (
    umiejetnosci_id integer  NOT NULL,
    cv_id integer  NOT NULL,
    CONSTRAINT umietnosci_cv_pk PRIMARY KEY (umiejetnosci_id,cv_id)
) ;

-- Table: umietnosci_wakat
CREATE TABLE umietnosci_wakat (
    umiejetnosci_id integer  NOT NULL,
    wakat_id integer  NOT NULL,
    CONSTRAINT umietnosci_wakat_pk PRIMARY KEY (umiejetnosci_id,wakat_id)
) ;

-- Table: wakat
CREATE TABLE wakat (
    wakat_id integer  NOT NULL,
    pracodawca_id integer  NOT NULL,
    stanowisko varchar2(256)  NOT NULL,
    branza varchar2(128)  NOT NULL,
    data_dodania date  NOT NULL,
    data_waznosci date  NOT NULL,
    pensja number(7,2)  NOT NULL,
    address_id integer  NOT NULL,
    rekruter_id integer  NOT NULL,
    wymagane_doswiadczenie integer  NULL,
    CONSTRAINT wakat_pk PRIMARY KEY (wakat_id)
) ;

-- Table: wyksztalcenie
CREATE TABLE wyksztalcenie (
    id integer  NOT NULL,
    nazwa varchar2(64)  NOT NULL,
    CONSTRAINT wyksztalcenie_pk PRIMARY KEY (id)
) ;

-- Table: wyksztalcenie_cv
CREATE TABLE wyksztalcenie_cv (
    cv_id integer  NOT NULL,
    wyksztalcenie_id integer  NOT NULL,
    CONSTRAINT wyksztalcenie_cv_pk PRIMARY KEY (cv_id,wyksztalcenie_id)
) ;

-- Table: wyksztalcenie_wakat
CREATE TABLE wyksztalcenie_wakat (
    wyksztalcenie_id integer  NOT NULL,
    wakat_id integer  NOT NULL,
    CONSTRAINT wyksztalcenie_wakat_pk PRIMARY KEY (wyksztalcenie_id,wakat_id)
) ;

-- Table: znajomosc_jezykow
CREATE TABLE znajomosc_jezykow (
    id integer  NOT NULL,
    nazwa varchar2(64)  NOT NULL,
    CONSTRAINT znajomosc_jezykow_pk PRIMARY KEY (id)
) ;

-- foreign keys
-- Reference: Table_22_cv (table: wyksztalcenie_cv)
ALTER TABLE wyksztalcenie_cv ADD CONSTRAINT Table_22_cv
    FOREIGN KEY (cv_id)
    REFERENCES cv (cv_id);

-- Reference: Table_22_wyksztalcenie (table: wyksztalcenie_cv)
ALTER TABLE wyksztalcenie_cv ADD CONSTRAINT Table_22_wyksztalcenie
    FOREIGN KEY (wyksztalcenie_id)
    REFERENCES wyksztalcenie (id);

-- Reference: Table_23_wakat (table: wyksztalcenie_wakat)
ALTER TABLE wyksztalcenie_wakat ADD CONSTRAINT Table_23_wakat
    FOREIGN KEY (wakat_id)
    REFERENCES wakat (wakat_id);

-- Reference: Table_23_wyksztalcenie (table: wyksztalcenie_wakat)
ALTER TABLE wyksztalcenie_wakat ADD CONSTRAINT Table_23_wyksztalcenie
    FOREIGN KEY (wyksztalcenie_id)
    REFERENCES wyksztalcenie (id);

-- Reference: Table_24_cv (table: umietnosci_cv)
ALTER TABLE umietnosci_cv ADD CONSTRAINT Table_24_cv
    FOREIGN KEY (cv_id)
    REFERENCES cv (cv_id);

-- Reference: Table_24_umiejetnosci (table: umietnosci_cv)
ALTER TABLE umietnosci_cv ADD CONSTRAINT Table_24_umiejetnosci
    FOREIGN KEY (umiejetnosci_id)
    REFERENCES umiejetnosci (id);

-- Reference: Table_25_umiejetnosci (table: umietnosci_wakat)
ALTER TABLE umietnosci_wakat ADD CONSTRAINT Table_25_umiejetnosci
    FOREIGN KEY (umiejetnosci_id)
    REFERENCES umiejetnosci (id);

-- Reference: Table_25_wakat (table: umietnosci_wakat)
ALTER TABLE umietnosci_wakat ADD CONSTRAINT Table_25_wakat
    FOREIGN KEY (wakat_id)
    REFERENCES wakat (wakat_id);

-- Reference: Table_26_wakat (table: jezyk_wakat)
ALTER TABLE jezyk_wakat ADD CONSTRAINT Table_26_wakat
    FOREIGN KEY (wakat_id)
    REFERENCES wakat (wakat_id);

-- Reference: Table_26_znajomosc_jezykow (table: jezyk_wakat)
ALTER TABLE jezyk_wakat ADD CONSTRAINT Table_26_znajomosc_jezykow
    FOREIGN KEY (znajomosc_jezykow_id)
    REFERENCES znajomosc_jezykow (id);

-- Reference: Table_27_cv (table: jezyk_cv)
ALTER TABLE jezyk_cv ADD CONSTRAINT Table_27_cv
    FOREIGN KEY (cv_id)
    REFERENCES cv (cv_id);

-- Reference: Table_27_znajomosc_jezykow (table: jezyk_cv)
ALTER TABLE jezyk_cv ADD CONSTRAINT Table_27_znajomosc_jezykow
    FOREIGN KEY (znajomosc_jezykow_id)
    REFERENCES znajomosc_jezykow (id);

-- Reference: address_miasto (table: address)
ALTER TABLE address ADD CONSTRAINT address_miasto
    FOREIGN KEY (miasto_id)
    REFERENCES miasto (id);

-- Reference: cv_kandydat (table: cv)
ALTER TABLE cv ADD CONSTRAINT cv_kandydat
    FOREIGN KEY (kandydat_id)
    REFERENCES kandydat (id);

-- Reference: historia_decyzja (table: rozmowa_kwalifikacyjna)
ALTER TABLE rozmowa_kwalifikacyjna ADD CONSTRAINT historia_decyzja
    FOREIGN KEY (decyzja_id)
    REFERENCES decyzja (id);

-- Reference: historia_podanie (table: rozmowa_kwalifikacyjna)
ALTER TABLE rozmowa_kwalifikacyjna ADD CONSTRAINT historia_podanie
    FOREIGN KEY (podanie_id)
    REFERENCES podanie (id);

-- Reference: historia_rekruter (table: rozmowa_kwalifikacyjna)
ALTER TABLE rozmowa_kwalifikacyjna ADD CONSTRAINT historia_rekruter
    FOREIGN KEY (rekruter_id)
    REFERENCES rekruter (id);

-- Reference: kandydat_osoba (table: kandydat)
ALTER TABLE kandydat ADD CONSTRAINT kandydat_osoba
    FOREIGN KEY (id)
    REFERENCES osoba (osoba_id);

-- Reference: miasto_kraj (table: miasto)
ALTER TABLE miasto ADD CONSTRAINT miasto_kraj
    FOREIGN KEY (kraj_id)
    REFERENCES kraj (id);

-- Reference: osoba_adress (table: osoba)
ALTER TABLE osoba ADD CONSTRAINT osoba_adress
    FOREIGN KEY (address_id)
    REFERENCES address (id);

-- Reference: podanie_cv (table: podanie)
ALTER TABLE podanie ADD CONSTRAINT podanie_cv
    FOREIGN KEY (cv_cv_id)
    REFERENCES cv (cv_id);

-- Reference: podanie_status_podania (table: podanie)
ALTER TABLE podanie ADD CONSTRAINT podanie_status_podania
    FOREIGN KEY (status_podania_id)
    REFERENCES status_podania (id);

-- Reference: podanie_wakat (table: podanie)
ALTER TABLE podanie ADD CONSTRAINT podanie_wakat
    FOREIGN KEY (wakat_id)
    REFERENCES wakat (wakat_id);

-- Reference: pracodawca_adress (table: pracodawca)
ALTER TABLE pracodawca ADD CONSTRAINT pracodawca_adress
    FOREIGN KEY (address_id)
    REFERENCES address (id);

-- Reference: rekruter_osoba (table: rekruter)
ALTER TABLE rekruter ADD CONSTRAINT rekruter_osoba
    FOREIGN KEY (id)
    REFERENCES osoba (osoba_id);

-- Reference: wakat_adress (table: wakat)
ALTER TABLE wakat ADD CONSTRAINT wakat_adress
    FOREIGN KEY (address_id)
    REFERENCES address (id);

-- Reference: wakat_pracodawca (table: wakat)
ALTER TABLE wakat ADD CONSTRAINT wakat_pracodawca
    FOREIGN KEY (pracodawca_id)
    REFERENCES pracodawca (pracodawca_id);

-- Reference: wakat_rekruter (table: wakat)
ALTER TABLE wakat ADD CONSTRAINT wakat_rekruter
    FOREIGN KEY (rekruter_id)
    REFERENCES rekruter (id);

-- End of file.

