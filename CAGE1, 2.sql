CREATE database CAGE_1;

CREATE TABLE DHT11_1(
Seq INT AUTO_INCREMENT PRIMARY KEY,
Temperature INT,
Humidity INT,
Sensortime timestamp not null default current_timestamp 
);

CREATE TABLE Illuminance_1(
Seq INT AUTO_INCREMENT PRIMARY KEY,
Brightness INT,
Sensortime timestamp not null default current_timestamp 
);

CREATE TABLE Soil_Moisture_1(
Seq INT AUTO_INCREMENT PRIMARY KEY,
Moisture INT,
Sensortime timestamp not null default current_timestamp 
);

CREATE database CAGE_2;

CREATE TABLE DHT11_2(
Seq INT AUTO_INCREMENT PRIMARY KEY,
Temperature INT,
Humidity INT,
Sensortime timestamp not null default current_timestamp  
);

CREATE TABLE Illuminance_2(
Seq INT AUTO_INCREMENT PRIMARY KEY,
Brightness INT,
Sensortime timestamp not null default current_timestamp 
);

CREATE TABLE Soil_Moisture_2(
Seq INT AUTO_INCREMENT PRIMARY KEY,
Moisture INT,
Sensortime timestamp not null default current_timestamp 
);

SELECT * FROM CAGE_1.dht11_1;
SELECT * FROM CAGE_1.Illuminance_1;
SELECT * FROM CAGE_1.Soil_Moisture_1;

SELECT * FROM CAGE_2.dht11_2;
SELECT * FROM CAGE_2.Illuminance_2;
SELECT * FROM CAGE_2.Soil_Moisture_2;

INSERT INTO dht11_1 (temperature, humidity)
VALUES('1', '2');
INSERT INTO dht11_1 (temperature, humidity)
VALUES('2', '3');
INSERT INTO dht11_1 (temperature, humidity)
VALUES('3', '4');
INSERT INTO dht11_1 (temperature, humidity)
VALUES('4', '5');

INSERT INTO Illuminance_1 (Brightness)
VALUES('2000');
INSERT INTO Soil_Moisture_1 (Moisture)
VALUES('38');

INSERT INTO dht11_2 (temperature, humidity)
VALUES('19', '30');
INSERT INTO Illuminance_2 (Brightness)
VALUES('2000');
INSERT INTO Soil_Moisture_2 (Moisture)
VALUES('38');

DELETE FROM DHT11_1 WHERE seq = 1;

DROP event auto_delete;

CREATE EVENT auto_delete
ON SCHEDULE EVERY  30 second
-- STARTS '2022-05-01 00:00:00'
COMMENT 'ip 정보 삭제'
DO
CALL AUTODELETE();

DROP event autodelete;

CREATE EVENT AUTODELETE
ON SCHEDULE EVERY 1 MINUTE
STARTS CURRENT_TIMESTAMP
DO
DELETE FROM CAGE_1.DHT11_1 where SENSORTIME <= date_sub(curtime(), INTERVAL 1 MINUTE);


select*from DHT11_1 LIMIT 1;

SHOW EVENTS;
