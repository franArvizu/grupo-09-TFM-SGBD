-- ==========================================
-- Obtener conceptos por etapa y dificultad
-- ==========================================

SELECT c.nombre_concepto, c.nivel_dificultad, e.nombre AS etapa
FROM CONCEPTO c
JOIN ETAPA e ON c.etapa_id = e.etapa_id
WHERE e.nombre = 'Medir'
AND c.nivel_dificultad <= 3;


-- ==========================================
-- Obtener preguntas por concepto
-- ==========================================

SELECT p.enunciado, p.opcion_a, p.opcion_b, p.opcion_c, p.opcion_d
FROM PREGUNTA p
JOIN CONCEPTO c ON p.concepto_id = c.concepto_id
WHERE c.nombre_concepto = 'Cpk';


-- ==========================================
-- Media por subgrupo (SPC)
-- ==========================================

SELECT subgrupo, AVG(valor_medicion) AS media_subgrupo
FROM MEDICION_SPC
WHERE ejecucion_id = 1
GROUP BY subgrupo
ORDER BY subgrupo;


-- ==========================================
-- Media global del proceso
-- ==========================================

SELECT AVG(valor_medicion) AS media_global
FROM MEDICION_SPC
WHERE ejecucion_id = 1;


-- ==========================================
-- Mediciones fuera de límites
-- ==========================================

SELECT m.valor_medicion
FROM MEDICION_SPC m
JOIN EJECUCION_SPC e ON m.ejecucion_id = e.ejecucion_id
WHERE m.valor_medicion < e.limite_inferior
   OR m.valor_medicion > e.limite_superior;


-- ==========================================
-- Ranking de ejercicios por usuario
-- ==========================================

SELECT u.nombre_usuario, e.puntuacion
FROM EJERCICIO e
JOIN USUARIO u ON e.usuario_id = u.usuario_id
ORDER BY e.puntuacion DESC;