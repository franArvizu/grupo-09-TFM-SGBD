# docs

Este directorio contiene la documentación técnica y los artefactos de modelado del sistema.

---

## Archivos incluidos

### modelo_er.dbml

Script del modelo lógico escrito en DBML (Database Markup Language).

Este archivo permite:

- Visualizar el modelo en https://dbdiagram.io
- Regenerar el diagrama en cualquier momento
- Mantener trazabilidad entre diseño conceptual y modelo físico

El archivo puede importarse directamente en dbdiagram.io.

---

### diagrama-ER.png

Imagen exportada del diagrama entidad–relación generado a partir del archivo DBML.

Se incluye para facilitar la visualización rápida sin necesidad de herramientas externas.

---

## Coherencia del modelo

El modelo lógico representado en DBML corresponde al esquema físico implementado en PostgreSQL dentro del directorio `database`.

Esto garantiza:

- Trazabilidad entre diseño y ejecución
- Consistencia estructural
- Integridad referencial
- Reproducibilidad académica

---

## Objetivo del directorio

Este directorio permite:

- Auditar el diseño estructural del sistema
- Analizar las relaciones entre entidades
- Validar el cumplimiento de principios de normalización
- Facilitar la evaluación técnica del proyecto