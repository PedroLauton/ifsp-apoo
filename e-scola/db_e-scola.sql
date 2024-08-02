create database dbescola;
use dbescola;

create table tbestudante (
	matricula int primary key
    ,nome varchar(150)
    ,cpf char(14)
    ,rg varchar(20)
    ,email varchar(150)
    ,telefone varchar(20)
    ,endereco varchar(200)
    ,escola varchar(100)
);

create table tbprofessor (
	matricula int primary key
    ,especialidade varchar(100)
    ,nome varchar(150)
    ,cpf char(14)
    ,rg varchar(20)
    ,email varchar(150)
    ,telefone varchar(20)
    ,endereco varchar(200)
);

create table tbmateria (
	cod int primary key
    ,nome varchar(150)
    ,sigla char(4)
    ,foiDesativado tinyint(1)
    ,professor int
    ,foreign key (professor) references tbprofessor(cod)
);

create table tbguiaestudos (
	cod int primary key
    ,titulo varchar(150)
    ,dataInicio date
    ,dataFim date
    ,ramo varchar(150)
    ,materia int
    ,foreign key (materia) references tbmateria(cod)
);

create table tbMaterialComplementar (
	cod int primary key
    ,arquivo varchar(500)
    ,titulo varchar(150)
	,miniatura varchar(500)
    ,descricao varchar(300)
);

create table tbguiaestudos_materialcomplementar (
	cod int primary key
    ,guiaestudos int
    ,materialcomplementar int
    ,foreign key (guiaestudos) references tbguiaestudos(cod)
    ,foreign key (materialcomplementar) references tbmaterialcomplementar(cod)
);

create table tbArtefatoInteratividade (
	cod int primary key
    ,tipo varchar(150)
    ,titulo varchar(150)
    ,descricao varchar(300)
    ,opcoes text
    ,resposta int
    ,requisitos text
    ,entregaveis text
    ,materia int
    ,foreign key (materia) references tbmateria(cod)
);

create table tbChatSala (
	cod int primary key
    ,titulo varchar(150)
);

create table tbMensagem (
	cod int primary key
    ,texto text
    ,arquivo varchar(500)
    ,dataHora datetime
    ,chat int
    ,foreign key (chat) references tbchatsala(cod)
);

create table tbAtividade ( -- cronograma
	cod int primary key
    ,nome varchar(150)
    ,dataInicio datetime
    ,dataTermino datetime
);

create table tbEncontroSincrono (
	cod int primary key
    ,assunto varchar(150)
    ,descricao varchar(300)
    ,dataHorario datetime
    ,tags varchar(100)
    ,linkConteudo varchar(300)
    ,ramo varchar(150)
    ,recompensa varchar(150)
    ,atividade int
    ,foreign key (atividade) references tbAtividade(cod)
);

-- NOTIFICACAO

-- SALA VIRTUAL

-- N:N Estudante - Sala Virtual








