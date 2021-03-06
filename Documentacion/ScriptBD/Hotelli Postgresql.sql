CREATE TABLE CLIENTE (
ID_CLI SERIAL NOT NULL,
CEDULA_CLI VARCHAR(15),
NOMBRE_CLI VARCHAR(55),
TELEFONO_CLI VARCHAR(15),
CONSTRAINT PK_CLIENTE PRIMARY KEY (ID_CLI));

CREATE TABLE CATEGORIA (
ID_CAT SERIAL NOT NULL,
CATEGORIA_CAT VARCHAR(50),
PRECIO_CAT DECIMAL,
MAX_PERSONAS_CAT INT,
CONSTRAINT PK_CATEGORIA PRIMARY KEY (ID_CAT));

CREATE TABLE ESTADO (
ID_EST SERIAL NOT NULL,
ESTADO_EST VARCHAR(50),
CONSTRAINT PK_ESTADO PRIMARY KEY (ID_EST));

CREATE TABLE HABITACION (
ID_HAB SERIAL NOT NULL,
NUMERACION_HAB VARCHAR(5),
PISO_HAB INT,
ID_CAT INT,
ID_EST INT,
CONSTRAINT PK_HABITACION PRIMARY KEY (ID_HAB));

CREATE TABLE RESERVACION (
ID_RES INT NOT NULL,
ID_CLI INT,
ID_HAB INT,
FECHA_RES DATE,
NOCHES_RES  INT,
PERSONAS_RES INT,
CONSTRAINT PK_RESERVACION PRIMARY KEY (ID_RES));

ALTER TABLE HABITACION
ADD CONSTRAINT CATEGORIA_FK
FOREIGN KEY (ID_CAT)
REFERENCES CATEGORIA(ID_CAT)
ON DELETE restrict ON UPDATE restrict;

ALTER TABLE HABITACION
ADD CONSTRAINT ESTADO_FK
FOREIGN KEY (ID_EST)
REFERENCES ESTADO(ID_EST)
ON DELETE restrict ON UPDATE restrict;

ALTER TABLE RESERVACION
ADD CONSTRAINT CLIENTE_FK
FOREIGN KEY (ID_CLI)
REFERENCES CLIENTE(ID_CLI)
ON DELETE restrict ON UPDATE restrict;

ALTER TABLE RESERVACION
ADD CONSTRAINT HABITACION_FK
FOREIGN KEY (ID_HAB)
REFERENCES HABITACION(ID_HAB)
ON DELETE restrict ON UPDATE restrict;
