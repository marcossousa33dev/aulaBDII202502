#CRIAR BANCO DE DADOS
CREATE DATABASE loja;

#APAGAR BANCO DE DADOS
DROP DATABASE loja; 

#SELECIONAR BANCO DE DADOS
USE loja;

#CRIAÇÃO DE TABELA
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    data_nascimento DATE,
    genero ENUM('Masculino', 'Feminino', 'Outro'),
    ativo BOOLEAN DEFAULT TRUE,
    CHECK (year(data_nascimento) < 2025)
);

CREATE TABLE clientes (
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    data_nascimento DATE NOT NULL,
    genero ENUM('Masculino', 'Feminino', 'Outro'),
    ativo BOOLEAN DEFAULT TRUE,
    criado_em DATETIME DEFAULT CURRENT_TIMESTAMP,
    CHECK (year(data_nascimento) < 2025),
    PRIMARY KEY (email, data_nascimento)
);

#APAGAR TABELA
DROP TABLE clientes;

#ZERA A TABELA
TRUNCATE TABLE clientes;

#ALTER TABLE adicionando campo
ALTER TABLE clientes
ADD telefone VARCHAR(20) DEFAULT 'Não informado';

#ALTER TABLE adicionando campo com posição
ALTER TABLE clientes 
ADD endereco varchar(90) NOT NULL AFTER nome;

#ALTER TABLE alterando o tipo de dado ou tamanho de um campo
ALTER TABLE clientes
MODIFY endereco VARCHAR(60);

#ALTER TABLE renomear um campo e modificar o tipo ou tamanho
ALTER TABLE clientes
CHANGE COLUMN data_nascimento datanasc date;

#ou 

ALTER TABLE clientes
CHANGE COLUMN data_nascimento datahoranasc datetime;

#RENOMEAR TABELA
ALTER TABLE clientes RENAME TO pessoas_fisicas;

#APAGAR UM CAMPO
ALTER TABLE clientes DROP COLUMN endereco;

#ADICIONAR UMA CHAVE PRIMÁRIA
ALTER TABLE clientes 
ADD PRIMARY KEY (cpf);

#APAGAR UMA CHAVE PRIMÁRIA
ALTER TABLE clientes
DROP PRIMARY KEY;

#CHAVE ESTRANGEIRA
#1º TABELA PAI
CREATE TABLE clientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

#2ª TABELA FILHA

CREATE TABLE pedidos (
    id INT PRIMARY KEY,
    cliente_id INT,
    data_pedido DATE,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

#MOSTRAR AS TABELAS DO BANCO DE DADOS
SHOW TABLES;

#MOSTRAR A ESTRUTURA DA TABELA
DESC clientes;

#EXEMPLIFICANDO OS COMANDOS DA DML
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone VARCHAR(20),
    cidade VARCHAR(50)
);

#INSERT
INSERT INTO clientes (nome, email, telefone, cidade)
VALUES ('Ana Silva', 'ana.silva@email.com', '(11) 91234-5678', 'São Paulo');

#OU COM MULTIPLOS REGISTROS
INSERT INTO clientes (nome, email, telefone, cidade)
VALUES 
('João Lima', 'joao.lima@email.com', '(11) 99876-5432', 'Campinas'),
('Maria Souza', 'maria.souza@email.com', '(11) 98765-4321', 'Santos');

#SELECT TODOS
SELECT * FROM clientes;

#SELECT NOME E CIDADE
SELECT nome, cidade FROM clientes;

#SELECT FILTRAR CLIENTES DE SÃO PAULO
SELECT * FROM clientes 
WHERE cidade = 'São Paulo';

#UPDATE
UPDATE clientes
SET telefone = '(11) 90000-0000'
WHERE id = 1;

#ou

UPDATE clientes
SET nome = 'Ana Paula Silva', email = 'ana.paula@email.com'
WHERE id = 2;
