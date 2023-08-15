CREATE DATABASE IF NOT EXISTS BD_Atenciones;

USE BD_Atenciones;

CREATE TABLE Previsiones (
  Prev_id INT AUTO_INCREMENT PRIMARY KEY,
  Prev_Cod_Usuario CHAR(2),
  Prev_Cod_Glosa VARCHAR(200)
);

CREATE TABLE Pacientes (
  Pac_Id INT AUTO_INCREMENT PRIMARY KEY,
  Pac_Rut CHAR(10),
  Pac_Nombres VARCHAR(200),
  Pac_Apellido_Paterno VARCHAR(200),
  Pac_Apellido_Materno VARCHAR(200),
  Pac_Fecha_Nacimiento DATE,
  Prev_id INT,
  FOREIGN KEY(Prev_id) REFERENCES Previsiones(Prev_id)
);

CREATE TABLE Especialidades_Medicas (
  Esp_Id INT AUTO_INCREMENT PRIMARY KEY,
  Esp_Cod_Usuario CHAR(2),
  Esp_Cod_Glosa VARCHAR(200)
);

CREATE TABLE Atenciones (
  Ate_Id INT AUTO_INCREMENT PRIMARY KEY,
  Ate_Folio INT,
  Ate_Fecha DATE,
  Ate_Profesional VARCHAR(200),
  Ate_Actividad VARCHAR(200),
  Esp_Id INT,
  Pac_Id INT,
  FOREIGN KEY(Esp_Id) REFERENCES Especialidades_Medicas(Esp_Id),
  FOREIGN KEY(Pac_Id) REFERENCES Pacientes(Pac_Id)
);

