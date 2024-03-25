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