--DROP TABLE ktpojazd cascade constraints;
--DROP TABLE ktmagazyn cascade constraints;
--DROP TABLE ktpracownik cascade constraints;
--DROP TABLE ktumowa_pracownika cascade constraints;
--DROP TABLE ktparagon cascade constraints;
--DROP TABLE ktklient cascade constraints;
--DROP TABLE ktzamowienie cascade constraints;
--DROP TABLE ktpaczka cascade constraints;
CREATE TABLE ktpojazd (
id NUMBER(8) NOT NULL,
marka VARCHAR2(50),
rodzaj VARCHAR2(10),
nazwa VARCHAR2(60),
ostatnia_kontrola DATE,
pojemnosc NUMBER(9),

CONSTRAINT ktpojazd_pk PRIMARY KEY (id)
);
CREATE TABLE ktmagazyn (
id NUMBER(8) NOT NULL,
miasto VARCHAR2(50),
gmina VARCHAR2(50),
adress VARCHAR2(50),
kraj VARCHAR2(60),
kod_pocztowy NUMBER(9),
pojemnosc NUMBER(9),
ilosc_pracownikow NUMBER(9),
CONSTRAINT ktmagazyn_pk PRIMARY KEY (id)
);
CREATE TABLE ktpracownik (
id NUMBER(8) NOT NULL,
nazwisko VARCHAR2(30),
imie VARCHAR2(30),
stanowisko VARCHAR2(40),
email VARCHAR2(60),
ktmagazyn_id NUMBER(8) NOT NULL,
ktpojazd_id NUMBER(8) NOT NULL,
CONSTRAINT ktpracownik_pk PRIMARY KEY (id),
CONSTRAINT ktpracownik_fk_magazyn FOREIGN KEY(ktmagazyn_id) REFERENCES
ktmagazyn(id),
14
CONSTRAINT ktpracownik_fk_pojazd FOREIGN KEY(ktpojazd_id) REFERENCES
ktpojazd(id)
);
CREATE TABLE ktumowa_pracownika (
id NUMBER(8) NOT NULL,
miasto VARCHAR2(50),
adress VARCHAR2(50),
rejon VARCHAR2(50),
kraj VARCHAR2(60),
kod_pocztowy NUMBER(9),
telefon NUMBER(13),
ktpracownik_id NUMBER(8) NOT NULL,
CONSTRAINT ktumowa_prac_pk PRIMARY KEY(id),
CONSTRAINT ktumowa_prac_fk_pracownik FOREIGN KEY(ktpracownik_id)
REFERENCES ktpracownik(id)
);
CREATE TABLE ktparagon (
id NUMBER(8) NOT NULL,
kwota NUMBER(10),
typ_płatności VARCHAR2(50),
data_wystawienia DATE,
 CONSTRAINT ktparagon_pk PRIMARY KEY (id)
);
CREATE TABLE ktklient (
id NUMBER(8) NOT NULL,
nazwa_firmy VARCHAR2(50),
nazwa_kontaktu VARCHAR2(50),
tytuł_firmy VARCHAR2(50),
adress VARCHAR2(50),
miasto VARCHAR2(50),
rejon VARCHAR2(50),
gmina VARCHAR2(50),
kod_pocztowy NUMBER(9),
kraj VARCHAR2(60),
telefon NUMBER(13),
CONSTRAINT ktklient_pk PRIMARY KEY (id)
);
CREATE TABLE ktzamowienie (
id NUMBER(8) NOT NULL,
gmina_nadania VARCHAR2(50),
gmina_odbioru VARCHAR2(50),
data_nadania DATE,
15
data_dostarczenia DATE,
data_dostarczenia_na_magazyn_po DATE,
data_opuszczenia_magazynu_ko DATE,
planowany_czas_realizacji DATE,
stan_reklamacji VARCHAR2(20),
czy_zgubiona VARCHAR2(20),
czy_zrealizowana VARCHAR2(20),
ktparagon_id NUMBER(8) NOT NULL,
ktklient_id NUMBER(8) NOT NULL,
ktmagazyn_po_id NUMBER(8) NOT NULL,
ktmagazyn_ko_id NUMBER(8) NOT NULL,
CONSTRAINT ktzamowienie_pk PRIMARY KEY (id),
CONSTRAINT ktzamowienie_fk_klient FOREIGN KEY(ktklient_id) REFERENCES
ktklient(id),
CONSTRAINT ktzamowienie_fk_paragon FOREIGN KEY(ktparagon_id) REFERENCES
ktparagon(id),
CONSTRAINT ktzamowienie_fk_magazyn_po FOREIGN KEY(ktmagazyn_po_id)
REFERENCES ktmagazyn(id),
CONSTRAINT ktzamowienie_fk_magazyn_ko FOREIGN KEY(ktmagazyn_ko_id)
REFERENCES ktmagazyn(id)
);
CREATE TABLE ktpaczka (
id NUMBER(8) NOT NULL,
waga NUMBER(10),
typ VARCHAR2(50),
miasto VARCHAR2(50),
adress VARCHAR2(50),
rejon VARCHAR2(50),
kraj VARCHAR2(60),
kod_pocztowy NUMBER(9),
telefon NUMBER(13),
rozmiar_x NUMBER(10),
rozmiar_y NUMBER(10),
rozmiar_z NUMBER(10),
ktpracownik_id NUMBER(8) NOT NULL,
ktzamowienie_id NUMBER(10) NOT NULL,
CONSTRAINT ktpaczka_pk PRIMARY KEY (id),
CONSTRAINT ktpaczka_fk_pracownik FOREIGN KEY(ktpracownik_id) REFERENCES
ktpracownik(id),
CONSTRAINT ktpaczka_fk_zamowienie FOREIGN KEY(ktzamowienie_id) REFERENCES
ktzamowienie(id)
);