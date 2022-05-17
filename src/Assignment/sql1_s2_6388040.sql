/* --------------------------------------------------------------
--   Please fill in your information in this comment block --  
--   Student ID: 6388040
--   Fullname: Ariya Phengphon
--   Section: 2
------------------------------------------------------------- */
DROP DATABASE IF EXISTS tinycompany;		-- delete tinycompany if exists
CREATE DATABASE IF NOT EXISTS tinycompany;	-- create tinycompny if not exists
USE tinycompany;	-- currently table you are working on

-- Department Table 
CREATE TABLE Department(
	dnumber		INT 		 	PRIMARY KEY,  -- dnumber is a primary key
	dname		VARCHAR(20)		NOT NULL,
	location	VARCHAR(100), 	-- location is nullable 
	CONSTRAINT chk_dnumber CHECK (dnumber >= 1 AND dnumber <=20 ) -- dnumber range from 1 to 20
);


-- Write your DDL the remaining tables here 
-- Hint: Review the CREATE sequence, i.e., which tables should be created first

-- Employee Table
CREATE TABLE Employee(
	fname		VARCHAR(20)		NOT NULL,
    lname		VARCHAR(20)		NOT NULL,
    ssn			CHAR(9)			PRIMARY KEY,	-- ssn is a primary key
    bdate		DATE			NOT NULL,
    sex			CHAR(1)			NOT NULL,
    salary		DECIMAL(12,2),	-- salary is nullable
    dept_no		INT,			-- dept_no is nullable
    CONSTRAINT chk_sex CHECK (sex IN ('M','F')),	 -- sex is in 'M' or 'F' (or could be (sex = 'M' or sex = 'F'))
	CONSTRAINT FK_EmpDept FOREIGN KEY (dept_no)		 -- constraint check a foreign Key
    REFERENCES Department(dnumber)
);

-- Project Table
CREATE TABLE Project(
	pnumber		INT				PRIMARY KEY,	-- pnumber is a primary key
    pname		VARCHAR(50)		NOT NULL,
    dept_no		INT				NOT NULL,
    CONSTRAINT 	FK_ProjDept	FOREIGN KEY (dept_no)	 -- constraint check a foreign Key
    REFERENCES  Department(dnumber)
);

-- Assignment Table
CREATE TABLE Assignment(
	essn		CHAR(9),
    proj_no		INT,
    hours		DECIMAL(9,2),	-- hours is nullable
    hourly_rate	DECIMAL(9,2),	-- hourly_rate is nullable
    CONSTRAINT	FK_AsmEmp	FOREIGN KEY (essn) 		-- constraint check a foreign Key
    REFERENCES	Employee(ssn),
    CONSTRAINT	FK_AsmPrj	FOREIGN KEY (proj_no)	-- constraint check a foreign Key
    REFERENCES	Project(pnumber),	
    PRIMARY KEY (essn, proj_no)		-- defined two primary key, essn and proj_no is a primary key
);