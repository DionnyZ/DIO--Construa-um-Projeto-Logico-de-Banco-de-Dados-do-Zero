create database oficinaMecanica;
use oficinaMecanica;

-- Criar tabela Pessoa
create table pessoa(
	idPessoa int auto_increment primary key,
    nome varchar(100) not null,
    cpf varchar(15) not null,
    contato varchar(20) not null,
    endereco varchar(100) not null
);

-- Criar tabela Cliente
create table cliente(
	idCliente int auto_increment primary key,
    idPessoa int,
    constraint fk_cliente_pessoa foreign key (idPessoa) references pessoa(idPessoa)
);

-- Criar tabela Mecânico
create table mecanico(
	idMecanico int auto_increment primary key,
    idPessoa int,
    constraint fk_cliente_mecanico foreign key (idPessoa) references pessoa(idPessoa)
);

-- Criar tabela Especialidade
create table especialidade(
	idEspecialidade int auto_increment primary key,
    descricao varchar(50)
);

-- Criar tabela Especialidades do Mecânico
create table especialidadesMecanico(
	idEM int auto_increment primary key,
    idMecanico int,
    idEspecialidade int,
    constraint fk_EM_mecanico foreign key (idMecanico) references mecanico(idMecanico),
    constraint fk_EM_especialidade foreign key (idEspecialidade) references especialidade(idEspecialidade)
);

-- Criar tabela Equipe
create table equipe(
	idEquipe int auto_increment primary key
);

-- Criar tabela Membros da Equipe
create table membrosEquipe(
	idEquipe int,
    idMecanico int,
    primary key (idEquipe, idMecanico)
);

-- Criar tabela Veículo
create table veiculo(
	idVeiculo int auto_increment primary key,
    idCliente int,
    placa varchar(10) not null,
    modelo varchar(20),
    constraint fk_veiculo_cliente foreign key (idCliente) references cliente(idCliente)
);

-- Criar tabela Consulta
create table consulta(
	idConsulta int auto_increment primary key,
    idVeiculo int,
    idEquipe int,
    constraint fk_consulta_veiculo foreign key (idVeiculo) references veiculo(idVeiculo),
    constraint fk_equipe_veiculo foreign key (idEquipe) references equipe(idEquipe)
);

-- Criar tabela Ordem de Serviço
create table ordemServico(
	idOrdemServico int auto_increment primary key,
    idConsulta int,
    statusServico varchar(20),
    dataEmissao date not null,
    dataEntrega date,
    constraint fk_ordemServico_consulta foreign key (idConsulta) references consulta(idConsulta)
);

-- Criar tabela Serviço
create table servico(
	idServico int auto_increment primary key,
    descricao varchar(255),
    valor decimal
);

-- Criar tabela Serviços da OS
create table servicosOS(
	idServico int,
    idOrdemServico int,
    primary key (idServico, idOrdemServico)
);

-- Criar tabela Peça
create table peca(
	idPeca int auto_increment primary key,
    descricao varchar(255),
    quantidade int,
    valor decimal
);

-- Criar tabela Peças da OS
create table pecasOS(
	idPeca int,
    idOrdemServico int,
    quantidade int,
    primary key (idPeca, idOrdemServico)
);