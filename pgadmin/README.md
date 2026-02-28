# pgadmin

Este directorio contiene la configuración necesaria para precargar automáticamente la conexión a la base de datos PostgreSQL dentro de pgAdmin.

Su objetivo es simplificar la experiencia del evaluador, evitando configuraciones manuales y reduciendo posibles errores de conexión.

---

## Archivo incluido

### servers.json

Define un servidor preconfigurado denominado:

    TFM-SPC

Con los siguientes parámetros:

- Host: postgres
- Puerto: 5432
- Base de datos de mantenimiento: tfm_db
- Usuario: tfm
- Modo SSL: prefer

El valor "postgres" como host corresponde al nombre del servicio definido en `docker-compose.yml`, lo que permite que los contenedores se comuniquen dentro de la red interna de Docker.

---

## Funcionamiento

Cuando se levanta el entorno con:

    docker compose up -d

El contenedor de pgAdmin:

1. Se inicia automáticamente.
2. Carga el archivo `servers.json`.
3. Muestra el servidor "TFM-SPC" ya configurado.

El único paso adicional requerido es ingresar la contraseña del usuario de base de datos al momento de conectarse.

---

## Acceso a la interfaz

Una vez iniciado el entorno, la interfaz de pgAdmin estará disponible en:

    http://localhost:5050

Credenciales de acceso a pgAdmin:

- Email: admin@tfm.com
- Password: admin123

Credenciales de la base de datos:

- Host: postgres
- Base de datos: tfm_db
- Usuario: tfm
- Password: tfm_password
- Puerto: 5432

---

## Ventajas del enfoque adoptado

- No requiere instalación local de pgAdmin.
- No requiere configuración manual del servidor.
- Reduce fricción para el evaluador.
- Garantiza consistencia entre entornos.
- Refuerza el principio de reproducibilidad del proyecto.

---

## Justificación técnica

El uso de pgAdmin dentro de Docker junto con un archivo `servers.json` precargado demuestra:

- Buenas prácticas DevOps.
- Automatización del entorno.
- Diseño orientado a experiencia del usuario evaluador.
- Independencia del sistema operativo local.

Este componente forma parte del objetivo general del proyecto: garantizar que el MVP pueda replicarse en cualquier entorno sin dependencias externas adicionales.