CREATE TABLE project(
	aid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR NOT NULL,
	img VARCHAR NOT NULL,
	date TIMESTAMP,
	content VARCHAR NOT NULL
);

CREATE TABLE users(
	aid INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	email VARCHAR NOT NULL UNIQUE,
	password VARCHAR NOT NULL,
	name VARCHAR NOT NULL UNIQUE
);