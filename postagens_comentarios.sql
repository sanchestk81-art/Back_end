/*Criar tabela*/
CREATE TABLE usuario(
	id SERIAL PRIMARY KEY,
	nome_usuario VARCHAR (100) NOT NULL,
	email_usuario VARCHAR (100) NOT NULL UNIQUE,
	senha VARCHAR (15) NOT NULL,
	nome VARCHAR (20) NOT NULL
);

/*listar todos os usuários*/
SELECT * FROM usuario;

/*Usuários*/
INSERT INTO usuario
	(nome_usuario, email_usuario, senha, nome)
VALUES
	('beltrano', 'beltrano@gmail.com', '6767', 'beltrano mais lindo');

