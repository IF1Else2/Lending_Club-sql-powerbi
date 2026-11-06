# Lending_Club-sql-powerbi
Proyecto Lending Club

¿Qué es Lending Club?
Lending Club fue una compañía estadounidense de préstamos P2P (peer-to-peer).

¿Qué hacían?
La plataforma ponía en contacto a personas que querían invertir su dinero con otras que buscaban un préstamo. Los inversores aportaban el capital a través de Lending Club, que lo transfería a los prestatarios; a medida que estos devolvían el préstamo, el capital y los intereses regresaban a los inversores. Era un modelo beneficioso para ambas partes, ya que solía ofrecer tipos de interés más bajos a los prestatarios y una mayor rentabilidad a los inversores.

El conjunto de datos contiene información detallada de los préstamos concedidos, incluyendo su estado (al corriente, con retraso, totalmente pagado, etc.) y los datos del último pago. Entre las variables se incluyen el grado de riesgo, el número de consultas crediticias, la ubicación (código postal y estado) y la situación de cobro, entre otras. El archivo original consta de ~2,26 millones de registros y 145 variables.

Día 1 — Comprobar el dataset
Fuente: Kaggle (Lending Club Loan Data).
Observaciones: el ZIP contiene dos archivos, loan.csv y LCDataDictionary.xlsx. El diccionario aporta una descripción breve de cada columna, útil para identificar cuáles son las más relevantes.

Notebook de Python
Creamos un DataFrame con pandas a partir de loan.csv y revisamos sus columnas para seleccionar las que contienen información útil. Una vez identificadas, generamos un subconjunto del archivo principal.

Qué hace el script: lee el CSV completo (~2,26M filas, 145 columnas) por trozos (chunks) para no saturar la memoria, se queda con las ~29 columnas relevantes para el análisis de riesgo, limpia los tipos de dato problemáticos y escribe un CSV limpio y más ligero (loan_clean.csv), listo para cargar en PostgreSQL.

Por qué por trozos: 1,16 GB no caben cómodamente en memoria en un portátil normal. Se leen 200.000 filas cada vez, se limpian y se van añadiendo al CSV de salida.

Carga en PostgreSQL
Creamos una base de datos llamada Lending_Club y, dentro, la tabla fact_loan (30 columnas: las 29 seleccionadas más la clave subrogada). Cargamos los datos con el comando \copy desde la consola de PostgreSQL (PSQL Tool).

Nota importante: el dataset original no incluía un identificador único por préstamo (id y member_id venían vacíos). Por eso generé una clave subrogada, loan_sk, que numera cada préstamo automáticamente y permite identificarlo de forma única.
