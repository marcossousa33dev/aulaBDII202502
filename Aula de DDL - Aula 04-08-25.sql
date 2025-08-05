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
