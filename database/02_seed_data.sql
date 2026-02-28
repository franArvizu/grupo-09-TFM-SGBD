-- =========================
-- FUENTE
-- =========================

INSERT INTO FUENTE (url, dominio, tipo_licencia)
VALUES
('https://www.iso.org', 'iso.org', 'Oficial'),
('https://asq.org', 'asq.org', 'Educativo');

-- =========================
-- ESTANDARES
-- =========================

INSERT INTO ESTANDAR (nombre, descripcion)
VALUES 
('ISO 9001', 'Gestión de calidad'),
('ISO 13053', 'Six Sigma y mejora de procesos');

-- =========================
-- ETAPAS
-- =========================

INSERT INTO ETAPA (nombre, orden)
VALUES
('Definir', 1),
('Medir', 2),
('Analizar', 3);

-- =========================
-- CONCEPTOS
-- =========================

INSERT INTO CONCEPTO (estandar_id, etapa_id, fuente_id, nombre_concepto, texto, nivel_dificultad, longitud_texto)
VALUES
(2, 1, 2, 'CTQ', 'Critical to Quality', 2, 18),
(2, 2, 2, 'Media', 'Promedio del proceso', 1, 20),
(2, 3, 2, 'Cpk', 'Índice de capacidad del proceso', 4, 32);

-- =========================
-- PREGUNTAS
-- =========================

INSERT INTO PREGUNTA (concepto_id, enunciado, opcion_a, opcion_b, opcion_c, opcion_d, opcion_correcta, nivel_dificultad, explicacion)
VALUES
(2, '¿Qué representa la media?', 'Variabilidad', 'Promedio', 'Límite superior', 'Error estándar', 'B', 1, 'La media es el promedio del proceso'),
(3, '¿Qué evalúa el Cpk?', 'Velocidad', 'Capacidad del proceso', 'Costo', 'Tiempo ciclo', 'B', 4, 'Cpk mide qué tan centrado está el proceso');

-- =========================
-- USUARIO
-- =========================

INSERT INTO USUARIO (nombre_usuario, correo, password_hash)
VALUES
('fran_dev', 'fran@email.com', 'hash_simulado');

-- =========================
-- EJECUCION SPC
-- =========================

INSERT INTO EJECUCION_SPC (proceso_id, objetivo, limite_inferior, limite_superior, unidad, semilla)
VALUES
('PROC_01', 50, 45, 55, 'mm', 123);

-- =========================
-- MEDICIONES INICIALES
-- =========================

INSERT INTO MEDICION_SPC (ejecucion_id, subgrupo, valor_medicion)
VALUES
(1,1,49.5),
(1,1,50.2),
(1,1,48.9),
(1,2,51.1),
(1,2,49.8),
(1,2,50.4);

-- =========================
-- EJERCICIO
-- =========================

INSERT INTO EJERCICIO (usuario_id, ejecucion_id, cpk_enviado, media_enviada, cpk_correcto, puntuacion)
VALUES
(1,1,1.2,50.0,1.35,80.00);