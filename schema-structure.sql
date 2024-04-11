/*
 Navicat Premium SQL Dump

 Source Server         : PostgreSQL
 Source Server Type    : PostgreSQL
 Source Server Version : 160002 (160002)
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 160002 (160002)
 File Encoding         : 65001
*/


create extension citext;


-- DOMAINS:

--Email domain
create domain company_email as citext
check(value ~* '^[a-z]+\.[a-z]+(@companyname\.com)$' or value ~* '^[a-z]+\.[a-z]+\d*(@companyname\.com)$');

--Country code domain
create domain country_code as citext
check(value ~* '^\+[0-9]{1,3}$');

--Extension domain
create domain extension_domain as citext
check(value ~* '^[0-9]{1,4}$');


-- ----------------------------
-- Type structure for schedule_options
-- ----------------------------
DROP TYPE IF EXISTS "public"."schedule_options";
CREATE TYPE "public"."schedule_options" AS ENUM (
  '8am to 4pm',
  '9am to 5pm',
  '8am to 12am',
  '12am to 8am',
  'part-time'
);
ALTER TYPE "public"."schedule_options" OWNER TO "postgres";


-- SEQUENCES:

-- ----------------------------
-- Sequence structure for address_addressID_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."address_addressID_seq";
CREATE SEQUENCE "public"."address_addressID_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for city_cityID_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."city_cityID_seq";
CREATE SEQUENCE "public"."city_cityID_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for contract_contractID_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."contract_contractID_seq";
CREATE SEQUENCE "public"."contract_contractID_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for country_countryID_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."country_countryID_seq";
CREATE SEQUENCE "public"."country_countryID_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for department_departmentID_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."department_departmentID_seq";
CREATE SEQUENCE "public"."department_departmentID_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for employee_departement_employee_departementID_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."employee_departement_employee_departementID_seq";
CREATE SEQUENCE "public"."employee_departement_employee_departementID_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for employee_employeeID_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."employee_employeeID_seq";
CREATE SEQUENCE "public"."employee_employeeID_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for employee_insurance_employee_insuranceID_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."employee_insurance_employee_insuranceID_seq";
CREATE SEQUENCE "public"."employee_insurance_employee_insuranceID_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for employee_pn_employee_pnID_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."employee_pn_employee_pnID_seq";
CREATE SEQUENCE "public"."employee_pn_employee_pnID_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for employee_position_employee_positionID_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."employee_position_employee_positionID_seq";
CREATE SEQUENCE "public"."employee_position_employee_positionID_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for insurance_insuranceID_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."insurance_insuranceID_seq";
CREATE SEQUENCE "public"."insurance_insuranceID_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for payment_currency_payment_currencyID_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."payment_currency_payment_currencyID_seq";
CREATE SEQUENCE "public"."payment_currency_payment_currencyID_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for payment_paymentID_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."payment_paymentID_seq";
CREATE SEQUENCE "public"."payment_paymentID_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for position_positionID_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."position_positionID_seq";
CREATE SEQUENCE "public"."position_positionID_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for schedule_scheduleID_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."schedule_scheduleID_seq";
CREATE SEQUENCE "public"."schedule_scheduleID_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;


-- TABLES:

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS "public"."address";
CREATE TABLE "public"."address" (
  "addressID" int4 NOT NULL DEFAULT nextval('"address_addressID_seq"'::regclass),
  "street_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "postal_code" varchar(255) COLLATE "pg_catalog"."default",
  "building_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "floor" int4 NOT NULL,
  "district" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "cityID" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS "public"."city";
CREATE TABLE "public"."city" (
  "cityID" int4 NOT NULL DEFAULT nextval('"city_cityID_seq"'::regclass),
  "city_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "countryID" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS "public"."contract";
CREATE TABLE "public"."contract" (
  "contractID" int4 NOT NULL DEFAULT nextval('"contract_contractID_seq"'::regclass),
  "employeeID" int4 NOT NULL,
  "positionID" int4 NOT NULL,
  "serial_number" bytea NOT NULL,
  "contract_start" date NOT NULL DEFAULT now(),
  "contract_end" date NOT NULL,
  "contract_details" jsonb
)
;

-- ----------------------------
-- Table structure for country
-- ----------------------------
DROP TABLE IF EXISTS "public"."country";
CREATE TABLE "public"."country" (
  "countryID" int4 NOT NULL DEFAULT nextval('"country_countryID_seq"'::regclass),
  "country_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS "public"."department";
CREATE TABLE "public"."department" (
  "departmentID" int4 NOT NULL DEFAULT nextval('"department_departmentID_seq"'::regclass),
  "department_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "addressID" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS "public"."employee";
CREATE TABLE "public"."employee" (
  "employeeID" int4 NOT NULL DEFAULT nextval('"employee_employeeID_seq"'::regclass),
  "first_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "last_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "dob" date NOT NULL,
  "managerID" int4,
  "email" "public"."company_email" COLLATE "pg_catalog"."default",
  "addressID" int4,
  "hiredate" date NOT NULL DEFAULT now(),
  "active" bool DEFAULT true
)
;

-- ----------------------------
-- Table structure for employee_department
-- ----------------------------
DROP TABLE IF EXISTS "public"."employee_department";
CREATE TABLE "public"."employee_department" (
  "employee_departmentID" int4 NOT NULL DEFAULT nextval('"employee_departement_employee_departementID_seq"'::regclass),
  "employeeID" int4 NOT NULL,
  "departmentID" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for employee_insurance
-- ----------------------------
DROP TABLE IF EXISTS "public"."employee_insurance";
CREATE TABLE "public"."employee_insurance" (
  "employee_insuranceID" int4 NOT NULL DEFAULT nextval('"employee_insurance_employee_insuranceID_seq"'::regclass),
  "employeeID" int4 NOT NULL,
  "insuranceID" int4 NOT NULL,
  "enrollement_date" date NOT NULL DEFAULT now(),
  "additional_members" jsonb,
  "active" bool NOT NULL DEFAULT true
)
;

-- ----------------------------
-- Table structure for employee_pn
-- ----------------------------
DROP TABLE IF EXISTS "public"."employee_pn";
CREATE TABLE "public"."employee_pn" (
  "employee_pnID" int4 NOT NULL DEFAULT nextval('"employee_pn_employee_pnID_seq"'::regclass),
  "employeeID" int4 NOT NULL,
  "phone_number" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "country_code" "public"."country_code" COLLATE "pg_catalog"."default",
  "extension" "public"."extension_domain" COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Table structure for employee_position
-- ----------------------------
DROP TABLE IF EXISTS "public"."employee_position";
CREATE TABLE "public"."employee_position" (
  "employee_positionID" int4 NOT NULL DEFAULT nextval('"employee_position_employee_positionID_seq"'::regclass),
  "employeeID" int4 NOT NULL,
  "positionID" int4 NOT NULL
)
;

-- ----------------------------
-- Table structure for insurance
-- ----------------------------
DROP TABLE IF EXISTS "public"."insurance";
CREATE TABLE "public"."insurance" (
  "insuranceID" int4 NOT NULL DEFAULT nextval('"insurance_insuranceID_seq"'::regclass),
  "insurance_provider" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "insurance_benefits" jsonb
)
;

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS "public"."payment";
CREATE TABLE "public"."payment" (
  "paymentID" int4 NOT NULL DEFAULT nextval('"payment_paymentID_seq"'::regclass),
  "employeeID" int4 NOT NULL,
  "contractID" int4 NOT NULL,
  "payment_amount" int4 NOT NULL,
  "payment_currencyID" int4 NOT NULL,
  "payment_details" jsonb
)
;

-- ----------------------------
-- Table structure for payment_currency
-- ----------------------------
DROP TABLE IF EXISTS "public"."payment_currency";
CREATE TABLE "public"."payment_currency" (
  "payment_currencyID" int4 NOT NULL DEFAULT nextval('"payment_currency_payment_currencyID_seq"'::regclass),
  "payment_currency" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS "public"."position";
CREATE TABLE "public"."position" (
  "positionID" int4 NOT NULL DEFAULT nextval('"position_positionID_seq"'::regclass),
  "position_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "scheduleID" int4
)
;

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS "public"."schedule";
CREATE TABLE "public"."schedule" (
  "scheduleID" int4 NOT NULL DEFAULT nextval('"schedule_scheduleID_seq"'::regclass),
  "schedule_time" "public"."schedule_options" NOT NULL,
  "schedule_details" jsonb
)
;


-- ALTER SEQUENCES:

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."address_addressID_seq"
OWNED BY "public"."address"."addressID";
SELECT setval('"public"."address_addressID_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."city_cityID_seq"
OWNED BY "public"."city"."cityID";
SELECT setval('"public"."city_cityID_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."contract_contractID_seq"
OWNED BY "public"."contract"."contractID";
SELECT setval('"public"."contract_contractID_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."country_countryID_seq"
OWNED BY "public"."country"."countryID";
SELECT setval('"public"."country_countryID_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."department_departmentID_seq"
OWNED BY "public"."department"."departmentID";
SELECT setval('"public"."department_departmentID_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."employee_departement_employee_departementID_seq"
OWNED BY "public"."employee_department"."employee_departmentID";
SELECT setval('"public"."employee_departement_employee_departementID_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."employee_employeeID_seq"
OWNED BY "public"."employee"."employeeID";
SELECT setval('"public"."employee_employeeID_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."employee_insurance_employee_insuranceID_seq"
OWNED BY "public"."employee_insurance"."employee_insuranceID";
SELECT setval('"public"."employee_insurance_employee_insuranceID_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."employee_pn_employee_pnID_seq"
OWNED BY "public"."employee_pn"."employee_pnID";
SELECT setval('"public"."employee_pn_employee_pnID_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."employee_position_employee_positionID_seq"
OWNED BY "public"."employee_position"."employee_positionID";
SELECT setval('"public"."employee_position_employee_positionID_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."insurance_insuranceID_seq"
OWNED BY "public"."insurance"."insuranceID";
SELECT setval('"public"."insurance_insuranceID_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."payment_currency_payment_currencyID_seq"
OWNED BY "public"."payment_currency"."payment_currencyID";
SELECT setval('"public"."payment_currency_payment_currencyID_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."payment_paymentID_seq"
OWNED BY "public"."payment"."paymentID";
SELECT setval('"public"."payment_paymentID_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."position_positionID_seq"
OWNED BY "public"."position"."positionID";
SELECT setval('"public"."position_positionID_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."schedule_scheduleID_seq"
OWNED BY "public"."schedule"."scheduleID";
SELECT setval('"public"."schedule_scheduleID_seq"', 1, false);


-- PRIMARY KEYS:

-- ----------------------------
-- Primary Key structure for table address
-- ----------------------------
ALTER TABLE "public"."address" ADD CONSTRAINT "address_pkey" PRIMARY KEY ("addressID");

-- ----------------------------
-- Primary Key structure for table city
-- ----------------------------
ALTER TABLE "public"."city" ADD CONSTRAINT "city_pkey" PRIMARY KEY ("cityID");

-- ----------------------------
-- Primary Key structure for table contract
-- ----------------------------
ALTER TABLE "public"."contract" ADD CONSTRAINT "contract_pkey" PRIMARY KEY ("contractID");

-- ----------------------------
-- Primary Key structure for table country
-- ----------------------------
ALTER TABLE "public"."country" ADD CONSTRAINT "country_pkey" PRIMARY KEY ("countryID");

-- ----------------------------
-- Primary Key structure for table department
-- ----------------------------
ALTER TABLE "public"."department" ADD CONSTRAINT "department_pkey" PRIMARY KEY ("departmentID");

-- ----------------------------
-- Primary Key structure for table employee
-- ----------------------------
ALTER TABLE "public"."employee" ADD CONSTRAINT "employee_pkey" PRIMARY KEY ("employeeID");

-- ----------------------------
-- Primary Key structure for table employee_department
-- ----------------------------
ALTER TABLE "public"."employee_department" ADD CONSTRAINT "employee_departement_pkey" PRIMARY KEY ("employee_departmentID");

-- ----------------------------
-- Primary Key structure for table employee_insurance
-- ----------------------------
ALTER TABLE "public"."employee_insurance" ADD CONSTRAINT "employee_insurance_pkey" PRIMARY KEY ("employee_insuranceID");

-- ----------------------------
-- Primary Key structure for table employee_pn
-- ----------------------------
ALTER TABLE "public"."employee_pn" ADD CONSTRAINT "employee_pn_pkey" PRIMARY KEY ("employee_pnID");

-- ----------------------------
-- Primary Key structure for table employee_position
-- ----------------------------
ALTER TABLE "public"."employee_position" ADD CONSTRAINT "employee_position_pkey" PRIMARY KEY ("employee_positionID");

-- ----------------------------
-- Primary Key structure for table insurance
-- ----------------------------
ALTER TABLE "public"."insurance" ADD CONSTRAINT "insurance_pkey" PRIMARY KEY ("insuranceID");

-- ----------------------------
-- Primary Key structure for table payment
-- ----------------------------
ALTER TABLE "public"."payment" ADD CONSTRAINT "payment_pkey" PRIMARY KEY ("paymentID");

-- ----------------------------
-- Primary Key structure for table payment_currency
-- ----------------------------
ALTER TABLE "public"."payment_currency" ADD CONSTRAINT "payment_currency_pkey" PRIMARY KEY ("payment_currencyID");

-- ----------------------------
-- Primary Key structure for table position
-- ----------------------------
ALTER TABLE "public"."position" ADD CONSTRAINT "position_pkey" PRIMARY KEY ("positionID");

-- ----------------------------
-- Primary Key structure for table schedule
-- ----------------------------
ALTER TABLE "public"."schedule" ADD CONSTRAINT "schedule_pkey" PRIMARY KEY ("scheduleID");


-- FOREIGN KEYS:

-- ----------------------------
-- Foreign Keys structure for table address
-- ----------------------------
ALTER TABLE "public"."address" ADD CONSTRAINT "cityFK" FOREIGN KEY ("cityID") REFERENCES "public"."city" ("cityID") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table city
-- ----------------------------
ALTER TABLE "public"."city" ADD CONSTRAINT "countryFK" FOREIGN KEY ("countryID") REFERENCES "public"."country" ("countryID") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table contract
-- ----------------------------
ALTER TABLE "public"."contract" ADD CONSTRAINT "positionFK" FOREIGN KEY ("positionID") REFERENCES "public"."position" ("positionID") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."contract" ADD CONSTRAINT "employeeFK" FOREIGN KEY ("employeeID") REFERENCES "public"."employee" ("employeeID") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table department
-- ----------------------------
ALTER TABLE "public"."department" ADD CONSTRAINT "addressFK" FOREIGN KEY ("addressID") REFERENCES "public"."address" ("addressID") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table employee
-- ----------------------------
ALTER TABLE "public"."employee" ADD CONSTRAINT "addressFK" FOREIGN KEY ("addressID") REFERENCES "public"."address" ("addressID") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."employee" ADD CONSTRAINT "managerFK" FOREIGN KEY ("managerID") REFERENCES "public"."employee" ("employeeID") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table employee_department
-- ----------------------------
ALTER TABLE "public"."employee_department" ADD CONSTRAINT "departmentFK" FOREIGN KEY ("departmentID") REFERENCES "public"."department" ("departmentID") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."employee_department" ADD CONSTRAINT "employeeFK" FOREIGN KEY ("employeeID") REFERENCES "public"."employee" ("employeeID") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table employee_insurance
-- ----------------------------
ALTER TABLE "public"."employee_insurance" ADD CONSTRAINT "employeeFK" FOREIGN KEY ("employeeID") REFERENCES "public"."employee" ("employeeID") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."employee_insurance" ADD CONSTRAINT "insuranceFK" FOREIGN KEY ("insuranceID") REFERENCES "public"."insurance" ("insuranceID") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table employee_pn
-- ----------------------------
ALTER TABLE "public"."employee_pn" ADD CONSTRAINT "employeeFK" FOREIGN KEY ("employeeID") REFERENCES "public"."employee" ("employeeID") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table employee_position
-- ----------------------------
ALTER TABLE "public"."employee_position" ADD CONSTRAINT "employeeFK" FOREIGN KEY ("employeeID") REFERENCES "public"."employee" ("employeeID") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."employee_position" ADD CONSTRAINT "positionFK" FOREIGN KEY ("positionID") REFERENCES "public"."position" ("positionID") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table payment
-- ----------------------------
ALTER TABLE "public"."payment" ADD CONSTRAINT "contractFK" FOREIGN KEY ("contractID") REFERENCES "public"."contract" ("contractID") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."payment" ADD CONSTRAINT "employeeFK" FOREIGN KEY ("employeeID") REFERENCES "public"."employee" ("employeeID") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."payment" ADD CONSTRAINT "payment_currencyFK" FOREIGN KEY ("payment_currencyID") REFERENCES "public"."payment_currency" ("payment_currencyID") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table position
-- ----------------------------
ALTER TABLE "public"."position" ADD CONSTRAINT "scheduleFK" FOREIGN KEY ("scheduleID") REFERENCES "public"."schedule" ("scheduleID") ON DELETE NO ACTION ON UPDATE NO ACTION;


-- FUNCTIONS:

-- ----------------------------
-- Function structure for getretirementage
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."getretirementage"("_contract_end" date, "_employeeid" int4);
CREATE OR REPLACE FUNCTION "public"."getretirementage"("_contract_end" date, "_employeeid" int4)
  RETURNS "pg_catalog"."int4" AS $BODY$
declare _dob date;	
begin
    select e."dob" into _dob
    from employee e
    where e."employeeID" = getRetirementAge._employeeID;

    return extract(year from age(_contract_end, _dob))::int4;
end; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Function structure for setenrollmentinactive
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."setenrollmentinactive"();
CREATE OR REPLACE FUNCTION "public"."setenrollmentinactive"()
  RETURNS "pg_catalog"."trigger" AS $BODY$
declare existing_record record; one_year_later date;
begin
    select * into existing_record
    from employee_insurance
    where employeeID = new.employeeID and insuranceID = new.insuranceID and active = true;

    if found then
        one_year_later := existing_record.enrollment_date + interval '1 year';

        if one_year_later <= now() then
            update employee_insurance
            set active = false
            where employeeID = new.employeeID
                and insuranceID = new.insuranceID
                and active = true;

            return new;
        else
            raise exception 'Cannot renew insurance until one year has passed';
        end if;
    else return new;
    end if;
end; $BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;


-- CONSTRAINTS:

-- ----------------------------
-- Checks structure for table contract
-- ----------------------------
ALTER TABLE "public"."contract" ADD CONSTRAINT "contract_duration" CHECK (contract_start < contract_end);
ALTER TABLE "public"."contract" ADD CONSTRAINT "retirement_age" CHECK (getretirementage(contract_end, "employeeID") <= 64);


-- TRIGGERS:

-- ----------------------------
-- Triggers structure for table employee_insurance
-- ----------------------------
CREATE TRIGGER "enrollement_gap" BEFORE INSERT ON "public"."employee_insurance"
FOR EACH ROW
EXECUTE PROCEDURE "public"."setenrollmentinactive"();
