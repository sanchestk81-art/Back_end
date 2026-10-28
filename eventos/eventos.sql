-- Active: 1788283805588@@127.0.0.1@5432@eventos_escolares
CREATE TABLE eventos(
    id SERIAL PRIMARY KEY,
    nome VARCHAR (150) NOT NULL,
    descricao TEXT NOT NULL,
    data DATE NOT NULL,
    custo DECIMAL (10, 2) NOT NULL,
    local VARCHAR (200) NOT NULL
);
INSERT INTO eventos
    (nome, descricao, data, custo, local)
VALUES
('Meu BRASIL brasileiro', 'evento em da escola em comemoração as semana da bibliotecae cultura brasileira','2026-10-27 08:00:00', 8596.00, 'Escola SENAI vila rezende'),
('Feira das Tecnologias', 'evento na escola para apresentar as tecnologias mais recentes e inovadoras','2026-09-24 13:15:00', 9234.00, 'Escola SENAI vila rezende'),
('Dia da familia', 'evento na escola para comemorar o dia da familia e a importancia da familia na vida das pessoas','2026-08-15 09:30:00', 5000.00, 'Escola SENAI vila rezende');

CREATE TYPE enum_cargos AS ENUM (
    'AQV - Analista de Qualidade de Vida',
    'OPP - Orientador de Práticas Profissionais',
    'COP - Coordenador Pedagógico',
    'ALU - Alunos' 
    

);


CREATE TABLE organizadores(
    id SERIAL PRIMARY KEY,
    nome VARCHAR (150) NOT NULL,
    cargo enum_cargos,
    evento_id INTEGER REFERENCES eventos(id)
);
INSERT INTO organizadores
(nome, cargo, evento_id)
VALUES
('Kátia', 'AQV - Analista de Qualidade de Vida', 1),
('Discentes','ALU - Alunos', 1),
('Bento',  'OPP - Orientador de Práticas Profissionais', 5),
('Discentes','ALU - Alunos', 5),
('Andriota', 'COP - Coordenador Pedagógico', 6),
('Discentes','ALU - Alunos', 6);



CREATE TABLE patrocinadores (
    id SERIAL PRIMARY KEY,
    nome VARCHAR (150) NOT NULL,
    valor DECIMAL (10,2) DEFAULT 0.0,
    evento_id INT REFERENCES eventos(id)
);

INSERT INTO patrocinadores
(nome, valor, evento_id)
VALUES
('Google gemini', '8596.00', 1),
('ESAB Solda', '1000', 5),
('LIQUI MOLI', '1000', 5),
('TID Software', '1234', 5),
('GWM', '6000', 5),
('SENAI SP', '5000', 6);

SELECT * FROM eventos;
SELECT * FROM organizadores;
SELECT * FROM patrocinadores;


SELECT COUNT(id) FROM eventos;
SELECT COUNT (id) FROM organizadores;
SELECT COUNT(id) FROM patrocinadores;

UPDATE patrocinadores
SET valor = 2000
WHERE nome = 'LIQUI MOLI';

DELETE FROM patrocinadores
WHERE nome = 'TID Software';

