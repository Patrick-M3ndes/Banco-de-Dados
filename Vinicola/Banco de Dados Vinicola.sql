CREATE DATABASE IF NOT EXISTS vinhosdb;

USE vinhosdb;

CREATE TABLE IF NOT EXISTS Regiao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descritivo TEXT
);

CREATE TABLE IF NOT EXISTS Vinicula (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    telefone VARCHAR(20),
    email VARCHAR(100),
    id_regiao INT,
    FOREIGN KEY (id_regiao) REFERENCES Regiao(id)
);

CREATE TABLE IF NOT EXISTS Vinho (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    ano INT,
    descricao TEXT,
    id_vinicula INT,
    FOREIGN KEY (id_vinicula) REFERENCES Vinicula(id)
);

INSERT INTO Regiao (nome, descritivo) VALUES
('Bordeaux', 'Região famosa pelos vinhos tintos'),
('Napa Valley', 'Região renomada pelos vinhos californianos'),
('Toscana', 'Região italiana conhecida pelos vinhos Chianti'),
('Vale dos Vinhedos', 'Região brasileira famosa pelos vinhos finos'),
('Mendoza', 'Principal região vitivinícola da Argentina');

INSERT INTO Vinicula (nome, descricao, telefone, email, id_regiao) VALUES
('Château Margaux', 'Vinícola tradicional em Bordeaux', '+33 5 57 88 83 83', 'info@chateau-margaux.com', 1),
('Robert Mondavi Winery', 'Vinícola emblemática em Napa Valley', '+1 (888) 766-6328', 'info@robertmondaviwinery.com', 2),
('Antinori', 'Vinícola histórica na Toscana', '+39 055 23 595', 'info@antinori.it', 3),
('Miolo', 'Vinícola brasileira no Vale dos Vinhedos', '+55 (54) 2102-1500', 'miolo@miolo.com.br', 4),
('Catena Zapata', 'Vinícola de renome em Mendoza', '+54 261 413-1100', 'info@catenawines.com', 5);

INSERT INTO Vinho (nome, tipo, ano, descricao, id_vinicula) VALUES
('Château Margaux 2015', 'Tinto', 2015, 'Vinho tinto encorpado com notas de frutas escuras e especiarias.', 1),
('Opus One 2017', 'Tinto', 2017, 'Vinho tinto elegante com sabores intensos de frutas e carvalho.', 2),
('Tignanello 2016', 'Tinto', 2016, 'Vinho toscano de grande estrutura e complexidade.', 3),
('Miolo Merlot Reserva 2018', 'Tinto', 2018, 'Vinho brasileiro macio e frutado.', 4),
('Catena Zapata Malbec Argentino 2016', 'Tinto', 2016, 'Malbec argentino rico em frutas vermelhas e notas de especiarias.', 5);

-- Verifica se o usuário existe antes de criar
DROP USER IF EXISTS 'Somellier'@'localhost';

CREATE USER 'Somellier'@'localhost' IDENTIFIED BY 'senha';

GRANT SELECT ON vinhosdb.Vinho TO 'Somellier'@'localhost';
GRANT SELECT (id, nome) ON vinhosdb.Vinicula TO 'Somellier'@'localhost';

ALTER USER 'Somellier'@'localhost' WITH MAX_QUERIES_PER_HOUR 40;

SELECT v.nome AS NomeVinho, v.ano AS Ano, vi.nome AS NomeVinicula, r.nome AS NomeRegiao
FROM Vinho v
JOIN Vinicula vi ON v.id_vinicula = vi.id
JOIN Regiao r ON vi.id_regiao = r.id;
