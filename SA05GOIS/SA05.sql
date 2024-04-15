CREATE DATABASE SA05_YGORG0IS;

CREATE TABLE Clientes (
    ID INT PRIMARY KEY,
    Nome VARCHAR(60),
    Sobrenome VARCHAR(30),
    Email VARCHAR(100) UNIQUE
);

CREATE TABLE Pedidos (
    ID INT PRIMARY KEY,
    ID_Cliente INT,
    Data_Pedido DATE,
    Total DECIMAL (10,2),
    Status VARCHAR (20),
    FOREIGN KEY (ID_Cliente) REFERENCES Clientes(ID)
);

CREATE TABLE Produtos (
    ID INT PRIMARY KEY,
    Nome VARCHAR(255),
    Descrição TEXT,
    Preço DECIMAL(10, 2) CHECK (Preço >= 0)
);

 CREATE TABLE Categorias (
    ID INT PRIMARY KEY,
    Nome VARCHAR(255)
);
CREATE TABLE Pedidos_Produtos (
    ID_Pedido INT,
    ID_Produto INT,
    PRIMARY KEY (ID_Pedido, ID_Produto),
    FOREIGN KEY (ID_Pedido) REFERENCES Pedidos(ID),
    FOREIGN KEY (ID_Produto) REFERENCES Produtos(ID)
);