CREATE DATABASE EXERCICIO1;

CREATE TABLE Fornecedor(
    Fcodigo INT NOT NULL PRIMARY KEY,
    Fnome VARCHAR(50) NOT NULL,
    Status INT,
    Cidade VARCHAR(50)
);

DROP TABLE fornecedor;
SELECT * FROM Fornecedor;

CREATE TABLE Peca(
    Pcodigo INT NOT NULL PRIMARY KEY,
    Pnome VARCHAR (50) NOT NULL,
    Cor VARCHAR (30) NOT NULL,
    Peso FLOAT NOT NULL,
    Cidade VARCHAR (50) NOT NULL
);

DROP TABLE Peca;
SELECT * FROM Peca;

CREATE TABLE Instituicao(
    Icodigo INT PRIMARY KEY,
    nome VARCHAR (50)
);

DROP TABLE Instituicao;
SELECT * FROM Instituicao;

CREATE TABLE Projeto(
    PRcod INT NOT NULL PRIMARY KEY,
    PRnome VARCHAR(50),
    Icodigo INT,
    Cidade VARCHAR(50),
    FOREIGN KEY (Icodigo) REFERENCES Instituicao
);

DROP TABLE Projeto;
SELECT * FROM Projeto;

CREATE TABLE Fornecimento (
    Fcodigo INT NOT NULL,
    FOREIGN KEY (Fcodigo) REFERENCES Fornecedor,
    Pcodigo INT NOT NULL,
    FOREIGN KEY (Pcodigo) REFERENCES Peca,
    PRcod INT NOT NULL,
    FOREIGN KEY (PRcod) REFERENCES Projeto,
    Quantidade INT NOT NULL
);

SELECT * FROM Fornecimento; 