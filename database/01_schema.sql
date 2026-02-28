-- =========================
-- BLOQUE CONTENIDO
-- =========================

CREATE TABLE ESTANDAR (
    estandar_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT
);

CREATE TABLE ETAPA (
    etapa_id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    orden INT NOT NULL CHECK (orden > 0)
);

CREATE TABLE FUENTE (
    fuente_id SERIAL PRIMARY KEY,
    url VARCHAR(255),
    dominio VARCHAR(150),
    tipo_licencia VARCHAR(100)
);

CREATE TABLE CONCEPTO (
    concepto_id SERIAL PRIMARY KEY,
    estandar_id INT NOT NULL REFERENCES ESTANDAR(estandar_id) ON DELETE CASCADE,
    etapa_id INT NOT NULL REFERENCES ETAPA(etapa_id) ON DELETE CASCADE,
    fuente_id INT REFERENCES FUENTE(fuente_id) ON DELETE SET NULL,
    nombre_concepto VARCHAR(150) NOT NULL,
    texto TEXT NOT NULL,
    nivel_dificultad INT CHECK (nivel_dificultad BETWEEN 1 AND 5),
    longitud_texto INT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_concepto_etapa ON CONCEPTO(etapa_id);
CREATE INDEX idx_concepto_dificultad ON CONCEPTO(nivel_dificultad);

CREATE TABLE PREGUNTA (
    pregunta_id SERIAL PRIMARY KEY,
    concepto_id INT NOT NULL REFERENCES CONCEPTO(concepto_id) ON DELETE CASCADE,
    enunciado TEXT NOT NULL,
    opcion_a VARCHAR(255) NOT NULL,
    opcion_b VARCHAR(255) NOT NULL,
    opcion_c VARCHAR(255) NOT NULL,
    opcion_d VARCHAR(255) NOT NULL,
    opcion_correcta CHAR(1) CHECK (opcion_correcta IN ('A','B','C','D')),
    nivel_dificultad INT CHECK (nivel_dificultad BETWEEN 1 AND 5),
    explicacion TEXT
);

CREATE INDEX idx_pregunta_concepto ON PREGUNTA(concepto_id);

-- =========================
-- BLOQUE USUARIO
-- =========================

CREATE TABLE USUARIO (
    usuario_id SERIAL PRIMARY KEY,
    nombre_usuario VARCHAR(100) UNIQUE NOT NULL,
    correo VARCHAR(150) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE PROGRESO (
    progreso_id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL REFERENCES USUARIO(usuario_id) ON DELETE CASCADE,
    concepto_id INT NOT NULL REFERENCES CONCEPTO(concepto_id) ON DELETE CASCADE,
    estado VARCHAR(50) CHECK (estado IN ('pendiente','en_progreso','completado')),
    puntuacion DECIMAL(5,2),
    ultima_interaccion TIMESTAMP,
    racha INT DEFAULT 0,
    UNIQUE (usuario_id, concepto_id)
);

-- =========================
-- BLOQUE SPC
-- =========================

CREATE TABLE EJECUCION_SPC (
    ejecucion_id SERIAL PRIMARY KEY,
    proceso_id VARCHAR(50) NOT NULL,
    objetivo DECIMAL NOT NULL,
    limite_inferior DECIMAL NOT NULL,
    limite_superior DECIMAL NOT NULL,
    unidad VARCHAR(20),
    semilla INT,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CHECK (limite_inferior < objetivo),
    CHECK (objetivo < limite_superior)
);

CREATE TABLE MEDICION_SPC (
    medicion_id SERIAL PRIMARY KEY,
    ejecucion_id INT NOT NULL REFERENCES EJECUCION_SPC(ejecucion_id) ON DELETE CASCADE,
    subgrupo INT NOT NULL,
    valor_medicion DECIMAL NOT NULL,
    fecha_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_medicion_ejecucion ON MEDICION_SPC(ejecucion_id);

CREATE TABLE EJERCICIO (
    ejercicio_id SERIAL PRIMARY KEY,
    usuario_id INT NOT NULL REFERENCES USUARIO(usuario_id) ON DELETE CASCADE,
    ejecucion_id INT NOT NULL REFERENCES EJECUCION_SPC(ejecucion_id) ON DELETE CASCADE,
    cpk_enviado DECIMAL,
    media_enviada DECIMAL,
    cpk_correcto DECIMAL,
    puntuacion DECIMAL(5,2),
    fecha_completado TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);