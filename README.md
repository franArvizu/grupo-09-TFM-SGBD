# TFM – MVP Plataforma Formativa con Módulo SPC

Este repositorio contiene el MVP (Minimum Viable Product) desarrollado para el Trabajo Fin de Máster.

El sistema implementa:

- Un modelo relacional normalizado en PostgreSQL.
- Un bloque formativo estructurado por estándares y etapas.
- Un módulo analítico de Control Estadístico de Procesos (SPC).
- Un generador automático de datos sintéticos.
- Un entorno completamente reproducible mediante Docker.

El proyecto ha sido diseñado con enfoque académico, garantizando coherencia entre modelo lógico, modelo físico y validación analítica.

---

# Arquitectura del sistema

El entorno está compuesto por tres servicios principales:

1. PostgreSQL  
   Base de datos relacional donde se implementa el modelo físico.

2. pgAdmin  
   Interfaz gráfica para visualizar y auditar la base de datos.

3. spc_generator  
   Servicio Python que genera mediciones SPC simuladas automáticamente al iniciar el entorno.

Todos los servicios se orquestan mediante Docker Compose.

---

# Estructura del repositorio

.
├── database/
│ ├── 01_schema.sql
│ ├── 02_seed_data.sql
│ ├── 03_consultas_representativas.sql
│ └── README.md
│
├── spc_generator/
│ ├── Dockerfile
│ ├── generate_spc.py
│ ├── requirements.txt
│ └── README.md
│
├── pgadmin/
│ ├── servers.json
│ └── README.md
│
├── datasets/
│ └── README.md
│
├── docs/
│ ├── modelo_er.dbml
│ ├── diagrama-ER.jpg
│ └── README.md
│
└── docker-compose.yml


---

# Requisitos previos

Para ejecutar el entorno es necesario tener instalado:

- Docker Desktop (Windows, macOS o Linux)
- Docker Compose (incluido en Docker Desktop)

Podría requerirse:
- Instalación local de Python 3

No se requiere:

- Instalación local de PostgreSQL
- Instalación local de pgAdmin

---

# Instrucciones para ejecutar el MVP

## 1. Clonar el repositorio


git clone <url-del-repositorio>
cd <nombre-del-repositorio>


## 2. Construir y levantar los contenedores


docker compose up --build


Este comando:

- Construye el contenedor del generador SPC
- Inicia PostgreSQL
- Ejecuta los scripts SQL automáticamente
- Genera mediciones SPC sintéticas
- Inicia pgAdmin

Si se desea ejecutar en segundo plano:


docker compose up -d --build


---

# Acceso a la interfaz de base de datos

Una vez levantado el entorno:

Abrir en navegador:


http://localhost:5050


Credenciales de acceso a pgAdmin:

- Email: admin@tfm.com
- Password: admin123

El servidor "TFM-SPC" aparecerá preconfigurado.

Credenciales de la base de datos:

- Host: postgres
- Base de datos: tfm_db
- Usuario: tfm
- Password: tfm_password
- Puerto: 5432

---

# Validación del sistema

Dentro de pgAdmin se pueden:

- Visualizar las tablas creadas automáticamente.
- Ejecutar las consultas incluidas en `03_consultas_representativas.sql`.
- Verificar la inserción automática de mediciones SPC generadas por el contenedor Python.

El sistema queda completamente operativo tras el levantamiento inicial.

---

# Reinicio completo del entorno

Si se desea reconstruir la base desde cero:


docker compose down -v
docker compose up --build


El parámetro `-v` elimina los volúmenes, garantizando recreación limpia de la base de datos.

---

# Justificación técnica

El uso de Docker permite:

- Reproducibilidad total del entorno.
- Independencia del sistema operativo.
- Eliminación de dependencias externas.
- Automatización del proceso de inicialización.
- Evaluación simplificada por parte del tribunal.

El diseño del modelo relacional garantiza:

- Integridad referencial.
- Normalización estructural.
- Separación por dominios funcionales.
- Escalabilidad futura.

El módulo SPC demuestra:

- Soporte para agregaciones estadísticas.
- Simulación de procesos industriales.
- Integración entre formación y análisis cuantitativo.

---

# Limitaciones actuales

- El sistema no incluye interfaz web de usuario final.
- No se implementa autenticación real (hash simulado).
- El generador SPC produce datos sintéticos básicos.
- No existe proceso ETL automatizado para datasets externos.

Estas decisiones son coherentes con el alcance definido para el MVP.

---

# Conclusión

El proyecto demuestra la viabilidad técnica de una plataforma formativa integrada con análisis SPC, implementada bajo principios de normalización, reproducibilidad y separación de responsabilidades.

El entorno es completamente replicable mediante un único comando Docker, garantizando consistencia en la evaluación académica.

### Equipo

Omar Osvaldo — Ingeniería de Manufactura

Juan Carlos — Marketing Digital y Segmentación

Charlyn — Documentación y Redacción

Ana — Análisis de Datos

Francisco — Ingeniería de Sistemas y Desarrollo de Software

### Licencia

Este repositorio se utiliza con fines académicos y educativos.
