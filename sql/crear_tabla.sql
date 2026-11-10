-- ===============================================================
-- Crear Tabla
-- ===============================================================
CREATE TABLE fact_loan (
    loan_sk               BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 
    -- prestamo
    loan_amnt             NUMERIC(12,2),
    funded_amnt           NUMERIC(12,2),
    term_months           INTEGER,
    int_rate              NUMERIC(6,3),
    installment           NUMERIC(10,2),
    grade                 VARCHAR(2),
    sub_grade             VARCHAR(4),
    issue_d               DATE,
    purpose               VARCHAR(50),
    loan_status           VARCHAR(60),
 
    -- solicitante
    emp_length            VARCHAR(20),
    home_ownership        VARCHAR(20),
    annual_inc            NUMERIC(14,2),
    verification_status   VARCHAR(30),
    dti                   NUMERIC(8,2),
    addr_state            VARCHAR(5),
 
    -- perfil de credito
    delinq_2yrs           INTEGER,
    open_acc              INTEGER,
    pub_rec               INTEGER,
    revol_bal             NUMERIC(14,2),
    revol_util            NUMERIC(6,2),
    total_acc             INTEGER,
    mort_acc              INTEGER,
    pub_rec_bankruptcies  INTEGER,
 
    -- dinero / resultado
    out_prncp             NUMERIC(14,2),
    total_pymnt           NUMERIC(14,2),
    total_rec_prncp       NUMERIC(14,2),
    total_rec_int         NUMERIC(14,2),
    recoveries            NUMERIC(14,2)
);