import psycopg2
import random
import time

# Espera para que PostgreSQL esté listo
time.sleep(5)

conn = psycopg2.connect(
    host="postgres",
    database="tfm_db",
    user="tfm",
    password="tfm_password"
)

cursor = conn.cursor()

# Obtener parámetros de la ejecución 1
cursor.execute("""
SELECT objetivo, limite_inferior, limite_superior
FROM EJECUCION_SPC
WHERE ejecucion_id = 1
""")

objetivo, li, ls = cursor.fetchone()

objetivo = float(objetivo)
li = float(li)
ls = float(ls)

# Generar 100 mediciones simuladas
for subgrupo in range(1, 11):
    for _ in range(10):
        valor = random.gauss(objetivo, (ls - li) / 6)
        cursor.execute("""
            INSERT INTO MEDICION_SPC (ejecucion_id, subgrupo, valor_medicion)
            VALUES (1, %s, %s)
        """, (subgrupo, valor))

conn.commit()
cursor.close()
conn.close()

print("✔ Mediciones SPC generadas correctamente.")