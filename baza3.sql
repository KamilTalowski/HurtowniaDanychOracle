--------------------------------------------------------
-- File created - poniedziałek-grudzień-16-2019
--------------------------------------------------------
--------------------------------------------------------
-- DDL for Table PG_ADRES
--------------------------------------------------------
 CREATE TABLE "HURTOWNIA"."PG_ADRES"
 ( "ID" NUMBER(10,0),
"ULICA" VARCHAR2(40),
"NR_DOMU" VARCHAR2(10),
"KRAJ" VARCHAR2(20),
"KOD_POCZTOWY" VARCHAR2(10),
"REGION" VARCHAR2(20)
 )
--------------------------------------------------------
-- DDL for Table PG_DOSTARCZENIE
--------------------------------------------------------
 CREATE TABLE "HURTOWNIA"."PG_DOSTARCZENIE"
 ( "ID" NUMBER(10,0),
"ID_ZAMOWIENIA" NUMBER(10,0),
"DATA_WYDANIA" DATE,
"DATA_DOSTARCZENIA" DATE,
"CZY_DOSTARCZONO" VARCHAR2(5)
 )
--------------------------------------------------------
-- DDL for Table PG_KLIENT
--------------------------------------------------------
 CREATE TABLE "HURTOWNIA"."PG_KLIENT"
 ( "ID" NUMBER(10,0),
"IMIE" VARCHAR2(20),
"NAZWISKO" VARCHAR2(40),
"ULICA" VARCHAR2(40),
"NR_DOMU" VARCHAR2(10),
"NR_MIESZKANIA" VARCHAR2(10),
"MIASTO" VARCHAR2(40),
"KOD_POCZTOWY" VARCHAR2(10),
"REGION" VARCHAR2(20),
"KRAJ" VARCHAR2(20),
"NR_TELEFONU" VARCHAR2(40),
"PROCENT_ZNIZKI" NUMBER(10,0)
 )
18
--------------------------------------------------------
-- DDL for Table PG_KURIER
--------------------------------------------------------
 CREATE TABLE "HURTOWNIA"."PG_KURIER"
 ( "ID" NUMBER(10,0),
"ID_POJAZDU" NUMBER(10,0),
"IMIE" VARCHAR2(20),
"NAZWISKO" VARCHAR2(30)
 )
--------------------------------------------------------
-- DDL for Table PG_PACZKA
--------------------------------------------------------
 CREATE TABLE "HURTOWNIA"."PG_PACZKA"
 ( "ID" NUMBER(10,0),
"ID_ZAMOWIENIA" NUMBER(10,0),
"ID_KURIERA" NUMBER(10,0),
"ID_STACJI_POCZATKOWEJ" NUMBER(10,0),
"ID_STACJI_KONCOWEJ" NUMBER(10,0),
"ID_ADRESU" NUMBER(10,0),
"DATA_NADANIA" DATE,
"DATA_PRZYJECIA" DATE,
"SZEROKOSC" NUMBER(10,0),
"WYSOKOSC" NUMBER(10,0),
"DLUGOSC" NUMBER(10,0),
"WAGA" NUMBER(10,0)
 )
--------------------------------------------------------
-- DDL for Table PG_POJAZD
--------------------------------------------------------
 CREATE TABLE "HURTOWNIA"."PG_POJAZD"
 ( "ID" NUMBER(10,0),
"ID_STACJI" NUMBER(10,0),
"POJEMNOSC" NUMBER(10,0)
 )
--------------------------------------------------------
-- DDL for Table PG_STACJA
--------------------------------------------------------
 CREATE TABLE "HURTOWNIA"."PG_STACJA"
 ( "ID" NUMBER(10,0),
"ID_ADRESU" NUMBER(10,0),
"LICZBA_POJAZDOW" NUMBER(10,0)
 )
--------------------------------------------------------
-- DDL for Table PG_ZAMOWIENIE
19
--------------------------------------------------------
 CREATE TABLE "HURTOWNIA"."PG_ZAMOWIENIE"
 ( "ID" NUMBER(10,0),
"ID_KLIENTA" NUMBER(10,0),
"CENA" NUMBER(10,0),
"PLANOWANY_CZAS_REALIZACJI_DNI" NUMBER(10,0)
 )
 CREATE UNIQUE INDEX "HURTOWNIA"."SYS_C008959" ON
"HURTOWNIA"."PG_ADRES" ("ID")
 CREATE UNIQUE INDEX "HURTOWNIA"."SYS_C008984" ON
"HURTOWNIA"."PG_DOSTARCZENIE" ("ID")
 CREATE UNIQUE INDEX "HURTOWNIA"."SYS_C008972" ON
"HURTOWNIA"."PG_KLIENT" ("ID")
 CREATE UNIQUE INDEX "HURTOWNIA"."SYS_C009000" ON
"HURTOWNIA"."PG_KURIER" ("ID")
 CREATE UNIQUE INDEX "HURTOWNIA"."SYS_C009014" ON
"HURTOWNIA"."PG_PACZKA" ("ID")
 CREATE UNIQUE INDEX "HURTOWNIA"."SYS_C008994" ON
"HURTOWNIA"."PG_POJAZD" ("ID")
 CREATE UNIQUE INDEX "HURTOWNIA"."SYS_C008989" ON
"HURTOWNIA"."PG_STACJA" ("ID")
 CREATE UNIQUE INDEX "HURTOWNIA"."SYS_C008977" ON
"HURTOWNIA"."PG_ZAMOWIENIE" ("ID")
--------------------------------------------------------
-- Constraints for Table PG_ADRES
--------------------------------------------------------
 ALTER TABLE "HURTOWNIA"."PG_ADRES" ADD PRIMARY KEY ("ID") ENABLE
 ALTER TABLE "HURTOWNIA"."PG_ADRES" MODIFY ("REGION" NOT NULL ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_ADRES" MODIFY ("KOD_POCZTOWY" NOT NULL
ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_ADRES" MODIFY ("KRAJ" NOT NULL ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_ADRES" MODIFY ("NR_DOMU" NOT NULL
ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_ADRES" MODIFY ("ULICA" NOT NULL ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_ADRES" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
-- Constraints for Table PG_DOSTARCZENIE
--------------------------------------------------------
20
 ALTER TABLE "HURTOWNIA"."PG_DOSTARCZENIE" ADD PRIMARY KEY ("ID")
ENABLE
 ALTER TABLE "HURTOWNIA"."PG_DOSTARCZENIE" MODIFY ("CZY_DOSTARCZONO"
NOT NULL ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_DOSTARCZENIE" MODIFY
("DATA_DOSTARCZENIA" NOT NULL ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_DOSTARCZENIE" MODIFY ("DATA_WYDANIA" NOT
NULL ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_DOSTARCZENIE" MODIFY ("ID_ZAMOWIENIA"
NOT NULL ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_DOSTARCZENIE" MODIFY ("ID" NOT NULL
ENABLE)
--------------------------------------------------------
-- Constraints for Table PG_KLIENT
--------------------------------------------------------
 ALTER TABLE "HURTOWNIA"."PG_KLIENT" ADD PRIMARY KEY ("ID") ENABLE
 ALTER TABLE "HURTOWNIA"."PG_KLIENT" MODIFY ("PROCENT_ZNIZKI" NOT NULL
ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_KLIENT" MODIFY ("NR_TELEFONU" NOT NULL
ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_KLIENT" MODIFY ("KRAJ" NOT NULL ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_KLIENT" MODIFY ("REGION" NOT NULL ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_KLIENT" MODIFY ("KOD_POCZTOWY" NOT NULL
ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_KLIENT" MODIFY ("MIASTO" NOT NULL ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_KLIENT" MODIFY ("NR_MIESZKANIA" NOT NULL
ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_KLIENT" MODIFY ("NR_DOMU" NOT NULL
ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_KLIENT" MODIFY ("ULICA" NOT NULL ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_KLIENT" MODIFY ("NAZWISKO" NOT NULL
ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_KLIENT" MODIFY ("IMIE" NOT NULL ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_KLIENT" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
-- Constraints for Table PG_KURIER
--------------------------------------------------------
 ALTER TABLE "HURTOWNIA"."PG_KURIER" ADD PRIMARY KEY ("ID") ENABLE
 ALTER TABLE "HURTOWNIA"."PG_KURIER" MODIFY ("NAZWISKO" NOT NULL
ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_KURIER" MODIFY ("IMIE" NOT NULL ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_KURIER" MODIFY ("ID_POJAZDU" NOT NULL
ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_KURIER" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
21
-- Constraints for Table PG_PACZKA
--------------------------------------------------------
 ALTER TABLE "HURTOWNIA"."PG_PACZKA" ADD PRIMARY KEY ("ID") ENABLE
 ALTER TABLE "HURTOWNIA"."PG_PACZKA" MODIFY ("WAGA" NOT NULL ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_PACZKA" MODIFY ("DLUGOSC" NOT NULL
ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_PACZKA" MODIFY ("WYSOKOSC" NOT NULL
ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_PACZKA" MODIFY ("SZEROKOSC" NOT NULL
ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_PACZKA" MODIFY ("DATA_PRZYJECIA" NOT NULL
ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_PACZKA" MODIFY ("DATA_NADANIA" NOT NULL
ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_PACZKA" MODIFY ("ID_ADRESU" NOT NULL
ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_PACZKA" MODIFY ("ID_STACJI_KONCOWEJ" NOT
NULL ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_PACZKA" MODIFY ("ID_STACJI_POCZATKOWEJ"
NOT NULL ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_PACZKA" MODIFY ("ID_KURIERA" NOT NULL
ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_PACZKA" MODIFY ("ID_ZAMOWIENIA" NOT NULL
ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_PACZKA" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
-- Constraints for Table PG_POJAZD
--------------------------------------------------------
 ALTER TABLE "HURTOWNIA"."PG_POJAZD" ADD PRIMARY KEY ("ID") ENABLE
 ALTER TABLE "HURTOWNIA"."PG_POJAZD" MODIFY ("POJEMNOSC" NOT NULL
ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_POJAZD" MODIFY ("ID_STACJI" NOT NULL
ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_POJAZD" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
-- Constraints for Table PG_STACJA
--------------------------------------------------------
 ALTER TABLE "HURTOWNIA"."PG_STACJA" ADD PRIMARY KEY ("ID") ENABLE
 ALTER TABLE "HURTOWNIA"."PG_STACJA" MODIFY ("LICZBA_POJAZDOW" NOT
NULL ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_STACJA" MODIFY ("ID_ADRESU" NOT NULL
ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_STACJA" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
-- Constraints for Table PG_ZAMOWIENIE
22
--------------------------------------------------------
 ALTER TABLE "HURTOWNIA"."PG_ZAMOWIENIE" ADD PRIMARY KEY ("ID") ENABLE
 ALTER TABLE "HURTOWNIA"."PG_ZAMOWIENIE" MODIFY
("PLANOWANY_CZAS_REALIZACJI_DNI" NOT NULL ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_ZAMOWIENIE" MODIFY ("CENA" NOT NULL
ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_ZAMOWIENIE" MODIFY ("ID_KLIENTA" NOT NULL
ENABLE)
 ALTER TABLE "HURTOWNIA"."PG_ZAMOWIENIE" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
-- Ref Constraints for Table PG_DOSTARCZENIE
--------------------------------------------------------
 ALTER TABLE "HURTOWNIA"."PG_DOSTARCZENIE" ADD CONSTRAINT
"DOSTARCZENIE_IBFK_1" FOREIGN KEY ("ID_ZAMOWIENIA")
 REFERENCES "HURTOWNIA"."PG_ZAMOWIENIE" ("ID") ENABLE
--------------------------------------------------------
-- Ref Constraints for Table PG_KURIER
--------------------------------------------------------
 ALTER TABLE "HURTOWNIA"."PG_KURIER" ADD CONSTRAINT "KURIER_IBFK_1"
FOREIGN KEY ("ID_POJAZDU")
 REFERENCES "HURTOWNIA"."PG_POJAZD" ("ID") ENABLE
--------------------------------------------------------
-- Ref Constraints for Table PG_PACZKA
--------------------------------------------------------
 ALTER TABLE "HURTOWNIA"."PG_PACZKA" ADD CONSTRAINT "PACZKA_IBFK_1"
FOREIGN KEY ("ID_ZAMOWIENIA")
 REFERENCES "HURTOWNIA"."PG_ZAMOWIENIE" ("ID") ENABLE
 ALTER TABLE "HURTOWNIA"."PG_PACZKA" ADD CONSTRAINT "PACZKA_IBFK_2"
FOREIGN KEY ("ID_KURIERA")
 REFERENCES "HURTOWNIA"."PG_KURIER" ("ID") ENABLE
 ALTER TABLE "HURTOWNIA"."PG_PACZKA" ADD CONSTRAINT "PACZKA_IBFK_3"
FOREIGN KEY ("ID_STACJI_POCZATKOWEJ")
 REFERENCES "HURTOWNIA"."PG_STACJA" ("ID") ENABLE
 ALTER TABLE "HURTOWNIA"."PG_PACZKA" ADD CONSTRAINT "PACZKA_IBFK_4"
FOREIGN KEY ("ID_STACJI_KONCOWEJ")
 REFERENCES "HURTOWNIA"."PG_STACJA" ("ID") ENABLE
 ALTER TABLE "HURTOWNIA"."PG_PACZKA" ADD CONSTRAINT "PACZKA_IBFK_5"
FOREIGN KEY ("ID_ADRESU")
 REFERENCES "HURTOWNIA"."PG_ADRES" ("ID") ENABLE
--------------------------------------------------------
-- Ref Constraints for Table PG_POJAZD
--------------------------------------------------------
23
 ALTER TABLE "HURTOWNIA"."PG_POJAZD" ADD CONSTRAINT "POJAZD_IBFK_1"
FOREIGN KEY ("ID_STACJI")
 REFERENCES "HURTOWNIA"."PG_STACJA" ("ID") ENABLE
--------------------------------------------------------
-- Ref Constraints for Table PG_STACJA
--------------------------------------------------------
 ALTER TABLE "HURTOWNIA"."PG_STACJA" ADD CONSTRAINT "STACJA_IBFK_1"
FOREIGN KEY ("ID_ADRESU")
 REFERENCES "HURTOWNIA"."PG_ADRES" ("ID") ENABLE
--------------------------------------------------------
-- Ref Constraints for Table PG_ZAMOWIENIE
--------------------------------------------------------
 ALTER TABLE "HURTOWNIA"."PG_ZAMOWIENIE" ADD CONSTRAINT
"ZAMOWIENIE_IBFK_1" FOREIGN KEY ("ID_KLIENTA")
 REFERENCES "HURTOWNIA"."PG_KLIENT" ("ID") ENABLE