CREATE SCHEMA trab_schema;
set search_path=trab_schema;

CREATE TABLE pessoa (
    	cpf 		varchar(11) PRIMARY KEY NOT NULL,
    	rg 		varchar(9),
	nome 		varchar(255),
	data_nasc 	date,
	rua		varchar(255),
	numero 		int
);

CREATE TABLE tel_pessoa (
	cpf_pessoa varchar(11) PRIMARY KEY,
	CONSTRAINT fk_telpessoa FOREIGN KEY(cpf_pessoa) REFERENCES pessoa(cpf),
	telefone	varchar(15)
);

CREATE TABLE paciente (
	cpf_paciente 	varchar(11) PRIMARY KEY,
	CONSTRAINT fk_cpfpaciente FOREIGN KEY(cpf_paciente) REFERENCES pessoa(cpf),
	nomeResponsavel	varchar(255)
	
);

CREATE TABLE cliente (
	cpf_cliente 	varchar(11) PRIMARY KEY,
	CONSTRAINT fk_cpfcliente FOREIGN KEY(cpf_cliente) REFERENCES pessoa(cpf)
	
);

CREATE TABLE funcionario (
	codFunc		integer PRIMARY KEY,
	nomeFunc	varchar(255),
	salario		float,
	codSup 		integer,
	CONSTRAINT fk_codsup FOREIGN KEY(codSup) REFERENCES funcionario(codFunc)
);


CREATE TABLE servico(
	codServico		integer PRIMARY KEY,
	nomeServico 	varchar(255),
	tipoServico		varchar(255),
	cpf_paciente 	varchar(11),
	CONSTRAINT fk_cpfpac FOREIGN KEY(cpf_paciente) REFERENCES pessoa(cpf),
	codFunc 		integer,
	CONSTRAINT fk_codfunc FOREIGN KEY(codFunc) REFERENCES funcionario(codFunc)
	
);

CREATE TABLE venda(
	codVenda			integer	PRIMARY KEY,
	codSecretario 		integer,
	CONSTRAINT fk_codsecretario FOREIGN KEY(codSecretario) REFERENCES funcionario(codFunc),
	valor				float,
	tipo				varchar(255),
	dataVenda			date

);


CREATE TABLE pagamento(
	codPagamento		integer	PRIMARY KEY,
	cpf_cliente 		varchar(11),
	CONSTRAINT fk_cpfcliente FOREIGN KEY(cpf_cliente) REFERENCES pessoa(cpf),
	metodoPagamento		varchar(255),
	valor				float

);

CREATE TABLE procedimentos(
	cod_servico			integer,
	CONSTRAINT fk_codservico FOREIGN KEY(cod_servico) REFERENCES servico(codServico),
	cpf_paciente 		varchar(11),
	CONSTRAINT fk_cpfpacient FOREIGN KEY(cpf_paciente) REFERENCES pessoa(cpf),
	dataProcedimento	date		

);

CREATE TABLE tel_funcionario(
	cod_func 		integer,
	CONSTRAINT fk_telfunc FOREIGN KEY(cod_func) REFERENCES funcionario(codFunc),
	telefone_func	varchar(15)
	
);


CREATE TABLE func_secretario(
	cod_secretario		integer PRIMARY KEY,
	CONSTRAINT fk_codsecreatio FOREIGN KEY(cod_secretario) REFERENCES funcionario(codFunc),
	horasExtras				float
);

CREATE TABLE func_enfermeiro(
	cod_enfermeiro		integer PRIMARY KEY,
	CONSTRAINT fk_codenf FOREIGN KEY(cod_enfermeiro) REFERENCES funcionario(codFunc),
	numCOREN			integer

);