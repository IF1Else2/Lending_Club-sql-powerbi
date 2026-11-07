-- =================================================
--¿Cuánto dinero se pierde en impagos (exposición)?
-- =================================================

SELECT SUM(loan_amnt - total_pymnt) AS perdida_total
FROM fact_loan 
WHERE loan_status = 'Charged Off';
