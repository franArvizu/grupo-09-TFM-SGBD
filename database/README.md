# Database

Este directorio contiene los scripts SQL necesarios para la creación, inicialización y validación del modelo físico implementado en PostgreSQL para el MVP del TFM.

Los scripts están organizados de forma secuencial y se ejecutan automáticamente al levantar el contenedor PostgreSQL por primera vez mediante Docker.

---

## Estructura del directorio

### 01_schema.sql

Define la estructura completa del modelo relacional.

Incluye tres bloques principales:

### Bloque contenido formativo

- ESTANDAR
- ETAPA
- FUENTE
- CONCEPTO
- PREGUNTA

Este bloque modela la estructura pedagógica del sistema, incluyendo:

- Asociación entre estándares y etapas
- Trazabilidad de conceptos hacia fuentes externas
- Nivel de dificultad en conceptos y preguntas
- Longitud del contenido como métrica analítica

---

### Bloque usuario y gamificación

- USUARIO
- PROGRESO
- EJERCICIO

Incluye:

- Seguimiento del estado del usuario por concepto
- Puntuación acumulada
- Racha de interacción (métrica de gamificación)
- Registro de ejercicios SPC completados

---

### Bloque analítico SPC

- EJECUCION_SPC
- MEDICION_SPC

Permite modelar:

- Parámetros de un proceso industrial
- Límites de especificación
- Mediciones agrupadas por subgrupo
- Evaluación de capacidad del proceso

---

### Características técnicas implementadas

- Claves primarias (PRIMARY KEY)
- Claves foráneas con ON DELETE CASCADE o SET NULL
- Restricciones CHECK
- Restricciones UNIQUE
- Índices para optimización de consultas frecuentes

El diseño garantiza:

- Integridad referencial
- Separación conceptual entre bloques funcionales
- Soporte para consultas analíticas
- Escalabilidad estructural

---

### 02_seed_data.sql

Contiene datos iniciales que permiten validar inmediatamente el funcionamiento del sistema sin inserciones manuales.

Incluye:

- Fuentes documentales
- Estándares
- Etapas
- Conceptos
- Preguntas
- Usuario de prueba
- Ejecución SPC base
- Mediciones iniciales
- Ejercicio asociado

Permite probar consultas formativas y analíticas desde el primer arranque.

---

### 03_consultas_representativas.sql

Incluye consultas SQL que validan los principales casos de uso:

- Recuperación de conceptos por etapa y nivel de dificultad
- Recuperación de preguntas por concepto
- Cálculo de medias por subgrupo
- Cálculo de media global del proceso
- Identificación de mediciones fuera de límites
- Ranking de desempeño por usuario

Estas consultas demuestran que el modelo soporta:

- JOIN entre entidades relacionadas
- Operaciones de agregación (AVG, GROUP BY)
- Filtros por dificultad
- Ordenamiento por métricas de desempeño

---

## Ejecución automática

Los scripts se ejecutan automáticamente al inicializar el contenedor PostgreSQL gracias al volumen configurado en docker-compose.

No es necesaria intervención manual.