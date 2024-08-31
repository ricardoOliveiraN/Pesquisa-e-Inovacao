CREATE DATABASE sojaprotegida;
USE sojaprotegida;

CREATE TABLE cadastro (
	idcadastro int primary key auto_increment,
    usuario varchar(20) not null,
    email varchar(70) not null,
    senha varchar(40) not null
);

INSERT INTO cadastro VALUES
(default, 'joaosilva', 'joao.silva@email.com', '1234senhaJoao'),
(default, 'mariarosa', 'maria.rosa@email.com', 'maria@5678'),
(default, 'pedro123', 'pedro.almeida@email.com', 'pedro!senha2024');

SELECT * FROM cadastro;

SELECT * FROM cadastro ORDER BY usuario;

SELECT usuario FROM cadastro
WHERE usuario LIKE '%maria%';

CREATE TABLE fazenda (
	idfazenda int primary key auto_increment,
    nome varchar(40),
    cnpj varchar(20),
    status_cliente varchar(15),
    qtd_sensores int,
    hectares varchar(10), 
    dtInicio date,
    dtCancelamento date,
    gastoFuncida float,
    quant_contaminacao int,
    valor_prejuizo double,
    constraint chk_status CHECK (status_cliente IN ('Ativo', 'Inativo'))
);

INSERT INTO fazenda VALUES 
(default, 'Fazenda Bela Vista', '12.345.678/0001-99', 'Ativo', 5, 1500, '2020-10-21', null),
(default, 'AgroSantos', '98.765.432/0001-11', 'Inativo', 8, 3000, '2017-02-11', '2024-09-30'),
(default, 'Fazenda Esperança', '11.223.344/0001-55', 'Ativo', 10, 2500, '2022-11-10', null);

SELECT * FROM fazenda;

SELECT idfazenda, nome, cnpj, dtCancelamento FROM fazenda
WHERE status_cliente = 'Inativo';

SELECT * FROM fazenda
WHERE hectares > 10;

SELECT * FROM fazenda
WHERE qtd_sensores > 5 and status_cliente = 'Ativo';

CREATE TABLE sensor (
	idsensor int primary key auto_increment,
    umidade float,
    avisos varchar(40),
    dtAviso date,
    horario time
    constraint chk_avisos CHECK (avisos IN ('Umidade padrão', 'Umidade elevada', 'Umidade baixa'))
);

INSERT INTO sensor VALUES
(default, 55.3, 26.5, 'Umidade padrão'),
(default, 70.1, 22.4, 'Temperatura elevada'),
(default, 45.7, 18.9, 'Umidade baixa');

SELECT * FROM sensor;

SELECT * FROM sensor
WHERE avisos = 'Umidade baixa';

SELECT * FROM sensor
WHERE umidade > 40 and temperatura > 20;

CREATE TABLE responsavel_fazenda (
	idresponsavel int primary key auto_increment,
    nome varchar(40),
    cargo varchar(40),
    cpf varchar(20),
    dtNasc date,
    telefone varchar(20),
    email varchar(60)
);

INSERT INTO responsavel_fazenda VALUES
(default, 'João da Silva', 'Gerente', '123.456.789-00', '1980-02-15', '11987654321', 'joao.gerente@fazenda.com'),
(default, 'Maria Santos', 'Administradora', '987.654.321-00', '1975-09-25', '21976543210', 'maria.santos@agrosantos.com'),
(default, 'Pedro Almeida', 'Supervisor', '111.222.333-44', '1990-07-11', '31998765432', 'pedro.almeida@fazenda.com');

SELECT * FROM responsavel_fazenda;

DESC responsavel_fazenda;

SELECT telefone FROM responsavel_fazenda
WHERE nome LIKE 'pedro%';

SELECT email FROM responsavel_fazenda
WHERE nome LIKE 'joao%' and cargo = 'Gerente';

CREATE TABLE endereco_fazenda (
	idendereco int primary key auto_increment,
    logradouro varchar(50),
    numero int,
    complemento varchar(50),
    bairro varchar(50),
    cidade varchar(50),
    estado varchar(30),
    cep varchar(20),
    pais varchar(30)
);

INSERT INTO endereco_fazenda VALUE
(default, 'Estrada do Campo', 1234, 'Sítio A', 'Zona Rural', 'Uberlândia', 'MG', '38400-000', 'Brasil'),
(default, 'Avenida Principal', 567, 'Fazenda 3', 'Centro', 'Goiânia', 'GO', '74000-000', 'Brasil'),
(default, 'Rodovia 101', null, 'Km 45', 'Distrito Sul', 'Curitiba', 'PR', '80000-000', 'Brasil');

SELECT * FROM endereco_fazenda;

SELECT * FROM endereco_fazenda
WHERE cidade = 'Curitiba';

SELECT * FROM endereco_fazenda
WHERE estado = 'GO';

SELECT * FROM endereco_fazenda
WHERE estado = 'MG' or estado = 'PR';

SELECT logradouro, numero, complemento FROM endereco_fazenda
WHERE bairro LIKE 'centro';




