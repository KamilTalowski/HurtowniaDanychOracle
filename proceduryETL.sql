--------------------------------------------------------
-- DDL for Table SA_KURIER
--------------------------------------------------------
 CREATE TABLE "HURTOWNIA"."SA_KURIER"
 ( "ID" NUMBER(*,0),
"IMIE" VARCHAR2(100),
"NAZWISKO" VARCHAR2(100)
 )
--------------------------------------------------------
-- DDL for Table SA_PACZKA
--------------------------------------------------------
 CREATE TABLE "HURTOWNIA"."SA_PACZKA"
 ( "ID" NUMBER,
"WYMIAR_X" NUMBER,
"WYMIAR_Y" NUMBER,
"WYMIAR_Z" NUMBER,
"WAGA" NUMBER
 )
--------------------------------------------------------
-- DDL for Table SA_ZLECENIE
--------------------------------------------------------
 CREATE TABLE "HURTOWNIA"."SA_ZLECENIE"
 ( "ID" NUMBER,
"STATUS_DOSTARCZENIA" VARCHAR2(100),
28
"OPLATA" NUMBER,
"DATA_NADANIA" DATE,
"DATA_PRZYJECIA_DO_MP" DATE,
"DATA_OPUSZCZENIA_MK" DATE,
"DATA_DOSTARCZENIA" DATE,
"PLANOWANA_DATA_DOSTARCZENIA" DATE,
"ID_PACZKI" NUMBER,
"ID_KURIERA" NUMBER,
"REG_ODBIORU" VARCHAR2(100),
"REG_NADANIA" VARCHAR2(100)
 )
--------------------------------------------------------
-- DDL for Index SA_KURIER_PK
--------------------------------------------------------
 CREATE UNIQUE INDEX "HURTOWNIA"."SA_KURIER_PK" ON
"HURTOWNIA"."SA_KURIER" ("ID")
--------------------------------------------------------
-- DDL for Index SA_PACZKA_PK
--------------------------------------------------------
 CREATE UNIQUE INDEX "HURTOWNIA"."SA_PACZKA_PK" ON
"HURTOWNIA"."SA_PACZKA" ("ID")
--------------------------------------------------------
-- DDL for Index SA_ZLECENIE_PK
--------------------------------------------------------
 CREATE UNIQUE INDEX "HURTOWNIA"."SA_ZLECENIE_PK" ON
"HURTOWNIA"."SA_ZLECENIE" ("ID")
--------------------------------------------------------
-- Constraints for Table SA_KURIER
--------------------------------------------------------
 ALTER TABLE "HURTOWNIA"."SA_KURIER" ADD CONSTRAINT "SA_KURIER_PK"
PRIMARY KEY ("ID") ENABLE
 ALTER TABLE "HURTOWNIA"."SA_KURIER" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
-- Constraints for Table SA_PACZKA
--------------------------------------------------------
 ALTER TABLE "HURTOWNIA"."SA_PACZKA" ADD CONSTRAINT "SA_PACZKA_PK"
PRIMARY KEY ("ID") ENABLE
 ALTER TABLE "HURTOWNIA"."SA_PACZKA" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
-- Constraints for Table SA_ZLECENIE
--------------------------------------------------------
29
 ALTER TABLE "HURTOWNIA"."SA_ZLECENIE" ADD CONSTRAINT "SA_ZLECENIE_PK"
PRIMARY KEY ("ID") ENABLE
 ALTER TABLE "HURTOWNIA"."SA_ZLECENIE" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
-- Ref Constraints for Table SA_ZLECENIE
--------------------------------------------------------
 ALTER TABLE "HURTOWNIA"."SA_ZLECENIE" ADD CONSTRAINT "FK_SA_1"
FOREIGN KEY ("ID_PACZKI")
 REFERENCES "HURTOWNIA"."SA_PACZKA" ("ID") ENABLE
 ALTER TABLE "HURTOWNIA"."SA_ZLECENIE" ADD CONSTRAINT "FK_SA_2"
FOREIGN KEY ("ID_KURIERA")
 REFERENCES "HURTOWNIA"."SA_KURIER" ("ID") ENABLE
--------------------------------------------------------
-- DDL for Trigger SA_KURIER_TRG
--------------------------------------------------------
 CREATE OR REPLACE TRIGGER "HURTOWNIA"."SA_KURIER_TRG" BEFORE INSERT
ON SA_KURIER
FOR EACH ROW
BEGIN
 <<COLUMN_SEQUENCES>>
 BEGIN
 IF :NEW.ID IS NULL THEN
 SELECT SA_KURIERcreate or replace procedure mn_sa_kurier as
 cursor temp_kurier is
 select id_kuriera, imie, nazwisko from MNKURIER;
begin
 for temp_kurier_row in temp_kurier
 loop

 insert into sa_kurier values(temp_kurier_row.id_kuriera, temp_kurier_row.imie,
temp_kurier_row.nazwisko);
 end loop;
end;
create or replace procedure mn_sa_paczka as
 cursor temp_paczka is
 select ID_PRZESYLKI, szerokosc_paczki, dlugosc_paczki, wysokosc_paczki, waga from
MNPACZKA;
begin
 for temp_paczka_row in temp_paczka
 loop

 insert into sa_paczka values(temp_paczka_row.ID_PRZESYLKI
,temp_paczka_row.szerokosc_paczki, temp_paczka_row.dlugosc_paczki,
temp_paczka_row.wysokosc_paczki, temp_paczka_row.WAGA);
 end loop;
end;
create or replace procedure mn_sa_zlecenie as
 cursor temp_zlecenie is
31
 select id_zlecenia, status_realizacji, koszt, data_nadania, data_dostarczania_na_mp,
data_opuszczenia_mk,
data_dostarczenia, planowany_czas_realizacji, fk_id_przesylki, fk_id_kuriera,
wojewodztwo_dostawy, wojewodztwo_wyslania from MNZLECENIE;
begin
 for temp_zlecenie_row in temp_zlecenie
 loop
 if temp_zlecenie_row.status_realizacji = 'W trakcie'
 then temp_zlecenie_row.status_realizacji := 'W DRODZE';
 end if;
 if temp_zlecenie_row.status_realizacji = 'Zgubiona'
 then temp_zlecenie_row.status_realizacji := 'ZAGUBIONA';
 end if;
 insert into sa_zlecenie values(temp_zlecenie_row.id_zlecenia
,temp_zlecenie_row.status_realizacji, temp_zlecenie_row.koszt,
 temp_zlecenie_row.data_nadania, temp_zlecenie_row.data_dostarczania_na_mp,
temp_zlecenie_row.data_opuszczenia_mk, temp_zlecenie_row.data_dostarczenia,
 temp_zlecenie_row.planowany_czas_realizacji, temp_zlecenie_row.fk_id_przesylki,
temp_zlecenie_row.fk_id_kuriera, temp_zlecenie_row.wojewodztwo_dostawy,
 temp_zlecenie_row.wojewodztwo_wyslania);
 end loop;
end;
Procedury dla bazy nr 2
create or replace procedure kt_sa_kurier as
 cursor temp_kurier is
select id, imie, nazwisko from ktpracownik;
begin
 for temp_kurier_row in temp_kurier
 loop
temp_kurier_row.id := temp_kurier_row.id + 10000000;
insert into sa_kurier values(temp_kurier_row.id, temp_kurier_row.imie,
temp_kurier_row.nazwisko);
 end loop;
end;
create or replace procedure kt_sa_paczka as
 cursor temp_paczka is
select id, rozmiar_x, rozmiar_y, rozmiar_z, waga from ktpaczka;
begin
 for temp_paczka_row in temp_paczka
 loop
temp_paczka_row.id := temp_paczka_row.id + 10000000;
temp_paczka_row.rozmiar_x := temp_paczka_row.rozmiar_x * 2.54;
temp_paczka_row.rozmiar_y := temp_paczka_row.rozmiar_y * 2.54;
temp_paczka_row.rozmiar_z := temp_paczka_row.rozmiar_z * 2.54;
32
temp_paczka_row.waga := temp_paczka_row.waga;
insert into sa_paczka values(temp_paczka_row.id, temp_paczka_row.rozmiar_x,
temp_paczka_row.rozmiar_y, temp_paczka_row.rozmiar_z, temp_paczka_row.waga);
 end loop;
end;
create or replace procedure kt_sa_zlecenie as
 status_dostarczenia sa_zlecenie.status_dostarczenia%type;
 planowana_data_dostarczenia sa_zlecenie.planowana_data_dostarczenia%type;
 last_id sa_zlecenie.id%type;
 cursor temp_zlecenie is
select
 ktzamowienie.id as id,
 ktzamowienie.czy_zrealizowana as czy_dostarczono,
 ktparagon.kwota as oplata,
 ktzamowienie.data_nadania as data_nadania,
 ktzamowienie.data_dostarczenia_na_magazyn_po as data_przyjecia_do_mp,
 ktzamowienie.data_opuszczenia_magazynu_ko as data_opuszczenia_mk,
 ktzamowienie.data_dostarczenia as data_dostarczenia,
 ktzamowienie.planowany_czas_realizacji as planowane_dni,
 ktpaczka.id as id_paczki,
 ktpaczka.ktpracownik_id as id_kuriera,
 ktpaczka.rejon as reg_odbioru,
 ktklient.rejon as reg_nadania
from
 ktzamowienie
 inner join ktparagon on ktparagon.id = ktzamowienie.ktparagon_id
 inner join ktpaczka on ktpaczka.ktzamowienie_id = ktzamowienie.id
 inner join ktklient on ktklient.id = ktzamowienie.ktklient_id;
begin
 select nvl(max(id), 10000000-1) into last_id from sa_zlecenie where id between 10000000
and 20000000-1;
 for temp_zlecenie_row in temp_zlecenie
 loop
last_id := last_id + 1;
if temp_zlecenie_row.czy_dostarczono = 'Zrealizowano'
 then status_dostarczenia := 'DOSTARCZONO';
 else status_dostarczenia := 'W DRODZE';
end if;
planowana_data_dostarczenia := temp_zlecenie_row.planowane_dni;
insert into sa_zlecenie values(
 last_id,
 status_dostarczenia,
 temp_zlecenie_row.oplata,
 temp_zlecenie_row.data_nadania,
 temp_zlecenie_row.data_przyjecia_do_mp,
 temp_zlecenie_row.data_opuszczenia_mk,
33
 temp_zlecenie_row.data_dostarczenia,
 planowana_data_dostarczenia,
 temp_zlecenie_row.id_paczki + 10000000,
 temp_zlecenie_row.id_kuriera + 10000000,
 temp_zlecenie_row.reg_odbioru,
 temp_zlecenie_row.reg_nadania);
 end loop;
end;
exec kt_sa_kurier();
exec kt_sa_paczka();
exec kt_sa_zlecenie ();
Procedury dla bazy nr 3:
create or replace procedure pg_sa_kurier as
 cursor temp_kurier is
 select id, imie, nazwisko from pg_kurier;
begin
 for temp_kurier_row in temp_kurier
 loop
 temp_kurier_row.id := temp_kurier_row.id + 20000000;
 insert into sa_kurier values(temp_kurier_row.id,
temp_kurier_row.imie, temp_kurier_row.nazwisko);
 end loop;
end;
create or replace procedure pg_sa_paczka as
 cursor temp_paczka is
 select id, szerokosc, wysokosc, dlugosc, waga from pg_paczka;
begin
 for temp_paczka_row in temp_paczka
 loop
 temp_paczka_row.id := temp_paczka_row.id + 20000000;
 temp_paczka_row.szerokosc := temp_paczka_row.szerokosc * 2.54;
 temp_paczka_row.dlugosc := temp_paczka_row.dlugosc * 2.54;
 temp_paczka_row.wysokosc := temp_paczka_row.wysokosc * 2.54;
 temp_paczka_row.waga := temp_paczka_row.waga * 453.59237;
 insert into sa_paczka values(temp_paczka_row.id,
temp_paczka_row.szerokosc, temp_paczka_row.dlugosc,
temp_paczka_row.wysokosc, temp_paczka_row.waga);
 end loop;
end;
create or replace procedure pg_sa_zlecenie as
34
 status_dostarczenia sa_zlecenie.status_dostarczenia%type;
 planowana_data_dostarczenia
sa_zlecenie.planowana_data_dostarczenia%type;
 last_id sa_zlecenie.id%type;
 cursor temp_zlecenie is
 select
 pg_zamowienie.id as id,
 pg_dostarczenie.czy_dostarczono,
 pg_zamowienie.cena as oplata,
 pg_paczka.data_nadania as data_nadania,
 pg_paczka.data_przyjecia as data_przyjecia_do_mp,
 pg_dostarczenie.data_wydania as data_opuszczenia_mk,
 pg_dostarczenie.data_dostarczenia as data_dostarczenia,
 pg_zamowienie.planowany_czas_realizacji_dni as planowane_dni,
 pg_paczka.id as id_paczki,
 pg_paczka.id_kuriera as id_kuriera,
 pg_adres.region as reg_odbioru,
 pg_klient.region as reg_nadania
 from
 pg_zamowienie
 inner join pg_dostarczenie on pg_dostarczenie.id_zamowienia
= pg_zamowienie.id
 inner join pg_paczka on pg_paczka.id_zamowienia =
pg_zamowienie.id
 inner join pg_adres on pg_adres.id = pg_paczka.id_adresu
 inner join pg_klient on pg_klient.id =
pg_zamowienie.id_klienta;
begin
 select nvl(max(id), 20000000-1) into last_id from sa_zlecenie
where id between 20000000 and 3000000-1;
 for temp_zlecenie_row in temp_zlecenie
 loop
 last_id := last_id + 1;
 if temp_zlecenie_row.czy_dostarczono = 'tak'
 then status_dostarczenia := 'DOSTARCZONO';
 else status_dostarczenia := 'W DRODZE';
 end if;
 planowana_data_dostarczenia := temp_zlecenie_row.data_nadania +
temp_zlecenie_row.planowane_dni;
 insert into sa_zlecenie values(
 last_id,
 status_dostarczenia,
 temp_zlecenie_row.oplata,
 temp_zlecenie_row.data_nadania,
 temp_zlecenie_row.data_przyjecia_do_mp,
 temp_zlecenie_row.data_opuszczenia_mk,
 temp_zlecenie_row.data_dostarczenia,
35
 planowana_data_dostarczenia,
 temp_zlecenie_row.id_paczki + 20000000,
 temp_zlecenie_row.id_kuriera + 20000000,
 temp_zlecenie_row.reg_odbioru,
 temp_zlecenie_row.reg_nadania);
 end loop;
end;_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
 END IF;
 END COLUMN_SEQUENCES;
END;
ALTER TRIGGER "HURTOWNIA"."SA_KURIER_TRG" ENABLE
--------------------------------------------------------
-- DDL for Trigger SA_PACZKA_TRG
--------------------------------------------------------
 CREATE OR REPLACE TRIGGER "HURTOWNIA"."SA_PACZKA_TRG" BEFORE
INSERT ON SA_PACZKA
FOR EACH ROW
BEGIN
 <<COLUMN_SEQUENCES>>
 BEGIN
 IF :NEW.ID IS NULL THEN
 SELECT SA_PACZKA_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
 END IF;
 END COLUMN_SEQUENCES;
END;
ALTER TRIGGER "HURTOWNIA"."SA_PACZKA_TRG" ENABLE