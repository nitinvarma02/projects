CREATE TABLE allergies (
    START_DATE DATE,
    STOP_DATE DATE,
    PATIENT UUID,
    ENCOUNTER UUID,
    CODE VARCHAR(50),
    SYSTEM VARCHAR(100),
    DESCRIPTION VARCHAR(255),
    TYPE VARCHAR(50),
    CATEGORY VARCHAR(50),
    REACTION1 INT,
    DESCRIPTION1 VARCHAR(255),
    SEVERITY1 VARCHAR(50),
    REACTION2 INT,
    DESCRIPTION2 VARCHAR(255),
    SEVERITY2 VARCHAR(50)
);

CREATE TABLE care_plan (
    Id UUID PRIMARY KEY,
    START DATE,
    STOP DATE,
    PATIENT UUID,
    ENCOUNTER UUID,
    CODE VARCHAR(50),
    DESCRIPTION VARCHAR(255),
    REASONCODE VARCHAR(20),
    REASONDESCRIPTION VARCHAR(255)
);

CREATE TABLE claims (
    Id UUID PRIMARY KEY,
    PATIENTID UUID,
    PROVIDERID UUID,
    PRIMARYPATIENTINSURANCEID UUID,
    SECONDARYPATIENTINSURANCEID UUID,
    DEPARTMENTID INT,
    PATIENTDEPARTMENTID INT,
    DIAGNOSIS1 VARCHAR(50),
    DIAGNOSIS2 VARCHAR(50),
    DIAGNOSIS3 VARCHAR(50),
    DIAGNOSIS4 VARCHAR(50),
    DIAGNOSIS5 VARCHAR(50),
    DIAGNOSIS6 VARCHAR(50),
    DIAGNOSIS7 VARCHAR(50),
    DIAGNOSIS8 VARCHAR(50),
    REFERRINGPROVIDERID UUID,
    APPOINTMENTID UUID,
    CURRENTILLNESSDATE TIMESTAMP,
    SERVICEDATE TIMESTAMP,
    SUPERVISINGPROVIDERID UUID,
    STATUS1 VARCHAR(50),
    STATUS2 VARCHAR(50),
    STATUSP VARCHAR(50),
    OUTSTANDING1 NUMERIC,
    OUTSTANDING2 NUMERIC,
    OUTSTANDINGP NUMERIC,
    LASTBILLEDDATE1 TIMESTAMP,
    LASTBILLEDDATE2 TIMESTAMP,
    LASTBILLEDDATEP TIMESTAMP,
    HEALTHCARECLAIMTYPEID1 INT,
    HEALTHCARECLAIMTYPEID2 INT
);

CREATE TABLE claim_transcations (
    ID UUID PRIMARY KEY,
    CLAIMID UUID,
    CHARGEID INT,
    PATIENTID UUID,
    TYPE VARCHAR(20),
    AMOUNT NUMERIC(10, 2),
    METHOD VARCHAR(20),
    FROMDATE TIMESTAMP,
    TODATE TIMESTAMP,
    PLACEOFSERVICE UUID,
    PROCEDURECODE VARCHAR(50),
    MODIFIER1 VARCHAR(50),
    MODIFIER2 VARCHAR(50),
    DIAGNOSISREF1 INT,
    DIAGNOSISREF2 INT,
    DIAGNOSISREF3 INT,
    DIAGNOSISREF4 INT,
    UNITS INT,
    DEPARTMENTID INT,
    NOTES VARCHAR(255),
    UNITAMOUNT NUMERIC(10, 2),
    TRANSFEROUTID INT,
    TRANSFERTYPE VARCHAR(20),
    PAYMENTS NUMERIC(10, 2),
    ADJUSTMENTS NUMERIC(10, 2),
    TRANSFERS NUMERIC(10, 2),
    OUTSTANDING NUMERIC(10, 2),
    APPOINTMENTID UUID,
    LINENOTE VARCHAR(255),
    PATIENTINSURANCEID UUID,
    FEESCHEDULEID INT,
    PROVIDERID UUID,
    SUPERVISINGPROVIDERID UUID
);

CREATE TABLE condition (
    start_date DATE,
    stop_date DATE,
    patient_id UUID,
    encounter_id UUID,
    code VARCHAR(50),
    description TEXT
);

CREATE TABLE device (
    start_timestamp TIMESTAMP,
    stop_timestamp TIMESTAMP,
    patient_id UUID,
    encounter_id UUID,
    code VARCHAR(50),
    description TEXT,
    udi TEXT
);

CREATE TABLE encounter (
    Id UUID PRIMARY KEY,
    START TIMESTAMP,
    STOP TIMESTAMP,
    PATIENT UUID,
    ORGANIZATION UUID,
    PROVIDER UUID,
    PAYER UUID,
    ENCOUNTERCLASS VARCHAR(50),
    CODE VARCHAR(50),
    DESCRIPTION VARCHAR(255),
    BASE_ENCOUNTER_COST NUMERIC(10, 2),
    TOTAL_CLAIM_COST NUMERIC(10, 2),
    PAYER_COVERAGE NUMERIC(10, 2),
    REASONCODE VARCHAR(20),
    REASONDESCRIPTION VARCHAR(255)
);

CREATE TABLE imaging (
    id UUID PRIMARY KEY,
    date TIMESTAMP,
    patient UUID,
    encounter UUID,
    series_uid VARCHAR(100),
    bodysite_code VARCHAR(20),
    bodysite_description TEXT,
    modality_code VARCHAR(10),
    modality_description TEXT,
    instance_uid VARCHAR(100),
    sop_code VARCHAR(50),
    sop_description TEXT,
    procedure_code VARCHAR(20)	
);

CREATE TABLE immunization (
    DATE TIMESTAMP,
    PATIENT UUID,
    ENCOUNTER UUID,
    CODE VARCHAR(50),
    DESCRIPTION VARCHAR(255),
    BASE_COST NUMERIC(10, 2)
);


CREATE TABLE medication (
    START TIMESTAMP,
    STOP TIMESTAMP,
    PATIENT UUID,
    PAYER UUID,
    ENCOUNTER UUID,
    CODE VARCHAR(50),
    DESCRIPTION VARCHAR(255),
    BASE_COST NUMERIC(10, 2),
    PAYER_COVERAGE NUMERIC(10, 2),
    DISPENSES INT,
    TOTAL_COST NUMERIC(10, 2),
    REASON_CODE VARCHAR(50),
    REASON_DESCRIPTION VARCHAR(255)
);

CREATE TABLE observations (
    DATE TIMESTAMP,
    PATIENT UUID,
    ENCOUNTER UUID,
    CATEGORY VARCHAR(50),
    CODE VARCHAR(50),
    DESCRIPTION VARCHAR(255),
    VALUE VARCHAR(255),
    UNITS VARCHAR(50),
    TYPE VARCHAR(50)
);

CREATE TABLE patients (
    patient_id UUID PRIMARY KEY,
    date_of_birth DATE,
    date_of_death DATE,
    ssn VARCHAR(20),
    driver_license VARCHAR(20),
    passport VARCHAR(20),
    title VARCHAR(20),
    first_name VARCHAR(50),
    middle_name VARCHAR(50),
    last_name VARCHAR(50),
    suffix VARCHAR(20),
    maiden_name VARCHAR(50),
	marital VARCHAR(50),
    race VARCHAR(50),
    ethnicity VARCHAR(50),
	gender VARCHAR(10),
    birthplace VARCHAR(100),
    address VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    county VARCHAR(50),
	FIPS VARCHAR(50),
    zip VARCHAR(20),
    latitude FLOAT,
    longitude FLOAT,
	health_expenses NUMERIC(12,2),
	health_coverage NUMERIC(10,2),
    income NUMERIC(15, 2)
);

CREATE TABLE payer_transcations (
    patient_id UUID,
    member_id UUID,
    start_date DATE,
    end_date VARCHAR(50),
    payer UUID,
    secondary_payer UUID,
    plan_ownership VARCHAR(50),
    owner_name VARCHAR(100)
);

CREATE TABLE payer (
    id UUID ,
    name VARCHAR(100),
    ownership VARCHAR(50),
    address VARCHAR(255),
    city VARCHAR(100),
    state_headquartered VARCHAR(100),
    zip VARCHAR(20),
    phone VARCHAR(20),
    amount_covered NUMERIC(15, 2),
    amount_uncovered NUMERIC(15, 2),
    revenue NUMERIC(15, 2),
    covered_encounters INTEGER,
    uncovered_encounters INTEGER,
    covered_medications INTEGER,
    uncovered_medications INTEGER,
    covered_procedures INTEGER,
    uncovered_procedures INTEGER,
    covered_immunizations INTEGER,
    uncovered_immunizations INTEGER,
    unique_customers INTEGER,
    qols_avg FLOAT,
    member_months INTEGER
);

CREATE TABLE procedure (
    start_timestamp TIMESTAMP WITH TIME ZONE,
    stop_timestamp TIMESTAMP WITH TIME ZONE,
    patient_id UUID,
    encounter_id UUID,
    procedure_code TEXT,
    procedure_description TEXT,
    base_cost NUMERIC(12, 2),
    reason_code TEXT,
    reason_description TEXT
);

CREATE TABLE product (
    encounter_date DATE,
    patient_id UUID,
    encounter_id UUID,
    code TEXT,
    description TEXT,
    quantity INTEGER
);

