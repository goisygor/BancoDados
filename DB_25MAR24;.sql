CREATE DATABASE DB_25MAR24;

--comando para criar a tabela
CREATE TABLE Fornecedor(
    Fcodigo INT NOT NULL,
    Fnome VARCHAR(30) NOT NULL,
    Status INT,
    Cidade VARCHAR(30)
);

-- selecionar dados da tabela
SELECT * FROM Fornecedor;

-- CRIA A TABELA SE ELA NÃO EXISTIR 
--E SE ELA EXISTIR NÃO ACONTECE NADA INCLUSIVE ERRO
CREATE TABLE IF NOT EXISTS Fornecedor(
    Fcodigo INT NOT NULL,
    Fnome VARCHAR(30) NOT NULL,
    Status INT,
    Cidade VARCHAR(30)
);

-- CRIA A TABELA SE ELA NÃO EXISTIR 
--E SE ELA EXISTIR NÃO ACONTECE NADA INCLUSIVE ERRO
CREATE TABLE IF NOT EXISTS Departamento(
    Dcodigo INT NOT NULL,
    Dnome VARCHAR(30) NOT NULL,
    Cidade VARCHAR(30),
    PRIMARY KEY (Dcodigo)
);
-- selecionar dados da tabela
SELECT * FROM Departamento;


CREATE TABLE IF NOT EXISTS Empregado(
    Ecodigo INT NOT NULL,
    Enome VARCHAR(40) NOT NULL,
    CPF VARCHAR(15) NOT NULL,
    Salario DECIMAL(7,2),
    Dcodigo INT NOT NULL,
    PRIMARY KEY (Ecodigo, Enome)
);
SELECT * FROM Empregado;

--apagando a tabela empregado
DROP TABLE Empregado;



-- criação da tabela com FOREIGN KEY    
CREATE TABLE IF NOT EXISTS Empregado(
    Ecodigo INT NOT NULL,
    Enome VARCHAR(40) NOT NULL,
    CPF VARCHAR(15) NOT NULL,
    Salario DECIMAL(7,2),
    Dcodigo INT NOT NULL,
    PRIMARY KEY (Ecodigo, Enome),
    FOREIGN KEY (Dcodigo) REFERENCES Departamento
);

-- Alterar Tabelas com o ALTER TABLE

--Add colunar (add)
ALTER TABLE Empregado DROP sexo CHAR(1);

--Drop Coluna (remover)
ALTER TABLE Empregado DROP sexo;

--Renomear tabela
ALTER TABLE Funcionario RENAME TO Empregado;

-- ALTER TABLE tabela ALTER COLUMN campo nome tipo_dado;
ALTER TABLE Fornecedor ALTER COLUMN status TYPE ativo TYPE BOOLEAN;

-- Exercicios
