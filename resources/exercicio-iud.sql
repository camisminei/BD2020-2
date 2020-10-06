-- 1. Insira todos os dados no banco de dados empresa (conforme definido no estudo de caso)

-- 2. Remova os dependentes do funcionário cujo cpf é '333445555'.

-- 3. Altere o nome do departamento 'Pesquisa' para 'Pesquisa científica'.

CREATE TABLE departamento (
    dnome character varying(255) NOT NULL,
    dnumero integer NOT NULL,
    cpf_gerente varchar(11),
    data_inicio_gerente date
);

CREATE TABLE funcionario (
    pnome character varying(255) NOT NULL,
    minicial character(1),
    unome character varying(255) NOT NULL,
    cpf varchar(11) NOT NULL,
    datanasc date,
    endereco character varying(255),
    sexo character(2),
    salario numeric NOT NULL,
    cpf_supervisor varchar(11),
    dnr integer,
    CONSTRAINT funcionario_sexo_check CHECK ((sexo = ANY (ARRAY['F'::bpchar, 'M'::bpchar])))
);

