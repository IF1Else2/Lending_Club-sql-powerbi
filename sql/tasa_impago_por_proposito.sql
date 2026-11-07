--SUBCONSULTA
--Qué tipos de préstamo (purpose) tienen más impago
SELECT
    total,
    impagos,
    purpose,
    ROUND(100.0 * impagos / total, 2) AS tasa_impago_pct
FROM(
 SELECT purpose, 
 	 COUNT(*) FILTER (WHERE loan_status = 'Charged Off') AS impagos,
	 COUNT(*) FILTER (WHERE loan_status IN ('Fully Paid', 'Charged Off')) AS total
FROM fact_loan
GROUP BY purpose
) AS tasa 
ORDER BY tasa_impago_pct DESC;
