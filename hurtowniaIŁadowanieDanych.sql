--DROP TABLE hu_data cascade constraints;
--DROP TABLE hu_hurtownia_centralna cascade constraints;
--DROP TABLE hu_region cascade constraints;
 CREATE TABLE "HU_DATA"
 ( "ID_DATA" NUMBER,
"DATA" DATE
 );
 CREATE TABLE "HU_HURTOWNIA_CENTRALNA"
 ( "FK_ID_REGION_NADANIA" NUMBER,
"FK_ID_REGION_DOSTAWY" NUMBER,
"FK_ID_DATA_DOSTARCZENIA" NUMBER,
"SR_PRZYGOTWANIA_PACZKI" NUMBER,
"CZAS_OD_MK_DO_OBIORCY" NUMBER,
"SR_CZAS_DOSTARCZENIA_PACZKI" NUMBER,
"PR_UDANYCH_PROB_DORECZENIA" NUMBER,
"SUM_WARTOSC_OPLAT" NUMBER,
"SR_OPLATA_ZA_PACZKE" NUMBER,
"ILOSC_ZREALIZOWANYCH_PACZEK" NUMBER,
"PROCENT_ZAGUBIONYCH_PACZEK" NUMBER,
"ILOSC_REKLAMOWANYCH_PRZESYLEK" NUMBER,
"SUM_PRZESYLEK_DOST_PO_TERMINIE" NUMBER,
"SR_OBJETOSC_PACZKI" NUMBER,
"SR_WAGA_PACZKI" NUMBER
 );
37
 CREATE TABLE "HU_REGION"
 ( "ID_REGION" NUMBER,
"WOJEWODZTWO" VARCHAR2(50)
 );
 CREATE UNIQUE INDEX "HU_DATA_PK" ON "HU_DATA" ("ID_DATA");
 CREATE UNIQUE INDEX "HU_REGION_PK" ON "HU_REGION" ("ID_REGION");
 ALTER TABLE "HU_DATA" ADD CONSTRAINT "HU_DATA_PK" PRIMARY KEY
("ID_DATA") ENABLE;
 ALTER TABLE "HU_DATA" MODIFY ("ID_DATA" NOT NULL ENABLE);
 ALTER TABLE "HU_REGION" ADD CONSTRAINT "HU_REGION_PK" PRIMARY KEY
("ID_REGION") ENABLE;
 ALTER TABLE "HU_REGION" MODIFY ("ID_REGION" NOT NULL ENABLE);
 ALTER TABLE "HU_HURTOWNIA_CENTRALNA" ADD CONSTRAINT "FK_2" FOREIGN
KEY ("FK_ID_REGION_NADANIA")
 REFERENCES "HU_REGION" ("ID_REGION") ENABLE;
 ALTER TABLE "HU_HURTOWNIA_CENTRALNA" ADD CONSTRAINT "FK_3" FOREIGN
KEY ("FK_ID_REGION_DOSTAWY")
 REFERENCES "HU_REGION" ("ID_REGION") ENABLE;
 ALTER TABLE "HU_HURTOWNIA_CENTRALNA" ADD CONSTRAINT "FK_5" FOREIGN
KEY ("FK_ID_DATA_DOSTARCZENIA")
 REFERENCES "HU_DATA" ("ID_DATA") ENABLE;
Ładowanie danych do hurtowni
Kolejnym krokiem ETL był proces ładowania danych z staging area do hurtowni
centralnych. Aby wykonać ten krok stworzyliśmy osobną procedurę.
Procedura jest dosyć długa, więc jej poszczególne etapy zostały podzielone na fragmenty i
opisane.
create or replace procedure sa_hu(start_date date, end_date date) as
 real_start date;
 real_end date;
 sa sys_refcursor;
 c_da sys_refcursor;
 type zlecenie_type is record (
 fk_id_region_nadania number,
 fk_id_region_odbioru number,
 fk_id_data_dostarczenia number,
 sr_przygotowania_paczki number,
38
 czas_od_mk_do_odbiorcy number,
 sr_czas_dostarczenia_paczki number,
 pr_udanych_prob_doreczenia number,
 sum_wartosc_oplat number,
 sr_oplata_za_paczke number,
 ilosc_zrealizowanych_paczek number,
 procent_zagubionych_paczek number,
 ilosc_reklamowanych_przesylek number,
 sum_przesylek_dost_po_terminie number,
 sr_objetosc_paczki number,
 sr_waga_paczki number
 );
 zlecenie zlecenie_type;
 data date;
 no_rows_inserted number;
 last_date_id number;
 no_regions number;
