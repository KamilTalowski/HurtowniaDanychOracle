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
 SELECT SA_KURIER_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
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