# Datasets

Este directorio contiene los datasets utilizados como base conceptual y analítica para el diseño del modelo de datos del proyecto.

Los datasets aquí incluidos están documentados en detalle en la memoria técnica del TFM, donde se describe:

- Origen
- Estructura
- Variables relevantes
- Proceso de análisis
- Justificación de selección

---

## Objetivo del directorio

La carpeta `datasets` cumple una función académica y metodológica:

- Documentar las fuentes de datos utilizadas para el diseño conceptual.
- Permitir reproducibilidad del análisis exploratorio.
- Justificar decisiones de modelado estructural.
- Servir como base para futuras ampliaciones del sistema.

Estos datasets no se cargan automáticamente en la base de datos del MVP, ya que el entorno Docker incluye un esquema y datos controlados mediante `seed_data.sql` para garantizar consistencia en la evaluación.

---

## Datasets incluidos

Se incluyen cuatro datasets, cada uno alineado con una dimensión del sistema:

1. Dataset orientado a procesos industriales y control estadístico.
2. Dataset vinculado a estándares de calidad.
3. Dataset relacionado con métricas de desempeño.
4. Dataset utilizado para análisis estructural y validación conceptual.

(La descripción detallada de cada dataset se encuentra en la memoria técnica del proyecto.)

---

## Rol dentro del proyecto

Los datasets permitieron:

- Identificar entidades principales.
- Definir relaciones entre conceptos.
- Determinar atributos relevantes.
- Diseñar métricas analíticas.
- Validar la necesidad de normalización.

El modelo relacional implementado en PostgreSQL es una abstracción estructurada derivada del análisis de estos conjuntos de datos.

---

## Consideraciones de uso

- Los datasets se incluyen únicamente con fines académicos.
- No forman parte de la ejecución automática del entorno Docker.
- No son necesarios para levantar el MVP en local.
- Sirven como respaldo metodológico del diseño.

---

## Escalabilidad futura

En futuras iteraciones del proyecto, estos datasets podrían:

- Integrarse mediante procesos ETL.
- Alimentar automáticamente tablas del sistema.
- Permitir entrenamiento de modelos predictivos.
- Ampliar el volumen de datos para pruebas de rendimiento.