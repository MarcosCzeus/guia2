CREATE DATABASE base_de_datos;
USE base_de_datos;
CREATE TABLE ocupaciones(
id_ocupacion int(11) NOT NULL AUTO_INCREMENT,
ocupacion varchar(50) NOT NULL,
PRIMARY KEY (`id_ocupacion`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT
CHARSET=latin1;
CREATE TABLE persona (
id_persona int(11) NOT NULL AUTO_INCREMENT,
nombre_persona varchar(100) NOT NULL,
edad_persona int(11) NOT NULL,
sexo_persona varchar(50) NOT NULL,
id_ocupacion int(11) NOT NULL,
fecha_nac date NOT NULL,
usuario varchar(50) NOT NULL,
contrasenia varchar(50) NOT NULL,
PRIMARY KEY (`id_persona`),
KEY id_ocupacion (id_ocupacion)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT
CHARSET=latin1;
ALTER TABLE persona
ADD CONSTRAINT persona_ibfk_1
FOREIGN KEY (id_ocupacion)
REFERENCES ocupaciones (id_ocupacion);
INSERT INTO `ocupaciones` (`id_ocupacion`, `ocupacion`)
VALUES(1, 'Doctor'), (2, 'Emprendedor'), (3, 'Profesor');
INSERT INTO persona (id_persona, nombre_persona, edad_persona,
sexo_persona, id_ocupacion, fecha_nac, usuario, contrasenia) VALUES
(1, 'Marcos Velasquez', 19, 'Masculino', 1, '1111-01-01', 'usuario1','usuario1'),
(2, 'Alejandra Mazariego', 20, 'Femenino', 2, '2222-02-02','usuario2','usuario2'),
(3, 'Ashley Aguilar', 18, 'Femenino', 3, '1999-03-03','usuario3','usuario3');