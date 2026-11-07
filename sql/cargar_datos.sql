-- ===============================================================
--  Cargar Datos  (ejecutar en la PSQL Tool)
--  (Si va a utilizar este script asegurese de cambiar la ruta) 
-- ===============================================================
\copy fact_loan (loan_amnt, funded_amnt, term_months, int_rate, installment, grade, sub_grade, issue_d, purpose, loan_status, emp_length, home_ownership, annual_inc, verification_status, dti, addr_state, delinq_2yrs, open_acc, pub_rec, revol_bal, revol_util, total_acc, mort_acc, pub_rec_bankruptcies, out_prncp, total_pymnt, total_rec_prncp, total_rec_int, recoveries) FROM 'C:/Users/Usuario/Documents/Lending Club Proyect/archive/loan_clean.csv' WITH (FORMAT csv, HEADER true, ENCODING 'UTF8');