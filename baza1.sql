--------------------------------------------------------
-- DDL for Table MNKLIENT
--------------------------------------------------------
 CREATE TABLE "HURTOWNIA"."MNKLIENT"
 ( "ID_KLIENTA" NUMBER(*,0),
"IMIE" VARCHAR2(50),
"NAZWISKO" VARCHAR2(50),
"WOJEWODZTWO" VARCHAR2(50),
"GMINA" VARCHAR2(50),
"ULICA" VARCHAR2(50),
"NR_BUDYNKU" VARCHAR2(50),
"PESEL" VARCHAR2(50),
"NUMER_TELEFONU" VARCHAR2(50)
 )
--------------------------------------------------------
-- DDL for Table MNKURIER
--------------------------------------------------------
 CREATE TABLE "HURTOWNIA"."MNKURIER"
 ( "ID_KURIERA" NUMBER(*,0),
"IMIE" VARCHAR2(50),
"NAZWISKO" VARCHAR2(50),
"FK_ID_UMOWY" NUMBER(*,0),
"FK_ID_SAMOCHODU" NUMBER(*,0),
"FK_ID_MAGAZYNU" NUMBER(*,0),
"WOJEWODZTWO" VARCHAR2(50),
"GMINA" VARCHAR2(50),
"ULICA" VARCHAR2(50),
"OBSLUGIWANE_WOJEWODZTWO" VARCHAR2(50),
"OBSLUGIWANA_GMINA" VARCHAR2(50),
"NUMER_TELEFONU" VARCHAR2(50),
"NR_BUDYNKU" VARCHAR2(50),
"PESEL" VARCHAR2(50)
 )
--------------------------------------------------------
-- DDL for Table MNMAGAZYN
--------------------------------------------------------
 CREATE TABLE "HURTOWNIA"."MNMAGAZYN"
 ( "ID_MAGAZYNU" NUMBER(*,0),
"ILOSC_PRACOWNIKOW" NUMBER(*,0),
"ILOSC_BRAM" NUMBER(*,0),
"WOJEWODZTWO" VARCHAR2(50),
"GMINA" VARCHAR2(50),
7
"ULICA" VARCHAR2(50),
"NR_BUDYNKU" VARCHAR2(50)
 )
--------------------------------------------------------
-- DDL for Table MNPACZKA
--------------------------------------------------------
 CREATE TABLE "HURTOWNIA"."MNPACZKA"
 ( "ID_PRZESYLKI" NUMBER(*,0),
"WAGA" NUMBER(*,0),
"SZEROKOSC_PACZKI" NUMBER(*,0),
"WYSOKOSC_PACZKI" NUMBER(*,0),
"DLUGOSC_PACZKI" NUMBER(*,0)
 )
--------------------------------------------------------
-- DDL for Table MNSAMOCHOD
--------------------------------------------------------
 CREATE TABLE "HURTOWNIA"."MNSAMOCHOD"
 ( "ID_SAMOCHODU" NUMBER(*,0),
"NR_REJESTRACYJNY" VARCHAR2(50),
"POJEMNOSC" NUMBER(*,0),
"MARKA" VARCHAR2(50)
 )
--------------------------------------------------------
-- DDL for Table MNUMOWA
--------------------------------------------------------
 CREATE TABLE "HURTOWNIA"."MNUMOWA"
 ( "ID_UMOWY" NUMBER(*,0),
"TYP" VARCHAR2(50),
"WYNAGRODZENIE" VARCHAR2(50),
"DATA_ROZPOCZECIA" DATE,
"DATA_ZAKONCZENIA" DATE
 )
--------------------------------------------------------
-- DDL for Table MNZLECENIE
--------------------------------------------------------
 CREATE TABLE "HURTOWNIA"."MNZLECENIE"
 ( "ID_ZLECENIA" NUMBER(*,0),
"KOSZT" NUMBER(*,0),
"WOJEWODZTWO_DOSTAWY" VARCHAR2(50),
"GMINA_DOSTAWY" VARCHAR2(50),
"ULICA_DOSTAWY" VARCHAR2(50),
"NR_BUDYNKU_DOSTAWY" VARCHAR2(50),
"WOJEWODZTWO_WYSLANIA" VARCHAR2(50),
"GMINA_WYSLANIA" VARCHAR2(50),
8
"NR_BUDYNKU_WYSLANIA" VARCHAR2(50),
"FK_ID_KLIENTA" NUMBER(*,0),
"FK_ID_KURIERA" NUMBER(*,0),
"FK_ID_PRZESYLKI" NUMBER(*,0),
"DATA_NADANIA" DATE,
"DATA_DOSTARCZENIA" DATE,
"DATA_DOSTARCZANIA_NA_MP" DATE,
"DATA_OPUSZCZENIA_MP" DATE,
"DATA_DOSTARCZENIA_NA_MK" DATE,
"DATA_OPUSZCZENIA_MK" DATE,
"PLANOWANY_CZAS_REALIZACJI" DATE,
"STATUS_REALIZACJI" VARCHAR2(50),
"FK_MAGAZYN_POCZATKOWY" NUMBER(*,0),
"FK_MAGAZYN_KONCOWY" NUMBER(*,0)
 )
--------------------------------------------------------
-- DDL for Index Klient_pkey
--------------------------------------------------------
 CREATE UNIQUE INDEX "HURTOWNIA"."Klient_pkey" ON "HURTOWNIA"."MNKLIENT"
("ID_KLIENTA")
--------------------------------------------------------
-- DDL for Index Kurier_pkey
--------------------------------------------------------
 CREATE UNIQUE INDEX "HURTOWNIA"."Kurier_pkey" ON "HURTOWNIA"."MNKURIER"
("ID_KURIERA")
--------------------------------------------------------
-- DDL for Index Magazyn_pkey
--------------------------------------------------------
 CREATE UNIQUE INDEX "HURTOWNIA"."Magazyn_pkey" ON
"HURTOWNIA"."MNMAGAZYN" ("ID_MAGAZYNU")
--------------------------------------------------------
-- DDL for Index Przesylka_pkey
--------------------------------------------------------
 CREATE UNIQUE INDEX "HURTOWNIA"."Przesylka_pkey" ON
"HURTOWNIA"."MNPACZKA" ("ID_PRZESYLKI")
--------------------------------------------------------
-- DDL for Index Samochod_pkey
--------------------------------------------------------
 CREATE UNIQUE INDEX "HURTOWNIA"."Samochod_pkey" ON
"HURTOWNIA"."MNSAMOCHOD" ("ID_SAMOCHODU")
--------------------------------------------------------
-- DDL for Index Umowa_pkey
--------------------------------------------------------
9
 CREATE UNIQUE INDEX "HURTOWNIA"."Umowa_pkey" ON
"HURTOWNIA"."MNUMOWA" ("ID_UMOWY")
--------------------------------------------------------
-- DDL for Index Zlecenie_pkey
--------------------------------------------------------
 CREATE UNIQUE INDEX "HURTOWNIA"."Zlecenie_pkey" ON
"HURTOWNIA"."MNZLECENIE" ("ID_ZLECENIA")
--------------------------------------------------------
-- Constraints for Table MNKLIENT
--------------------------------------------------------
 ALTER TABLE "HURTOWNIA"."MNKLIENT" ADD CONSTRAINT "Klient_pkey" PRIMARY
KEY ("ID_KLIENTA") ENABLE
 ALTER TABLE "HURTOWNIA"."MNKLIENT" MODIFY ("ID_KLIENTA" NOT NULL
ENABLE)
--------------------------------------------------------
-- Constraints for Table MNKURIER
--------------------------------------------------------
 ALTER TABLE "HURTOWNIA"."MNKURIER" ADD CONSTRAINT "Kurier_pkey" PRIMARY
KEY ("ID_KURIERA") ENABLE
 ALTER TABLE "HURTOWNIA"."MNKURIER" MODIFY ("ID_KURIERA" NOT NULL
ENABLE)
--------------------------------------------------------
-- Constraints for Table MNMAGAZYN
--------------------------------------------------------
 ALTER TABLE "HURTOWNIA"."MNMAGAZYN" ADD CONSTRAINT "Magazyn_pkey"
PRIMARY KEY ("ID_MAGAZYNU") ENABLE
 ALTER TABLE "HURTOWNIA"."MNMAGAZYN" MODIFY ("ID_MAGAZYNU" NOT NULL
ENABLE)
--------------------------------------------------------
-- Constraints for Table MNPACZKA
--------------------------------------------------------
 ALTER TABLE "HURTOWNIA"."MNPACZKA" ADD CONSTRAINT "Przesylka_pkey"
PRIMARY KEY ("ID_PRZESYLKI") ENABLE
 ALTER TABLE "HURTOWNIA"."MNPACZKA" MODIFY ("ID_PRZESYLKI" NOT NULL
ENABLE)
--------------------------------------------------------
-- Constraints for Table MNSAMOCHOD
--------------------------------------------------------
 ALTER TABLE "HURTOWNIA"."MNSAMOCHOD" ADD CONSTRAINT "Samochod_pkey"
PRIMARY KEY ("ID_SAMOCHODU") ENABLE
10
 ALTER TABLE "HURTOWNIA"."MNSAMOCHOD" MODIFY ("ID_SAMOCHODU" NOT
NULL ENABLE)
--------------------------------------------------------
-- Constraints for Table MNUMOWA
--------------------------------------------------------
 ALTER TABLE "HURTOWNIA"."MNUMOWA" ADD CONSTRAINT "Umowa_pkey"
PRIMARY KEY ("ID_UMOWY") ENABLE
 ALTER TABLE "HURTOWNIA"."MNUMOWA" MODIFY ("ID_UMOWY" NOT NULL
ENABLE)
--------------------------------------------------------
-- Constraints for Table MNZLECENIE
--------------------------------------------------------
 ALTER TABLE "HURTOWNIA"."MNZLECENIE" ADD CONSTRAINT "Zlecenie_pkey"
PRIMARY KEY ("ID_ZLECENIA") ENABLE
 ALTER TABLE "HURTOWNIA"."MNZLECENIE" MODIFY ("ID_ZLECENIA" NOT NULL
ENABLE)
--------------------------------------------------------
-- Ref Constraints for Table MNKURIER
--------------------------------------------------------
 ALTER TABLE "HURTOWNIA"."MNKURIER" ADD CONSTRAINT
"Kurier_fk_id_magazynu_fkey" FOREIGN KEY ("FK_ID_MAGAZYNU")
 REFERENCES "HURTOWNIA"."MNMAGAZYN" ("ID_MAGAZYNU") ENABLE
 ALTER TABLE "HURTOWNIA"."MNKURIER" ADD CONSTRAINT
"Kurier_fk_id_samochodu_fkey" FOREIGN KEY ("FK_ID_SAMOCHODU")
 REFERENCES "HURTOWNIA"."MNSAMOCHOD" ("ID_SAMOCHODU") ENABLE
 ALTER TABLE "HURTOWNIA"."MNKURIER" ADD CONSTRAINT
"Kurier_fk_id_umowy_fkey" FOREIGN KEY ("FK_ID_UMOWY")
 REFERENCES "HURTOWNIA"."MNUMOWA" ("ID_UMOWY") ENABLE
--------------------------------------------------------
-- Ref Constraints for Table MNZLECENIE
--------------------------------------------------------
 ALTER TABLE "HURTOWNIA"."MNZLECENIE" ADD CONSTRAINT
"Zlecenie_fk_id_klienta_fkey" FOREIGN KEY ("FK_ID_KLIENTA")
 REFERENCES "HURTOWNIA"."MNKLIENT" ("ID_KLIENTA") ENABLE
 ALTER TABLE "HURTOWNIA"."MNZLECENIE" ADD CONSTRAINT
"Zlecenie_fk_id_kuriera_fkey" FOREIGN KEY ("FK_ID_KURIERA")
 REFERENCES "HURTOWNIA"."MNKURIER" ("ID_KURIERA") ENABLE
 ALTER TABLE "HURTOWNIA"."MNZLECENIE" ADD CONSTRAINT
"Zlecenie_fk_id_przesylki_fkey" FOREIGN KEY ("FK_ID_PRZESYLKI")
 REFERENCES "HURTOWNIA"."MNPACZKA" ("ID_PRZESYLKI") ENABLE
 ALTER TABLE "HURTOWNIA"."MNZLECENIE" ADD CONSTRAINT
"Zlecenie_fk_mk_fkey" FOREIGN KEY ("FK_MAGAZYN_KONCOWY")
 REFERENCES "HURTOWNIA"."MNMAGAZYN" ("ID_MAGAZYNU") ENABLE
11
 ALTER TABLE "HURTOWNIA"."MNZLECENIE" ADD CONSTRAINT
"Zlecenie_fk_mp_fkey" FOREIGN KEY ("FK_MAGAZYN_POCZATKOWY")
 REFERENCES "HURTOWNIA"."MNMAGAZYN" ("ID_MAGAZYNU") ENABLE