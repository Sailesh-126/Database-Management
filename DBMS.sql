set serveroutput on;
set linesize 1000;
-- create
CREATE TABLE PATIENT (
  PAadhar NUMBER PRIMARY KEY,
  Name VARCHAR2(20) NOT NULL,
  Address VARCHAR2(50) NOT NULL,
  Age NUMBER
);

CREATE TABLE  DOCTOR (
  DAadhar NUMBER PRIMARY KEY,
  Name VARCHAR(20) NOT NULL,
  Speciality VARCHAR(20) NOT NULL
);

CREATE TABLE PHARMA_COMPANY (
  Company_name VARCHAR(20) PRIMARY KEY,
  Phone NUMBER NOT NULL 
);

CREATE TABLE PHARMACY (
  Pharma_Name VARCHAR(20) PRIMARY KEY,
  Address VARCHAR(50) NOT NULL,
  Phone NUMBER NOT NULL
);

CREATE TABLE DRUGS (
  Company_name VARCHAR(20),
  Trade_name VARCHAR(20),
  Formula VARCHAR(20),
  PRIMARY KEY (Company_name, Trade_name),
  FOREIGN KEY (Company_name) REFERENCES PHARMA_COMPANY(Company_name) on delete cascade
);

CREATE TABLE PATIENT_DOCTOR (
  PAadhar NUMBER,
  DAadhar NUMBER,
  PRIMARY KEY (PAadhar,DAadhar),
  FOREIGN KEY (PAadhar) REFERENCES PATIENT(PAadhar) on delete cascade,
  FOREIGN KEY (DAadhar) REFERENCES DOCTOR(DAadhar) on delete cascade
);

CREATE TABLE PRESCRIPTION (
  PAadhar NUMBER,
  DrAadhar NUMBER,
  DCompName VARCHAR(20),
  DTradeName VARCHAR(20),
  Quantity NUMBER,
  PDate date,
  PRIMARY KEY (PAadhar, DrAadhar, DCompName, DTradeName),
  FOREIGN KEY (PAadhar) REFERENCES PATIENT(PAadhar) on delete cascade,
  FOREIGN KEY (DrAadhar) REFERENCES DOCTOR(DAadhar) on delete cascade,
  FOREIGN KEY (DCompName, DTradeName) REFERENCES DRUGS(Company_name, Trade_name) on delete cascade
);

CREATE TABLE CONTRACT (
  Pharma_Name VARCHAR(20),
  Company_name VARCHAR(20),
  Content VARCHAR(50),
  Start_Date DATE,
  End_Date DATE,
  Supervisor VARCHAR(20)
);

CREATE TABLE SELLING (
  Pharma_Name VARCHAR(20),
  DCompName VARCHAR(20),
  DTradeName VARCHAR(20),
  Price NUMBER,
  PRIMARY KEY (Pharma_Name, DCompName, DTradeName),
  FOREIGN KEY (Pharma_Name) REFERENCES PHARMACY(Pharma_Name) on delete cascade,
  FOREIGN KEY (DCompName, DTradeName) REFERENCES DRUGS(Company_name, Trade_name) on delete cascade
);


-- insert
INSERT INTO PHARMA_COMPANY VALUES ('MediCore', 9876543210);
INSERT INTO PHARMA_COMPANY VALUES ('HealthPlus', 9123456789);
INSERT INTO PHARMA_COMPANY VALUES ('BioGen', 9988776655);
INSERT INTO PHARMA_COMPANY VALUES ('CureLife', 9090909090);
INSERT INTO PHARMA_COMPANY VALUES ('PharmaNet', 9001122334);
INSERT INTO DRUGS VALUES ('MediCore', 'Aspirin', 'C9H8O4');
INSERT INTO DRUGS VALUES ('MediCore', 'Metformin', 'C4H11N5');
INSERT INTO DRUGS VALUES ('HealthPlus', 'Paracetamol', 'C8H9NO2');
INSERT INTO DRUGS VALUES ('HealthPlus', 'Ibuprofen', 'C13H18O2');
INSERT INTO DRUGS VALUES ('BioGen', 'Ciprofloxacin', 'C17H18FN3O3');
INSERT INTO DRUGS VALUES ('BioGen', 'Azithromycin', 'C38H72N2O12');
INSERT INTO DRUGS VALUES ('CureLife', 'Amoxicillin', 'C16H19N3O5S');
INSERT INTO DRUGS VALUES ('CureLife', 'Doxycycline', 'C22H24N2O8');
INSERT INTO DRUGS VALUES ('PharmaNet', 'Zincovit', 'Vitamins+Zinc');
INSERT INTO DRUGS VALUES ('PharmaNet', 'Multivitamin', 'Vitamins+Minerals');
INSERT INTO PHARMACY VALUES ('CarePlus', 'Mumbai', 9876543210);
INSERT INTO PHARMACY VALUES ('CurePharma', 'Delhi', 9123456789);
INSERT INTO PHARMACY VALUES ('HealthMart', 'Bangalore', 9988776655);
INSERT INTO PHARMACY VALUES ('LifeMeds', 'Chennai', 9090909090);
INSERT INTO PHARMACY VALUES ('MediStore', 'Hyderabad', 9001122334);
INSERT INTO PATIENT VALUES (101, 'Ravi', 'Mumbai', 35);
INSERT INTO PATIENT VALUES (102, 'Sneha', 'Delhi', 28);
INSERT INTO PATIENT VALUES (103, 'Amit', 'Bangalore', 42);
INSERT INTO PATIENT VALUES (104, 'Neha', 'Chennai', 31);
INSERT INTO PATIENT VALUES (105, 'Arjun', 'Hyderabad', 26);
INSERT INTO DOCTOR VALUES (201, 'Dr. Mehta', 'Cardiology');
INSERT INTO DOCTOR VALUES (202, 'Dr. Kapoor', 'Dermatology');
INSERT INTO DOCTOR VALUES (203, 'Dr. Iyer', 'Neurology');
INSERT INTO DOCTOR VALUES (204, 'Dr. Sharma', 'Pediatrics');
INSERT INTO DOCTOR VALUES (205, 'Dr. Verma', 'Orthopedics');
INSERT INTO PATIENT_DOCTOR VALUES (101, 201);
INSERT INTO PATIENT_DOCTOR VALUES (101, 202);
INSERT INTO PATIENT_DOCTOR VALUES (102, 202);
INSERT INTO PATIENT_DOCTOR VALUES (102, 203);
INSERT INTO PATIENT_DOCTOR VALUES (103, 201);
INSERT INTO PATIENT_DOCTOR VALUES (103, 204);
INSERT INTO PATIENT_DOCTOR VALUES (104, 204);
INSERT INTO PATIENT_DOCTOR VALUES (104, 205);
INSERT INTO PATIENT_DOCTOR VALUES (105, 205);
INSERT INTO PATIENT_DOCTOR VALUES (105, 203);
INSERT INTO PATIENT_DOCTOR VALUES (101, 205);
INSERT INTO PATIENT_DOCTOR VALUES (102, 201);
INSERT INTO PATIENT_DOCTOR VALUES (103, 202);
INSERT INTO PATIENT_DOCTOR VALUES (104, 203);
INSERT INTO PATIENT_DOCTOR VALUES (105, 204);
INSERT INTO PRESCRIPTION VALUES (101, 201, 'MediCore', 'Aspirin', 10, TO_DATE('2025-04-01', 'YYYY-MM-DD'));
INSERT INTO PRESCRIPTION VALUES (102, 202, 'HealthPlus', 'Paracetamol', 5, TO_DATE('2025-04-02', 'YYYY-MM-DD'));
INSERT INTO PRESCRIPTION VALUES (103, 203, 'BioGen', 'Ciprofloxacin', 7, TO_DATE('2025-04-03', 'YYYY-MM-DD'));
INSERT INTO PRESCRIPTION VALUES (104, 204, 'CureLife', 'Amoxicillin', 6, TO_DATE('2025-04-04', 'YYYY-MM-DD'));
INSERT INTO PRESCRIPTION VALUES (105, 205, 'PharmaNet', 'Zincovit', 3, TO_DATE('2025-04-05', 'YYYY-MM-DD'));
INSERT INTO PRESCRIPTION VALUES (101, 202, 'HealthPlus', 'Ibuprofen', 8, TO_DATE('2025-04-06', 'YYYY-MM-DD'));
INSERT INTO PRESCRIPTION VALUES (102, 203, 'BioGen', 'Azithromycin', 4, TO_DATE('2025-04-07', 'YYYY-MM-DD'));
INSERT INTO PRESCRIPTION VALUES (103, 204, 'CureLife', 'Doxycycline', 5, TO_DATE('2025-04-08', 'YYYY-MM-DD'));
INSERT INTO PRESCRIPTION VALUES (104, 205, 'PharmaNet', 'Multivitamin', 10, TO_DATE('2025-04-09', 'YYYY-MM-DD'));
INSERT INTO PRESCRIPTION VALUES (105, 201, 'MediCore', 'Metformin', 6, TO_DATE('2025-04-10', 'YYYY-MM-DD'));

-- Extra rows to ensure coverage and some repetition
INSERT INTO PRESCRIPTION VALUES (101, 203, 'BioGen', 'Azithromycin', 5, TO_DATE('2025-04-11', 'YYYY-MM-DD'));
INSERT INTO PRESCRIPTION VALUES (102, 204, 'CureLife', 'Amoxicillin', 7, TO_DATE('2025-04-12', 'YYYY-MM-DD'));
INSERT INTO PRESCRIPTION VALUES (103, 205, 'PharmaNet', 'Multivitamin', 9, TO_DATE('2025-04-13', 'YYYY-MM-DD'));
INSERT INTO PRESCRIPTION VALUES (104, 201, 'MediCore', 'Metformin', 4, TO_DATE('2025-04-14', 'YYYY-MM-DD'));
INSERT INTO PRESCRIPTION VALUES (105, 202, 'HealthPlus', 'Ibuprofen', 6, TO_DATE('2025-04-15', 'YYYY-MM-DD'));
INSERT INTO PRESCRIPTION VALUES (101, 204, 'CureLife', 'Doxycycline', 3, TO_DATE('2025-04-16', 'YYYY-MM-DD'));
INSERT INTO PRESCRIPTION VALUES (102, 205, 'PharmaNet', 'Zincovit', 5, TO_DATE('2025-04-17', 'YYYY-MM-DD'));
INSERT INTO PRESCRIPTION VALUES (103, 201, 'MediCore', 'Aspirin', 4, TO_DATE('2025-04-18', 'YYYY-MM-DD'));
INSERT INTO PRESCRIPTION VALUES (104, 202, 'HealthPlus', 'Paracetamol', 2, TO_DATE('2025-04-19', 'YYYY-MM-DD'));
INSERT INTO PRESCRIPTION VALUES (105, 203, 'BioGen', 'Ciprofloxacin', 6, TO_DATE('2025-04-20', 'YYYY-MM-DD'));
INSERT INTO CONTRACT VALUES ('CarePlus', 'MediCore', 'Supply of painkillers', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2025-01-01', 'YYYY-MM-DD'), 'Anita Shah');
INSERT INTO CONTRACT VALUES ('CarePlus', 'HealthPlus', 'Distribution deal for OTC drugs', TO_DATE('2023-03-15', 'YYYY-MM-DD'), TO_DATE('2025-03-15', 'YYYY-MM-DD'), 'Ravi Mehra');
INSERT INTO CONTRACT VALUES ('CurePharma', 'BioGen', 'Antibiotics delivery contract', TO_DATE('2023-05-10', 'YYYY-MM-DD'), TO_DATE('2025-05-10', 'YYYY-MM-DD'), 'Nidhi Rao');
INSERT INTO CONTRACT VALUES ('HealthMart', 'CureLife', 'Chronic illness medication supply', TO_DATE('2023-07-01', 'YYYY-MM-DD'), TO_DATE('2025-07-01', 'YYYY-MM-DD'), 'Manoj Iyer');
INSERT INTO CONTRACT VALUES ('LifeMeds', 'PharmaNet', 'Vitamin supplements contract', TO_DATE('2023-09-20', 'YYYY-MM-DD'), TO_DATE('2025-09-20', 'YYYY-MM-DD'), 'Deepa Nair');
INSERT INTO CONTRACT VALUES ('MediStore', 'MediCore', 'Diabetes medication deal', TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2025-02-01', 'YYYY-MM-DD'), 'Karan Verma');
INSERT INTO CONTRACT VALUES ('MediStore', 'BioGen', 'Infection control products', TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2025-04-01', 'YYYY-MM-DD'), 'Neha Jain');
INSERT INTO CONTRACT VALUES ('LifeMeds', 'HealthPlus', 'Pain and fever medication', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'Amit Sengupta');
INSERT INTO CONTRACT VALUES ('HealthMart', 'PharmaNet', 'Health supplements stock', TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE('2025-08-01', 'YYYY-MM-DD'), 'Sonal Kapoor');
INSERT INTO CONTRACT VALUES ('CurePharma', 'CureLife', 'Antibiotics collaboration', TO_DATE('2023-10-01', 'YYYY-MM-DD'), TO_DATE('2025-10-01', 'YYYY-MM-DD'), 'Rajiv Desai');
-- CarePlus sells 10 drugs
INSERT INTO SELLING VALUES ('CarePlus', 'MediCore', 'Aspirin', 25);
INSERT INTO SELLING VALUES ('CarePlus', 'MediCore', 'Metformin', 30);
INSERT INTO SELLING VALUES ('CarePlus', 'HealthPlus', 'Paracetamol', 18);
INSERT INTO SELLING VALUES ('CarePlus', 'HealthPlus', 'Ibuprofen', 22);
INSERT INTO SELLING VALUES ('CarePlus', 'BioGen', 'Ciprofloxacin', 45);
INSERT INTO SELLING VALUES ('CarePlus', 'BioGen', 'Azithromycin', 50);
INSERT INTO SELLING VALUES ('CarePlus', 'CureLife', 'Amoxicillin', 28);
INSERT INTO SELLING VALUES ('CarePlus', 'CureLife', 'Doxycycline', 35);
INSERT INTO SELLING VALUES ('CarePlus', 'PharmaNet', 'Zincovit', 20);
INSERT INTO SELLING VALUES ('CarePlus', 'PharmaNet', 'Multivitamin', 40);

-- CurePharma sells 11 drugs
INSERT INTO SELLING VALUES ('CurePharma', 'MediCore', 'Aspirin', 24);
INSERT INTO SELLING VALUES ('CurePharma', 'HealthPlus', 'Paracetamol', 17);
INSERT INTO SELLING VALUES ('CurePharma', 'HealthPlus', 'Ibuprofen', 21);
INSERT INTO SELLING VALUES ('CurePharma', 'BioGen', 'Ciprofloxacin', 48);
INSERT INTO SELLING VALUES ('CurePharma', 'CureLife', 'Amoxicillin', 29);
INSERT INTO SELLING VALUES ('CurePharma', 'CureLife', 'Doxycycline', 37);
INSERT INTO SELLING VALUES ('CurePharma', 'PharmaNet', 'Zincovit', 19);
INSERT INTO SELLING VALUES ('CurePharma', 'PharmaNet', 'Multivitamin', 39);
INSERT INTO SELLING VALUES ('CurePharma', 'BioGen', 'Azithromycin', 52);
INSERT INTO SELLING VALUES ('CurePharma', 'MediCore', 'Metformin', 33);
INSERT INTO SELLING VALUES ('CurePharma', 'CureLife', 'Doxycycline', 38); -- repeated intentionally for variety

-- HealthMart sells 10 drugs
INSERT INTO SELLING VALUES ('HealthMart', 'MediCore', 'Aspirin', 26);
INSERT INTO SELLING VALUES ('HealthMart', 'HealthPlus', 'Ibuprofen', 23);
INSERT INTO SELLING VALUES ('HealthMart', 'BioGen', 'Ciprofloxacin', 49);
INSERT INTO SELLING VALUES ('HealthMart', 'BioGen', 'Azithromycin', 51);
INSERT INTO SELLING VALUES ('HealthMart', 'CureLife', 'Doxycycline', 36);
INSERT INTO SELLING VALUES ('HealthMart', 'PharmaNet', 'Zincovit', 22);
INSERT INTO SELLING VALUES ('HealthMart', 'PharmaNet', 'Multivitamin', 42);
INSERT INTO SELLING VALUES ('HealthMart', 'HealthPlus', 'Paracetamol', 20);
INSERT INTO SELLING VALUES ('HealthMart', 'CureLife', 'Amoxicillin', 30);
INSERT INTO SELLING VALUES ('HealthMart', 'MediCore', 'Metformin', 32);

-- LifeMeds sells 11 drugs
INSERT INTO SELLING VALUES ('LifeMeds', 'MediCore', 'Aspirin', 27);
INSERT INTO SELLING VALUES ('LifeMeds', 'HealthPlus', 'Paracetamol', 19);
INSERT INTO SELLING VALUES ('LifeMeds', 'HealthPlus', 'Ibuprofen', 24);
INSERT INTO SELLING VALUES ('LifeMeds', 'BioGen', 'Ciprofloxacin', 44);
INSERT INTO SELLING VALUES ('LifeMeds', 'CureLife', 'Amoxicillin', 27);
INSERT INTO SELLING VALUES ('LifeMeds', 'PharmaNet', 'Zincovit', 21);
INSERT INTO SELLING VALUES ('LifeMeds', 'PharmaNet', 'Multivitamin', 41);
INSERT INTO SELLING VALUES ('LifeMeds', 'BioGen', 'Azithromycin', 53);
INSERT INTO SELLING VALUES ('LifeMeds', 'MediCore', 'Metformin', 31);
INSERT INTO SELLING VALUES ('LifeMeds', 'CureLife', 'Doxycycline', 34);
INSERT INTO SELLING VALUES ('LifeMeds', 'BioGen', 'Ciprofloxacin', 46); -- duplicate for variation

-- MediStore sells 10 drugs
INSERT INTO SELLING VALUES ('MediStore', 'MediCore', 'Metformin', 35);
INSERT INTO SELLING VALUES ('MediStore', 'HealthPlus', 'Ibuprofen', 25);
INSERT INTO SELLING VALUES ('MediStore', 'BioGen', 'Azithromycin', 54);
INSERT INTO SELLING VALUES ('MediStore', 'CureLife', 'Amoxicillin', 31);
INSERT INTO SELLING VALUES ('MediStore', 'PharmaNet', 'Zincovit', 23);
INSERT INTO SELLING VALUES ('MediStore', 'PharmaNet', 'Multivitamin', 43);
INSERT INTO SELLING VALUES ('MediStore', 'BioGen', 'Ciprofloxacin', 47);
INSERT INTO SELLING VALUES ('MediStore', 'CureLife', 'Doxycycline', 33);
INSERT INTO SELLING VALUES ('MediStore', 'HealthPlus', 'Paracetamol', 21);
INSERT INTO SELLING VALUES ('MediStore', 'MediCore', 'Aspirin', 28);


-- procedures
--1///////////////////////////////////////////////////////////////////////////
--patient
CREATE OR replace procedure Add_patient(
    adhar IN NUMBER,
    name IN VARCHAR2,
    address IN VARCHAR2,
    age IN NUMBER) as
BEGIN
INSERT INTO PATIENT VALUES ( adhar, name, address, age);
DBMS_OUTPUT.PUT_LINE('Patient added successfully.');
END;
/

CREATE OR replace procedure Update_patient (
    p_aadhar IN NUMBER,
    new_name IN VARCHAR2,
    new_address IN VARCHAR2,
    new_age IN NUMBER
) AS
BEGIN
    UPDATE PATIENT
    SET Name = new_name,
        Address = new_address,
        Age = new_age
    WHERE PAadhar = p_aadhar;
END;
/

CREATE OR replace procedure  Delete_patient (p_aadhar IN NUMBER) AS
BEGIN
DELETE FROM PATIENT WHERE PAadhar = p_aadhar;
END;
/
--doctor
CREATE OR REPLACE PROCEDURE add_doctor (
  d_aadhar IN NUMBER,
  d_name IN VARCHAR2,
  d_speciality IN VARCHAR2) AS
BEGIN
INSERT INTO DOCTOR (DAadhar, Name, Speciality)
VALUES (d_aadhar, d_name, d_speciality);
DBMS_OUTPUT.PUT_LINE('Doctor added successfully.');
END;
/

CREATE OR REPLACE PROCEDURE update_doctor (
  d_aadhar IN NUMBER,
  new_name IN VARCHAR2,
  new_speciality IN VARCHAR2) AS
BEGIN
  UPDATE DOCTOR
  SET Name = new_name,
      Speciality = new_speciality
  WHERE DAadhar = d_aadhar;
END;
/

CREATE OR REPLACE PROCEDURE delete_doctor (d_aadhar IN NUMBER) AS
BEGIN
  DELETE FROM DOCTOR WHERE DAadhar = d_aadhar;
END;
/

--drug
CREATE OR REPLACE PROCEDURE Add_drug (
  c_name IN VARCHAR2,
  trade_name IN VARCHAR2,
  formula IN VARCHAR2) AS
BEGIN
  INSERT INTO DRUGS (Company_name, Trade_name, Formula)
  VALUES (c_name, trade_name, formula);
END;
/

CREATE OR REPLACE PROCEDURE Delete_drug (
  c_name IN VARCHAR2,
  trade_name IN VARCHAR2) AS
BEGIN
  DELETE FROM DRUGS
  WHERE Company_name = c_name AND Trade_name = trade_name;
END;
/

CREATE OR REPLACE PROCEDURE Update_Drug(
  c_name in VARCHAR,
  tname in VARCHAR,
  fmula in VARCHAR) AS
BEGIN
  update DRUGS
    set formula = fmula where Company_name=c_name and Trade_name = tname;
END;
/

--pharmacy
CREATE OR REPLACE PROCEDURE Add_pharmacy (
  p_name IN VARCHAR2,
  p_address IN VARCHAR2,
  p_phone IN NUMBER) AS
BEGIN
  INSERT INTO PHARMACY VALUES (p_name, p_address, p_phone);
END;
/

CREATE OR REPLACE PROCEDURE Update_pharmacy (
    p_name IN VARCHAR2,
    new_address IN VARCHAR2,
    new_phone IN NUMBER
) AS
BEGIN
  UPDATE PHARMACY
  SET Address = new_address,
      Phone = new_phone
  WHERE Pharma_Name = p_name;
END;
/

CREATE OR REPLACE PROCEDURE delete_pharmacy (p_name IN VARCHAR2) AS
BEGIN
  DELETE FROM PHARMACY WHERE Pharma_Name = p_name;
END;
/

--company
CREATE OR REPLACE PROCEDURE Add_company (
  c_name IN VARCHAR2,
  c_phone IN NUMBER) AS
BEGIN
  INSERT INTO PHARMA_COMPANY VALUES (c_name, c_phone);
END;
/


CREATE OR REPLACE PROCEDURE Update_company (
  c_name IN VARCHAR2,
  new_phone IN NUMBER) AS
BEGIN
  UPDATE PHARMA_COMPANY
  SET Phone = new_phone
  WHERE Company_name = c_name;
END;
/

CREATE OR REPLACE PROCEDURE Delete_company (c_name IN VARCHAR2) AS
BEGIN
  DELETE FROM PHARMA_COMPANY WHERE Company_name = c_name;
END;
/

--prescription
CREATE OR REPLACE PROCEDURE Add_prescription (
  p_aadhar IN NUMBER ,
  d_aadhar IN NUMBER ,
  d_comp IN VARCHAR2,
  d_trade IN VARCHAR2,
  qty IN NUMBER,
  p_date IN DATE) AS
BEGIN
  INSERT INTO PRESCRIPTION VALUES (p_aadhar, d_aadhar, d_comp, d_trade, qty, p_date);
END;
/

CREATE OR REPLACE PROCEDURE Delete_prescription (
  p_aadhar IN NUMBER ,
  d_aadhar IN NUMBER ,
  d_comp IN VARCHAR2,
  d_trade IN VARCHAR2) AS
BEGIN
  DELETE FROM PRESCRIPTION
  WHERE PAadhar = p_aadhar AND DrAadhar = d_aadhar  AND DCompName = d_comp AND DTradeName = d_trade;
END;
/

--pharmacy inventory
CREATE OR REPLACE PROCEDURE Add_Pharmacy_inventory (
  pharma_name IN VARCHAR2,
  d_comp IN VARCHAR2,
  d_trade IN VARCHAR2,
  price IN NUMBER) AS
BEGIN
    INSERT INTO SELLING
    VALUES (pharma_name, d_comp, d_trade, price);
END;
/

CREATE OR REPLACE PROCEDURE Update_Drug_pricing (
  pharma_name IN VARCHAR2,
  d_comp IN VARCHAR2,
  d_trade IN VARCHAR2,
  new_price IN NUMBER) AS
BEGIN
  UPDATE SELLING
  SET Price = new_price
  WHERE Pharma_Name = pharma_name AND DCompName = d_comp AND DTradeName = d_trade;
END;
/

CREATE OR REPLACE PROCEDURE Remove_From_Inventory (
  pharma_name IN VARCHAR2,
  d_comp IN VARCHAR2,
  d_trade IN VARCHAR2) AS
BEGIN
  DELETE FROM SELLING
  WHERE Pharma_Name = pharma_name AND DCompName = d_comp AND DTradeName = d_trade;
END;
/


--2//////////////////////////////////////////////////////////////////////////////////
CREATE or replace procedure Prescription_Report(s in DATE, e in DATE) is
PName VARCHAR(20);
DName VARCHAR(20);
DCompName VARCHAR(20);
DTradeName VARCHAR(20);
Quantity NUMBER;
PDate DATE;
cursor report is
select P.Name, D.Name, Pr.DCompName, Pr.DTradeName, Pr.Quantity, Pr.PDate
from PRESCRIPTION Pr join DOCTOR D on Pr.DrAadhar=D.DAadhar join PATIENT P on P.PAadhar=Pr.PAadhar
where Pr.PDate >= s and Pr.PDate <=e;
begin
open report;
loop
fetch report into PName,DName,DCompName,DTradeName,Quantity,PDate;
exit when report%notfound;
dbms_output.put_line('Patient name: '||PName||' |  Doctor name: '||DName||' |  Drug name:'||DTradeName||' |  Pharma name: '||DCompName||' |  Quantity: '||Quantity||' |  Date: '||PDate);
end loop;
end;
/

--3///////////////////////////////////////////////////////////////////////////////////
CREATE or replace procedure Patient_Prescription(n in NUMBER, d in DATE) is
DName VARCHAR(20);
DCompName VARCHAR(20);
DTradeName VARCHAR(20);
Quantity NUMBER;
cursor presc is
select D.Name, Pr.DCompName, Pr.DTradeName, Pr.Quantity
from PRESCRIPTION Pr join DOCTOR D on Pr.DrAadhar=D.DAadhar join PATIENT P on P.PAadhar=Pr.PAadhar
where P.PAadhar = n and Pr.PDate = d;
begin
open presc;
loop
fetch presc into DName,DCompName,DTradeName,Quantity;
exit when presc%notfound;
dbms_output.put_line('Doctor name: '||DName||' |  Drug name:'||DTradeName||' |  Pharma name: '||DCompName||' |  Quantity: '||Quantity);
end loop;
close presc;
end;
/

--4////////////////////////////////////////////////////////////////////////////////////
CREATE OR REPLACE PROCEDURE Drugs_details_of_company (compname IN VARCHAR) IS
drug_trade_name VARCHAR(20);
fmula VARCHAR(20);
CURSOR dets IS
SELECT Trade_name, Formula FROM DRUGS WHERE Company_name = compname;
BEGIN
dbms_output.put_line('Company Name: '|| compname);
OPEN dets;
LOOP
FETCH dets INTO drug_trade_name, fmula;
EXIT WHEN dets%NOTFOUND;
dbms_output.put_line('Trade Name: '||drug_trade_name||' Formula: '||fmula);
END LOOP;
CLOSE dets;
END;
/

--5////////////////////////////////////////////////////////////////////////////////////
CREATE OR REPLACE PROCEDURE Stock_Position(pname IN VARCHAR) as
cnt NUMBER;
DCname VARCHAR(20);
DTname VARCHAR(20);
n NUMBER;
cursor st is
  select DCompName,DTradeName,Price from SELLING where Pharma_Name=pname;
begin
select count(*) into cnt from SELLING where Pharma_Name=pname;
dbms_output.put_line('Number of drugs: ' || cnt);
dbms_output.put_line('Drugs:');
open st;
loop
  fetch st into DCname,DTname,n;
  exit when st%notfound;
  dbms_output.put_line('Pharma: '||DCname|| ' | Name: '||DTname|| ' |  Price: '||n);
  end loop;
close st;
end;
/

--6///////////////////////////////////////////////////////////////////////////////////
CREATE OR REPLACE PROCEDURE Pharma_pharmacy_contract IS
BEGIN
    FOR rec IN (SELECT * FROM CONTRACT) LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Pharmacy name: ' || rec.pharma_name || 
            ' | Pharma company Name: ' || rec.company_name || 
            ' | content ' || rec.content ||
            ' | start date ' || TO_CHAR(rec.start_date, 'YYYY-MM-DD') ||
            ' | end date ' || TO_CHAR(rec.end_date, 'YYYY-MM-DD') || 
            ' | supervisor ' || rec.supervisor 
        );
    END LOOP;
END;
/

--7///////////////////////////////////////////////////////////////////////////////////

CREATE OR REPLACE PROCEDURE Patients_for_Doctor(d_id in number) is
p_id number;
p_name VARCHAR(20);
cursor pat is 
select unique p.PAadhar, p.Name from Patient p join Patient_Doctor pd on pd.PAadhar = p.PAadhar where pd.DAadhar = d_id;
begin
open pat;
loop
fetch pat into p_id, p_name;
dbms_output.put_line('Aadhar: '||p_id||' Name: '||p_name);
exit when pat%notfound;
end loop;
close pat;
end;
/
























