use master
go
if exists (select * from sys.databases where name = 'LMS')
drop database LMS
go

CREATE DATABASE LMS
go

USE LMS
GO

CREATE TABLE Coordenador
( 
	ID tinyint identity(1,1) not null
	, Login varchar(255) not null 
	, Senha varchar(255) not null 
	, Nome varchar(255) not null 
	, Email varchar(50) not null 
	, Celular char(50) not null 
	, DtExpiracao date not null DEFAULT '19000101'
	, constraint pk_Coordenador PRIMARY KEY (ID)
	, constraint uq_CoordenadorLogin UNIQUE (Login)
	, constraint uq_CoordenadorEmail UNIQUE (Email)
	, constraint uq_CoordenadorCelular UNIQUE (Celular)
);
go

CREATE TABLE Aluno
( 
	ID tinyint identity(1,1) not null
	, Login varchar(255) not null 
	, Senha varchar(255) not null 
	, Nome varchar(50) not null 
	, Email varchar(255) not null 
	, Celular char(50) not null 
	, DtExpiracao date not null DEFAULT '19000101'
	, RA varchar(7) not null
	, Foto varchar(255) null
	, constraint pk_Aluno PRIMARY KEY (ID)
	, constraint uq_AlunoLogin UNIQUE (Login)
	, constraint uq_AlunoEmail UNIQUE (Email)
	, constraint uq_AlunoCelular UNIQUE (Celular)
);
go

CREATE TABLE Professor
( 
	ID tinyint identity(1,1)
	, Login varchar(255) not null 
	, Senha varchar(255) not null 
	, Nome varchar(255) not null 
	, Email varchar(50) not null 
	, Celular char(50) not null 
	, DtExpiracao date not null DEFAULT '19000101'
	, Apelido varchar(255) not null
	, constraint pk_Professor PRIMARY KEY (ID)
	, constraint uq_ProfessorLogin UNIQUE (Login)
	, constraint uq_ProfessorEmail UNIQUE (Email)
	, constraint uq_ProfessorCelular UNIQUE (Celular)
);
go

create table Disciplina(
	ID tinyint identity(1,1) not null,
	Nome varchar(255) not null,
	Data datetime not null DEFAULT (getdate()),
	Status varchar(255) not null DEFAULT 'Aberta',
	PlanoDeEnsino varchar(255),
	CargaHoraria tinyint not null,
	Competencias varchar(255) not null,
	Habilidades varchar(255) not null,
	Ementa varchar(255) not null,
	ConteudoProgramatico varchar(255) not null,
	BibliografiaBasica varchar(255) not null,
	BibliografiaComplementar varchar(255) not null,
	PercentualPratico tinyint not null,
	PercentualTeorico tinyint not null,
	IdCoordenador tinyint not null,
	CONSTRAINT pk_Disciplina PRIMARY KEY (ID),
	CONSTRAINT uq_DisciplinaNome UNIQUE (Nome),
	--CONSTRAINT uq_DisciplinaStatus UNIQUE (Status),
	CONSTRAINT ck_DisciplinaStatus CHECK (Status IN ('Aberta','Fechada')),
	CONSTRAINT ck_DisciplinaCargaHoraria CHECK (CargaHoraria IN (40,80)),
	CONSTRAINT ck_DisciplinaPercentualPratico CHECK (PercentualPratico BETWEEN 0 and 100),
	CONSTRAINT ck_DisciplinaPercentualTeorico CHECK (PercentualTeorico BETWEEN 0 and 100),
	CONSTRAINT fk_DisciplinaCoordenador FOREIGN KEY (IdCoordenador) REFERENCES Coordenador(ID)
);
go

create table Curso(
	ID tinyint identity(1,1) not null,
	Nome varchar(50) not null
	CONSTRAINT pk_Curso PRIMARY KEY(ID),
	CONSTRAINT uq_CursoNome UNIQUE(Nome),
);
go

create table DisciplinaOfertada(
	ID tinyint identity (1,1) not null,
	IdCoordenador tinyint not null,
	DtInicioMatricula date null,
	DtFimMatricula date null,
	IdDisciplina tinyint not null,
	IdCurso tinyint not null,
	Ano smallint not null,
	Semestre tinyint not null,
	Turma char(10) not null,
	IdProfessor tinyint null,
	Metodologia varchar (255) null,
	Recursos varchar(255) null,
	CriterioAvaliacao varchar(255) null,
	PlanoDeAulas varchar(255) null
	CONSTRAINT pk_DisciplinaOfertada primary key (ID),
	CONSTRAINT fk_DisciplinaOfertadaCoordenador FOREIGN KEY(IdCoordenador) REFERENCES Coordenador(ID),
	CONSTRAINT fk_DisciplinaOfertadaDisciplina FOREIGN KEY (IdDisciplina) REFERENCES Disciplina (ID),
	CONSTRAINT fk_DisciplinaOfertadaCurso FOREIGN KEY(IdCurso) REFERENCES Curso (ID),
	CONSTRAINT ck_DisciplinaOfertadaAno CHECK(Ano BETWEEN 1900 and 2100),
	CONSTRAINT ck_DisciplinaOfertadaSemestre CHECK(Semestre in(1,2)),
	CONSTRAINT ck_DisciplinaOfertadaTurma CHECK(Turma LIKE '[A-Z]'),
	CONSTRAINT uq_DisciplinaOfertadaCursoAnoSemestreTurma UNIQUE (IdCurso, Ano, Semestre, Turma)
);
go

Create Table SolicitacaoMatricula(
    ID tinyint identity(1,1) Not Null ,
    IdAluno tinyint Not Null,
    IdDisciplinaOfertada tinyint not null,
	DtSolicitacao date not null DEFAULT getdate(),
	IdCoordenador tinyint null,
	Status char(11) null DEFAULT 'Solicitada',
	CONSTRAINT pk_SolicitacaoMatricula PRIMARY KEY(ID),
	CONSTRAINT fk_SolicitacaoMatriculaCoordenador FOREIGN KEY (IdCoordenador) REFERENCES Coordenador(ID),
	CONSTRAINT ck_SolicitacaoMatriculaStatus CHECK (Status in ('Solicitada','Aprovada','Rejeitada','Cancelada'))
);
go

create table  Atividade (
	ID tinyint identity(1,1)  not null,
	Titulo varchar(255) not null,
	Descricao varchar(255) null,
	Conteudo varchar(255) not null,
	Tipo varchar(255) not null,
	Extras varchar(255) null,
	IdProfessor tinyint not null,
	CONSTRAINT pk_Atividade PRIMARY KEY (ID),
	CONSTRAINT uq_AtividadeTitulo UNIQUE (Titulo),
	CONSTRAINT ck_AtividadeTipo CHECK (Tipo in ('Aberta','Teste')),
	CONSTRAINT fk_AtividadeProfessor FOREIGN KEY (IdProfessor) REFERENCES Professor(ID)
);
go

create table AtividadeVinculada (
	ID tinyint identity(1,1) not null,
	IdAtividade tinyint not null,
	IdProfessor tinyint not null,
	IdDisciplinaOfertada tinyint not null,
	Rotulo varchar (255) not null,
	Status varchar (255)not null,
	DtInicioRespostas date not null,
	DtFimRespostas  date not null,
	CONSTRAINT pk_AtividadeVinculada primary key (ID),
	CONSTRAINT fk_AtividadeVinculadaProfessor foreign key (IdProfessor) references Professor (ID),
	CONSTRAINT fk_AtividadeVinculadaIdDisciplinaOfertada  foreign key (IdDisciplinaOfertada) references Disciplina (ID),
	CONSTRAINT ck_AtividadeVinculadaStatus check (Status in ('Disponibilizada','Aberta','Fechada','Encerrada','Prorrogada')),
	CONSTRAINT uq_AtivRotDiscOf UNIQUE (Rotulo,IdAtividade,IdDisciplinaOfertada)
);
go

CREATE TABLE Entrega
(
	ID int identity(1,1) not null,
	IdAluno tinyint NOT NULL,
	IdAtividadeVinculada tinyint NOT NULL,
	Titulo varchar(255) NOT NULL,
	Resposta varchar(255) NOT NULL,
	DtEntrega date NOT NULL DEFAULT getdate(),
	Status varchar(10) NOT NULL DEFAULT 'Entregue',
	IdProfessor tinyint NULL,
	Nota decimal(4,2) NULL,
	DtAvaliacao date NULL,
	Obs varchar(255) NULL,
	CONSTRAINT pk_Entrega PRIMARY KEY (ID),
	CONSTRAINT fk_EntregaAluno FOREIGN KEY (IdAluno) REFERENCES Aluno(ID),
	CONSTRAINT fk_EntregaAtividadeVinculada FOREIGN KEY (IdAtividadeVinculada) REFERENCES AtividadeVinculada(ID),
	CONSTRAINT ck_EntregaStatus CHECK(Status LIKE 'Corrigido' or Status LIKE 'Entregue'),
	CONSTRAINT fk_EntregaProfessor FOREIGN KEY (IdProfessor) REFERENCES Professor(ID),
	CONSTRAINT ck_EntregaNota CHECK(Nota BETWEEN 0.00 and 10.00),
	CONSTRAINT uq_EntregaAlunoAtividadeVinculada UNIQUE (IdAluno,IdAtividadeVinculada)
);
go

CREATE TABLE Mensagem(
	ID tinyint identity(1,1) NOT NULL,
	IdAluno tinyint NOT NULL,
	IdProfessor tinyint NOT NULL,
	Assunto varchar(255) not null,
	Referencia varchar(255) not null,
	Conteudo varchar(255) not null,
	Status char(50) not null DEFAULT 'Enviado',
	DtEnvio date not null DEFAULT GETDATE(),
	DtResposta date null,
	Resposta varchar(255) null,
	CONSTRAINT pk_Mensagem PRIMARY KEY (ID),
	CONSTRAINT fk_MensagemAluno FOREIGN KEY (IdAluno) REFERENCES Aluno(ID),
	CONSTRAINT fk_MensagemProfessor FOREIGN KEY (IdProfessor) REFERENCES Professor(ID),
	CONSTRAINT ck_MensagemStatus CHECK (Status IN ('Enviado','Lido','Respondido'))
);
go

select * from professor;
