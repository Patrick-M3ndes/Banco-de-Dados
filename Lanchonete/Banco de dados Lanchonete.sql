drop database if exists Lanchonete;
create database Lanchonete;
use Lanchonete;
-- Criação da tabela Cardapio
CREATE TABLE Cardapio (
    idCardapio varchar(255),
    codigoItem varchar(255),
    nomeItem VARCHAR(255) NOT NULL,
    valor DOUBLE NOT NULL,
    PRIMARY KEY(idCardapio, codigoItem)
);

-- Criação da tabela Telefone
CREATE TABLE Telefone (
    idTelefone varchar(255) PRIMARY KEY,
    numeroTelefone varchar(255) NOT NULL
);

-- Criação da tabela Endereco
CREATE TABLE Endereco (
    cep INT UNIQUE PRIMARY KEY,
    logradouro VARCHAR(255) NOT NULL,
    bairro VARCHAR(255) NOT NULL,
    cidade VARCHAR(255) NOT NULL
);

-- Criação da tabela Cliente
CREATE TABLE Cliente (
    idCliente varchar(255) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cep INT UNIQUE NOT NULL,
    numero VARCHAR(255),
    referencia VARCHAR(255),
    idTelefone VARCHAR(255),
    FOREIGN KEY (idTelefone) REFERENCES Telefone(idTelefone),
    FOREIGN KEY (cep) REFERENCES Endereco(cep)
);

-- Criação da tabela Entregador
CREATE TABLE Entregador (
    idEntregador VARCHAR(255) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    idTelefone VARCHAR(255) NOT NULL,
    FOREIGN KEY (idTelefone) REFERENCES Telefone(idTelefone)
);

-- Criação da tabela StatusEntrega
CREATE TABLE StatusEntrega (
    idStatus VARCHAR(255) PRIMARY KEY,
    statusEntrega VARCHAR(45) NOT NULL
);

-- Criação da tabela Pedido
CREATE TABLE Pedido (
    idPedido varchar(255),
    idCliente varchar(255),
    idStatus varchar(255) NOT NULL,
    dataPedido DATETIME NOT NULL,
    idCardapio varchar(255) not null,
    codigoItem varchar(255) not null,
    quantidade INT NOT NULL,
    idEntregador varchar(255) NOT NULL,
    PRIMARY KEY (idPedido, idCliente),
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idStatus) REFERENCES StatusEntrega(idStatus),
    FOREIGN KEY (idCardapio, codigoItem) REFERENCES Cardapio(idCardapio, codigoItem),
    FOREIGN KEY (idEntregador) REFERENCES Entregador(idEntregador)
);

-- Inserts para a tabela Cardapio
INSERT INTO Cardapio (idCardapio, codigoItem, nomeItem, valor) VALUES 
('C01', 'I01', 'Hamburguer', 10.00),
('C02', 'I02', 'Batata Frita', 5.00),
('C03', 'I03', 'Refrigerante', 4.00),
('C04', 'I04', 'Coxinha', 3.50),
('C05', 'I05', 'Pastel', 6.00),
('C06', 'I06', 'Pizza', 25.00),
('C07', 'I07', 'Suco', 7.00),
('C08', 'I08', 'Salada', 12.00),
('C09', 'I09', 'Bolo', 8.00),
('C10', 'I10', 'Sorvete', 6.00),
('C11', 'I11', 'Milkshake', 9.00),
('C12', 'I12', 'Água Mineral', 2.50),
('C13', 'I13', 'Salada de Frutas', 7.50),
('C14', 'I14', 'Empada', 4.00),
('C15', 'I15', 'Pão de Queijo', 3.00),
('C16', 'I16', 'Sanduíche Natural', 12.00),
('C17', 'I17', 'Café', 2.00),
('C18', 'I18', 'Capuccino', 4.50),
('C19', 'I19', 'Chá Gelado', 5.00),
('C20', 'I20', 'Brigadeiro', 3.50);

-- Inserts para a tabela Telefone
INSERT INTO Telefone (idTelefone, numeroTelefone) VALUES 
('T01', 41987654321),
('T02', 41912345678),
('T03', 41999887766),
('T04', 41911223344),
('T05', 41922334455),
('T06', 41933445566),
('T07', 41955667788),
('T08', 41966778899),
('T09', 41977889900),
('T10', 41988990011),
('T11', '41990011223'),
('T12', '41995566778'),
('T13', '41998877665'),
('T14', '41991234567'),
('T15', '41993456789'),
('T16', '41999881234'),
('T17', '41990123456'),
('T18', '41992345678'),
('T19', '41994567890'),
('T20', '41996789012');

-- Inserts para a tabela Endereco
INSERT INTO Endereco (cep, logradouro, bairro, cidade) VALUES 
(80010000, 'Rua A', 'Centro', 'Curitiba'),
(80020000, 'Rua B', 'Água Verde', 'Curitiba'),
(80030000, 'Rua C', 'Batel', 'Curitiba'),
(80040000, 'Rua D', 'Cabral', 'Curitiba'),
(80050000, 'Rua E', 'Cajuru', 'Curitiba'),
(80060000, 'Rua F', 'Hauer', 'Curitiba'),
(80070000, 'Rua G', 'Portão', 'Curitiba'),
(80080000, 'Rua H', 'Boqueirão', 'Curitiba'),
(80090000, 'Rua I', 'Cristo Rei', 'Curitiba'),
(80100000, 'Rua J', 'Centro Cívico', 'Curitiba'),
(80110000, 'Rua K', 'Juvevê', 'Curitiba'),
(80120000, 'Rua L', 'Rebouças', 'Curitiba'),
(80130000, 'Rua M', 'Água Verde', 'Curitiba'),
(80140000, 'Rua N', 'Santa Felicidade', 'Curitiba'),
(80150000, 'Rua O', 'Fazendinha', 'Curitiba'),
(80160000, 'Rua P', 'Portão', 'Curitiba'),
(80170000, 'Rua Q', 'Boa Vista', 'Curitiba'),
(80180000, 'Rua R', 'Mercês', 'Curitiba'),
(80190000, 'Rua S', 'Jardim das Américas', 'Curitiba'),
(80200000, 'Rua T', 'Bigorrilho', 'Curitiba');

-- Inserts para a tabela Cliente
INSERT INTO Cliente (idCliente, nome, cep, numero, referencia, idTelefone) VALUES 
('CL01', 'João', 80010000, '100', 'Próximo ao mercado', 'T01'),
('CL02', 'Maria', 80020000, '200', 'Em frente ao banco', 'T02'),
('CL03', 'Pedro', 80030000, '300', 'Perto do parque', 'T03'),
('CL04', 'Ana', 80040000, '400', 'Ao lado da padaria', 'T04'),
('CL05', 'Paulo', 80050000, '500', 'Em frente à escola', 'T05'),
('CL06', 'Carlos', 80060000, '600', 'Atrás do shopping', 'T06'),
('CL07', 'Carla', 80070000, '700', 'Próximo ao hospital', 'T07'),
('CL08', 'Lucas', 80080000, '800', 'Ao lado da farmácia', 'T08'),
('CL09', 'Fernanda', 80090000, '900', 'Perto da praça', 'T09'),
('CL10', 'Julia', 80100000, '1000', 'Em frente ao colégio', 'T10'),
('CL11', 'Bruna', 80110000, '1100', 'Ao lado da academia', 'T11'),
('CL12', 'Daniel', 80120000, '1200', 'Próximo ao terminal', 'T12'),
('CL13', 'Gabriela', 80130000, '1300', 'Em frente ao parque', 'T13'),
('CL14', 'Felipe', 80140000, '1400', 'Próximo ao restaurante', 'T14'),
('CL15', 'Patrícia', 80150000, '1500', 'Atrás do mercado', 'T15'),
('CL16', 'Rodrigo', 80160000, '1600', 'Ao lado do shopping', 'T16'),
('CL17', 'Mariana', 80170000, '1700', 'Próximo ao hospital', 'T17'),
('CL18', 'Thiago', 80180000, '1800', 'Perto da escola', 'T18'),
('CL19', 'Aline', 80190000, '1900', 'Ao lado do parque', 'T19'),
('CL20', 'Juliana', 80200000, '2000', 'Em frente à praça', 'T20');

-- Inserts para a tabela Entregador
INSERT INTO Entregador (idEntregador, nome, idTelefone) VALUES 
('E01', 'Rafael', 'T01'),
('E02', 'Diego', 'T02'),
('E03', 'Lucas', 'T03'),
('E04', 'Roberto', 'T04'),
('E05', 'Fernando', 'T05'),
('E06', 'Mateus', 'T06'),
('E07', 'Vinícius', 'T07'),
('E08', 'Gabriel', 'T08'),
('E09', 'Bruno', 'T09'),
('E10', 'Eduardo', 'T10'),
('E11', 'Leonardo', 'T11'),
('E12', 'Gustavo', 'T12'),
('E13', 'Adriano', 'T13'),
('E14', 'Samuel', 'T14'),
('E15', 'Renato', 'T15'),
('E16', 'Vitor', 'T16'),
('E17', 'Marcelo', 'T17'),
('E18', 'André', 'T18'),
('E19', 'Ivan', 'T19'),
('E20', 'Eduarda', 'T20');

-- Inserts para a tabela StatusEntrega
INSERT INTO StatusEntrega (idStatus, statusEntrega) VALUES 
('S01', 'Pedido Realizado'),
('S02', 'Em Preparação'),
('S03', 'Saiu para Entrega'),
('S04', 'Entregue'),
('S05', 'Cancelado'),
('S06', 'Aguardando Confirmação'),
('S07', 'Atrasado'),
('S08', 'Devolvido'),
('S09', 'Reagendado'),
('S10', 'Pronto para Retirada'),
('S11', 'Pedido Cancelado'),
('S12', 'Aguardando Pagamento'),
('S13', 'Pagamento Confirmado'),
('S14', 'Pedido Coletado'),
('S15', 'Em Rota de Entrega'),
('S16', 'Pedido Completo'),
('S17', 'Pedido Não Concluído'),
('S18', 'Entregue ao Cliente'),
('S19', 'Aguardando Avaliação'),
('S20', 'Pedido Rejeitado');

-- Inserts para a tabela Pedido
INSERT INTO Pedido (idPedido, idCliente, idStatus, dataPedido, idCardapio, codigoItem, quantidade, idEntregador) VALUES 
('P01', 'CL01', 'S01', '2024-09-12 12:00:00', 'C01', 'I01', 2, 'E01'),
('P02', 'CL02', 'S02', '2024-09-12 12:05:00', 'C02', 'I02', 1, 'E02'),
('P03', 'CL03', 'S03', '2024-09-12 12:10:00', 'C03', 'I03', 3, 'E03'),
('P04', 'CL04', 'S04', '2024-09-12 12:15:00', 'C04', 'I04', 1, 'E04'),
('P05', 'CL05', 'S05', '2024-09-12 12:20:00', 'C05', 'I05', 4, 'E05'),
('P06', 'CL06', 'S06', '2024-09-12 12:25:00', 'C06', 'I06', 2, 'E06'),
('P07', 'CL07', 'S07', '2024-09-12 12:30:00', 'C07', 'I07', 3, 'E07'),
('P08', 'CL08', 'S08', '2024-09-12 12:35:00', 'C08', 'I08', 1, 'E08'),
('P09', 'CL09', 'S09', '2024-09-12 12:40:00', 'C09', 'I09', 2, 'E09'),
('P10', 'CL10', 'S10', '2024-09-12 12:45:00', 'C10', 'I10', 3, 'E10'),
('P11', 'CL11', 'S11', '2024-09-12 12:50:00', 'C11', 'I11', 1, 'E11'),
('P12', 'CL12', 'S12', '2024-09-12 12:55:00', 'C12', 'I12', 2, 'E12'),
('P13', 'CL13', 'S13', '2024-09-12 13:00:00', 'C13', 'I13', 3, 'E13'),
('P14', 'CL14', 'S14', '2024-09-12 13:05:00', 'C14', 'I14', 1, 'E14'),
('P15', 'CL15', 'S15', '2024-09-12 13:10:00', 'C15', 'I15', 4, 'E15'),
('P16', 'CL16', 'S16', '2024-09-12 13:15:00', 'C16', 'I16', 2, 'E16'),
('P17', 'CL17', 'S17', '2024-09-12 13:20:00', 'C17', 'I17', 3, 'E17'),
('P18', 'CL18', 'S18', '2024-09-12 13:25:00', 'C18', 'I18', 1, 'E18'),
('P19', 'CL19', 'S02', '2024-09-12 13:30:00', 'C19', 'I19', 2, 'E19'),
('P20', 'CL20', 'S02', '2024-09-12 13:35:00', 'C20', 'I20', 3, 'E20');

SELECT Lanchonete.Pedido.idPedido, Lanchonete.StatusEntrega.idStatus, Lanchonete.StatusEntrega.statusEntrega
FROM Lanchonete.Pedido
INNER JOIN Lanchonete.StatusEntrega
ON Lanchonete.Pedido.idStatus = Lanchonete.StatusEntrega.idStatus
WHERE Lanchonete.StatusEntrega.idStatus = 'S02'; 