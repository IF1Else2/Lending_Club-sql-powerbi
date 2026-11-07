--=========================================================================================
-- ¿Qué plazo (36 vs 60 meses) genera más intereses por préstamo — y a qué coste de riesgo?
--=========================================================================================
 SELECT 
     term_months as plazo,
     COUNT (*) as cantidad,
     ROUND(AVG(total_rec_int)) AS interes_medio,
     ROUND(100.0 * COUNT(*) FILTER (WHERE loan_status = 'Charged Off')
          / COUNT(*) FILTER (WHERE loan_status IN ('Fully Paid', 'Charged Off')), 2) AS tasa_impago_pct
FROM fact_loan
GROUP BY plazo
ORDER BY plazo;