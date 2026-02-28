# spc_generator

Este módulo contiene el generador automático de datos sintéticos SPC (Statistical Process Control) utilizado para alimentar el modelo analítico del sistema.

Su ejecución está completamente integrada dentro del entorno Docker, por lo que no requiere instalación manual de Python ni dependencias adicionales en el equipo del evaluador.

---

## Objetivo del módulo

El propósito de este componente es:

- Generar mediciones simuladas de un proceso industrial.
- Insertarlas automáticamente en la tabla MEDICION_SPC.
- Permitir la validación de consultas analíticas y cálculos estadísticos.
- Garantizar reproducibilidad y autonomía del entorno local.

Este enfoque permite validar el bloque analítico del TFM sin depender de datasets externos.

---

## Arquitectura técnica

El módulo está compuesto por:

### Dockerfile

Define un contenedor basado en:

- python:3.11-slim

Incluye los siguientes pasos:

1. Define el directorio de trabajo `/app`.
2. Instala dependencias desde `requirements.txt`.
3. Copia el script `generate_spc.py`.
4. Ejecuta automáticamente el script al iniciar el contenedor.

Esto garantiza que la generación de datos sea automática al levantar el entorno.

---

### generate_spc.py

Script encargado de:

1. Esperar a que PostgreSQL esté disponible.
2. Conectarse a la base de datos mediante `psycopg2`.
3. Obtener los parámetros de la ejecución SPC inicial:
   - objetivo
   - límite inferior
   - límite superior
4. Generar 100 mediciones simuladas utilizando una distribución normal:
   - 10 subgrupos
   - 10 mediciones por subgrupo
5. Insertar los registros en la tabla `MEDICION_SPC`.

La desviación estándar utilizada se calcula como:

    (limite_superior - limite_inferior) / 6

Esto simula un proceso aproximadamente centrado dentro de los límites de especificación, coherente con fundamentos básicos de SPC.

---

### requirements.txt

Contiene la dependencia:

- psycopg2-binary

Esta librería permite la conexión directa a PostgreSQL desde Python.

---

## Ejecución dentro del entorno Docker

El servicio `spc_generator` se define en `docker-compose.yml` con:

- Dependencia del servicio `postgres`
- Reinicio deshabilitado (`restart: "no"`)

Al ejecutar:

    docker compose up -d

El contenedor:

1. Se construye.
2. Ejecuta el script.
3. Inserta las mediciones.
4. Finaliza con código de salida 0.

Este comportamiento es intencional: el generador actúa como tarea de inicialización del dataset analítico.

---

## Reproducibilidad

El sistema utiliza:

- Una ejecución SPC inicial precargada en `02_seed_data.sql`
- Una semilla almacenada en la tabla `EJECUCION_SPC`

Esto permite:

- Controlar parámetros del proceso.
- Escalar la generación en futuros sprints.
- Mantener coherencia entre ejecución y mediciones generadas.

---

## Consideraciones académicas

La incorporación del generador dentro de Docker demuestra:

- Separación clara entre lógica de generación y base de datos.
- Automatización del entorno.
- Capacidad de simulación de datos industriales.
- Enfoque reproducible independiente del sistema operativo.

Este módulo valida la dimensión analítica del modelo físico implementado.