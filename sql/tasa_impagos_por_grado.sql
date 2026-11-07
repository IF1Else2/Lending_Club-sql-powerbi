--SUBCONSULTA
SELECT
    impagos,
    total,
	grade,
    ROUND(100.0 * impagos / total, 2) AS tasa_impago_pct
FROM(
 SELECT grade, 
 	 COUNT(*) FILTER (WHERE loan_status = 'Charged Off') AS impagos,
	 COUNT(*) FILTER (WHERE loan_status IN ('Fully Paid', 'Charged Off')) AS total
FROM fact_loan
GROUP BY grade
) AS tasa;
