#Creo Schema para las Tablas a crear
CREATE SCHEMA formula1_entrega

#Creo Tabla de Circuits (Circuitos de F1)
CREATE TABLE Circuits (
  circuitId INT NOT NULL AUTO_INCREMENT,
  circuitRef VARCHAR(255),
  circuitname VARCHAR(255),
  location VARCHAR(255),
  country VARCHAR(255),
  lat DECIMAL(10,8),
  lng DECIMAL(11,8),
  alt DECIMAL(10,2),
  PRIMARY KEY (circuitId)
);

#Creo Tabla de Drivers (Conductores de F1)
CREATE TABLE Drivers (
  driverId INT NOT NULL AUTO_INCREMENT,
  driverRef VARCHAR(255),
  numberdriver INT,
  codedriver VARCHAR(3),
  forename VARCHAR(255),
  surname VARCHAR(255),
  dateofbirth DATE,
  nationality VARCHAR(255),
  PRIMARY KEY (driverId)
);

#Creo Tabla de Constructors (Empresas constructoras de autos de F1)
CREATE TABLE Constructors (
  constructorId INT NOT NULL AUTO_INCREMENT,
  constructorRef VARCHAR(255),
  nameconstructor VARCHAR(255),
  nationality VARCHAR(255),
  PRIMARY KEY (constructorId)
);

#Creo Tabla de Races (Carreras que comprenden el campeonato de F1) 
CREATE TABLE Races (
  raceId INT NOT NULL AUTO_INCREMENT,
  yearrace VARCHAR(4),
  round VARCHAR(2),
  circuitId INT,
  namecircuit VARCHAR(255),
  datecircuit DATE,
  timecircuit TIME,
  fp1_date DATE,
  fp1_time TIME,
  fp2_date DATE,
  fp2_time TIME,
  fp3_date DATE,
  fp3_time TIME,
  quali_date DATE,
  quali_time TIME,
  sprint_date DATE,
  sprint_time TIME,
  PRIMARY KEY (raceId),
  FOREIGN KEY (circuitId) REFERENCES Circuits(circuitId)
);

#Creo Tabla de Constructors_Standings (Ranking de Constructores segun los puntos obtenidos en el campeonato) 
CREATE TABLE Constructor_standings (
  constructorResultID INT NOT NULL AUTO_INCREMENT,
  raceID INT,
  constructorID INT,
  points INT,
  position INT,
  positionText VARCHAR(255),
  wins INT,
  PRIMARY KEY (constructorResultID),
  FOREIGN KEY (raceID) REFERENCES Races(raceId),
  FOREIGN KEY (constructorID) REFERENCES Constructors(constructorId)
);

#Creo Tabla de Constructor_results (Resultados de los Constructores por Carrera) 
CREATE TABLE Constructor_results (
  constructorResultID INT NOT NULL AUTO_INCREMENT,
  raceID INT,
  constructorID INT,
  points INT,
  statuscons INT,
  PRIMARY KEY (constructorResultID),
  FOREIGN KEY (raceID) REFERENCES Races(raceId),
  FOREIGN KEY (constructorID) REFERENCES Constructors(constructorId)
);

#Creo Tabla de Drivers_Standings ( Ranking de Drivers segun los puntos obtenidos por Carrera)
CREATE TABLE Drivers_standings (
  driverStandingsId INT NOT NULL AUTO_INCREMENT,
  raceID INT,
  driverID INT,
  points INT,
  position INT,
  positionText VARCHAR(255),
  wins INT,
  PRIMARY KEY (driverStandingsId),
  FOREIGN KEY (raceID) REFERENCES Races(raceId),
  FOREIGN KEY (driverID) REFERENCES Drivers(driverId)
);

#Creo Tabla de Status (Glosario de Status) 
CREATE TABLE Statustable (
  statusId INT NOT NULL AUTO_INCREMENT,
  statusname VARCHAR(255),
  PRIMARY KEY (statusId)
);

#Creo Tabla de Results (Grilla de resultados de cada Carrera) 
CREATE TABLE Results (
  resultID INT NOT NULL AUTO_INCREMENT,
  raceID INT,
  driverID INT,
  constructorID INT,
  carnumber INT,
  grid INT,
  position INT,
  positionorder INT,
  points INT,
  laps INT,
  timerace TIME,
  milliseconds INT,
  fastestLap INT,
  ranking INT,
  fastestLapTime TIME,
  fastestLapSpeed TIME,
  statusId INT,
  PRIMARY KEY (resultID),
  FOREIGN KEY (raceID) REFERENCES Races(raceId),
  FOREIGN KEY (driverID) REFERENCES Drivers(driverId),
  FOREIGN KEY (constructorID) REFERENCES Constructors(constructorId),
  FOREIGN KEY (statusId) REFERENCES Statustable(statusId)
);

#Creo Tabla de Pit_stops (Tabla de Pitstops por Carrera con su respectivos datos) 
CREATE TABLE Pit_stops (
  raceId INT,
  driverId INT,
  pitstop INT,
  lap INT,
  pittime TIME,
  duration DECIMAL(10,3),
  milliseconds INT
  );
  
  #Recordar actualizar los Schemas para asegurarse de visualizar todas las tablas recien creadas