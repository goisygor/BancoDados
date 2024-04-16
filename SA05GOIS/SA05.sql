CREATE DATABASE SA05_YGORG0IS;

-- 1
CREATE TABLE Clientes (
    ID INT PRIMARY KEY,
    Nome VARCHAR(60),
    Sobrenome VARCHAR(30),
    Email VARCHAR(100) UNIQUE
);

--2
CREATE TABLE Pedidos (
    ID INT PRIMARY KEY,
    ID_Cliente INT,
    Data_Pedido DATE,
    Total DECIMAL (10,2),
    Status VARCHAR (20),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID)
);

--3
CREATE TABLE Produtos (
    ID INT PRIMARY KEY,
    Nome VARCHAR(255),
    Descrição TEXT,
    Preço DECIMAL(10, 2) CHECK (Preço >= 0)
);

--4
 CREATE TABLE Categorias (
    ID INT PRIMARY KEY,
    Nome VARCHAR(255)
);

--5
CREATE TABLE Pedidos_Produtos (
    ID_Pedido INT,
    ID_Produto INT,
    PRIMARY KEY (ID_Pedido, ID_Produto),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID),
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID)
);

--6
CREATE TABLE Produtos_Categorias (
    ID_Produto INT,
    ID_Categoria INT,
    PRIMARY KEY (ID_Produto, ID_Categoria),
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID),
    FOREIGN KEY (ID_Categoria) REFERENCES Categorias(ID)
);

--7
CREATE TABLE Empregados  ( -- Funcionarios
    ID INT PRIMARY KEY,
    Nome VARCHAR(50),
    Sobrenome VARCHAR(50),
    Cargo VARCHAR(50),
    CONSTRAINT valid_Cargo CHECK (Cargo IN ('Gerente', 'Vendedor', 'Atendente'))
);

--8
CREATE TABLE Vendas (
    ID INT PRIMARY KEY,
    ID_Produto INT,
    ID_Cliente INT,
    Data_Venda DATE,
    Quantidade INT,
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID)
);

SELECT * FROM Clientes;

--9
--1 
ALTER TABLE Clientes
ADD Telefone VARCHAR(20);

SELECT * FROM Produtos;

--2
ALTER TABLE Produtos
ALTER COLUMN Descrição DROP NOT NULL;

--3
ALTER TABLE Pedidos
ALTER COLUMN ID_Cliente TYPE INT;

--4
ALTER TABLE Empregados
RENAME TO Funcionarios;

SELECT * FROM Funcionarios;

-- 1° Parte Inserindo Valores

INSERT INTO Clientes (ID, Nome, Sobrenome, Email) VALUES
(1, 'Diogo', 'Play', 'Diogo@example.com'),
(2, 'Kayo', 'Santos', 'Kayo@example.com'),
(3, 'Gabriel', 'Ferreira', 'Gabriel@example.com'),
(4, 'Livia', 'Hati', 'Livia@example.com'),
(5, 'Lino', 'Del Rey', 'Lino@example.com');

UPDATE Clientes SET Telefone = '19-9812233' WHERE ID = 1;
UPDATE Clientes SET Telefone = '11-9812233' WHERE ID = 2;
UPDATE Clientes SET Telefone = '15-9812233' WHERE ID = 3;
UPDATE Clientes SET Telefone = '18-9812233' WHERE ID = 4;
UPDATE Clientes SET Telefone = '55-9812233' WHERE ID = 5;

SELECT * FROM Clientes;
SELECT * FROM Pedidos;


-- 2° Parte 
INSERT INTO Pedidos (ID, ID_Cliente, Data_Pedido, Total, Status) VALUES
(1, 1, '2024-04-01', 100.00, 'Em andamento'),
(2, 1, '2024-04-02', 50.00, 'Finalizado'),
(3, 2, '2024-04-03', 75.00, 'Cancelado'),
(4, 3, '2024-04-04', 200.00, 'Finalizado'),
(5, 2, '2024-04-05', 30.00, 'Cancelado'),
(6, 1, '2024-04-06', 95.00, 'Em andamento'),
(7, 1, '2024-04-07', 34.00, 'Finalizado'),
(8, 2, '2024-04-08', 56.00, 'Em andamento'),
(9, 3, '2024-04-09', 120.00, 'Em andamento'),
(10, 2, '2024-04-10', 450.00, 'Cancelado');


-- 3° Parte 
INSERT INTO Produtos (ID, Nome, Descrição, Preço) VALUES
(1, 'Produto 1', 'Comida', 50.00),
(2, 'Produto 2', 'Tinta', 75.00),
(3, 'Produto 3', 'Roupa', 100.00),
(4, 'Produto 4', 'Brinquedo', 25.00),
(5, 'Produto 5', 'Diesel', 1560.00),
(6, 'Produto 6', 'Gasolina', 530.00),
(7, 'Produto 7', 'Restaurante', 751.00),
(8, 'Produto 8', 'Carro', 1020.00),
(9, 'Produto 9', 'Agua', 225.00),
(10, 'Produto 10', 'Casa', 1450.00),
(11, 'Produto 11', 'Viagem', 560.00),
(12, 'Produto 12', 'Moto', 715.00),
(13, 'Produto 13', 'Alcool', 1030.00),
(14, 'Produto 14', 'Mercado', 235.00),
(15, 'Produto 15', 'Reforma', 1530.00);

SELECT * FROM Produtos;

-- 4° Parte 
INSERT INTO Pedidos_Produtos(ID_Pedido, ID_Produto)VALUES
('1','3'),
('2','1'),
('3','1');

--5 Parte
INSERT INTO Categorias (ID,nome)  VALUES
('1','Viagens'),
('2','Gastos'),
('3','Trabalho');

--6° Parte
INSERT INTO Funcionarios(ID, nome, Sobrenome,Cargo) VALUES
('1','Ygor','Gois','Gerente'),
('2','Fagner','Love','Atendente'),
('3','Douglas','Nailton','Vendedor'),
('4','João','Pedro','Atendente'),
('5','Maria','Buzollin','Vendedor');

SELECT * FROM Funcionarios;

--7° Parte
