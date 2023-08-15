INSERT INTO Previsiones (Prev_Cod_Usuario, Prev_Cod_Glosa)
VALUES 
("PA", "PARTICULAR"),
("FA", "FONASA A"),
("FB", "FONASA B"),
("FC", "FONASA C"),
("FD", "FONASA D");

INSERT INTO Pacientes (Pac_Rut, Pac_Nombres, Pac_Apellido_Paterno, Pac_Apellido_Materno, Pac_Fecha_Nacimiento, Prev_Id)
VALUES
("23234567-6", "Pedro", "Perez", "Zamora", '1970-03-01', 1),
("34321673-8", "Jorge", "Gonzalez", "Ríos", '1973-12-25', 5),
("98654358-2", "Miguel", "Tapia", "Mendoza", '1980-09-18', 3),
("43123654-3", "Claudio", "Narea", "Guajardo", '1979-07-04', 4),
("15043345-5", "Alberto", "Cuevas", "Olmedo", '1975-10-06', 2);

INSERT INTO Especialidades_Medicas (Esp_Cod_Usuario, Esp_Cod_Glosa) VALUES
(01, "Pediatría"),
(02, "Medicina interna"),
(03, "Neonatología"),
(04, "Enfermedad respiratoria pediátrica (broncopulmonar infantil)"),
(05, "Enfermedad respiratoria de adulto (broncopulmonar)"),
(06, "Cardiología pediátrica"),
(07, "Cardiología adulto"),
(08, "Endocrinología pediátrica"),
(09, "Endocrinología adulto"),
(10, "Gastroenterología pediátrica"),
(11, "Gastroenterología adulto"),
(12, "Genética clínica"),
(13, "Hemato-oncología infantil"),
(14, "Hematología adulto"),
(15, "Nefrología pediátrica"),
(16, "Nefrología adulto"),
(17, "Nutriólogo pediátrico"),
(18, "Nutriólogo adulto"),
(19, "Reumatología pediátrica"),
(20, "Reumatología adulto"),
(21, "Dermatología"),
(22, "Infectología pediátrica"),
(23, "Infectología adulto"),
(24, "Inmunología"),
(25, "Geriatría"),
(26, "Medicina física y rehabilitación pediátrica (fisiatría pediátrica)"),
(27, "Medicina física y rehabilitación adulto (fisiatría adulto)"),
(28, "Neurología pediátrica"),
(29, "Neurología adulto"),
(30, "Oncología médica"),
(31, "Psiquiatría pediátrica y de la adolescencia"),
(32, "Psiquiatría adulto"),
(33, "Cirugía pediátrica"),
(34, "Cirugía general adulto"),
(35, "Cirugía digestiva (alta)"),
(36, "Cirugía de cabeza, cuello y maxilofacial"),
(37, "Cirugía plástica y reparadora pediátrica"),
(38, "Cirugía plástica y reparadora adulto"),
(39, "Coloproctología (cirugía digestiva baja)"),
(40, "Cirugía tórax"),
(41, "Cirugía vascular periférica"),
(42, "Neurocirugía"),
(43, "Cirugía cardiovascular"),
(44, "Anestesiología"),
(45, "Obstetricia"),
(46, "Ginecología pediátrica y de la adolescencia"),
(47, "Ginecología adulto"),
(48, "Oftalmología"),
(49, "Otorrinolaringología"),
(50, "Traumatología y ortopedia pediátrica"),
(51, "Traumatología y ortopedia adulto"),
(52, "Urología pediátrica"),
(53, "Urología adulto"),
(54, "Medicina familiar del niño"),
(55, "Medicina familiar"),
(56, "Medicina familiar adulto"),
(57, "Diabetología"),
(58, "Medicina nuclear (excluye informes)"),
(59, "Imagenología"),
(60, "Radioterapia oncológica");

INSERT INTO Atenciones (Ate_Folio, Ate_Fecha, Ate_Profesional, Ate_Actividad, Esp_Id, Pac_Id)
VALUES
(1, '2021-06-01', "Juan Perez", "Consulta Nueva", 34, 1),
(2, '2021-06-02', "Pablo Perez", "Consulta Repetida", 43, 3),
(3, '2021-06-03', "Mauricio Perez", "Consulta Abreviada", 21, 5),
(4, '2021-06-04', "Marcos Perez", "Consulta Repetida", 7, 2),
(5, '2021-06-05', "Alejandro Perez", "Consulta Repetida", 2, 4),
(6, '2021-06-06', "Marcos Perez", "Consulta Repetida", 7, 5),
(7, '2021-06-07', "Marcos Perez", "Consulta Nueva", 7, 3),
(8, '2021-06-08', "Alejandro Perez", "Consulta Repetida", 2, 1),
(9, '2021-06-09', "Pablo Perez", "Consulta Repetida", 43, 2);

SELECT EM.Esp_Cod_Usuario, EM.Esp_Cod_Glosa, A.Ate_Actividad, COUNT(*) AS Cantidad_Consultas
FROM Atenciones A 
INNER JOIN Especialidades_Medicas EM ON A.Esp_Id = EM.Esp_Id
GROUP BY EM.Esp_Cod_Usuario, EM.Esp_Cod_Glosa, A.Ate_Actividad;

SELECT P.Pac_Rut, P.Pac_Nombres, P.Pac_Apellido_Paterno, P.Pac_Apellido_Materno, A.Ate_Folio, A.Ate_Fecha, A.Ate_Profesional, A.Ate_Actividad
FROM Atenciones A
INNER JOIN Pacientes P ON A.Pac_Id = P.Pac_Id
WHERE A.Ate_Fecha BETWEEN '2021-06-02' AND '2021-06-09' AND A.Ate_Actividad = 'Consulta Repetida';

SELECT P.Prev_Cod_Usuario AS Esp_Cod_Usuario, P.Prev_Cod_Glosa AS Esp_Cod_Glosa, COUNT(*) AS Cantidad_Registros
FROM Previsiones P
JOIN Pacientes Pa ON P.Prev_id = Pa.Prev_id
JOIN Atenciones A ON Pa.Pac_Id = A.Pac_Id
GROUP BY P.Prev_Cod_Usuario, P.Prev_Cod_Glosa;
