create database dbescola;
use dbescola;

create table tbestudante (
	matricula int primary key auto_increment
    ,nome varchar(150)
    ,cpf char(14)
    ,rg varchar(20)
    ,email varchar(150)
    ,telefone varchar(20)
    ,endereco varchar(200)
    ,escola varchar(100)
);

ALTER TABLE tbestudante AUTO_INCREMENT=100001;

create table tbprofessor (
	matricula int primary key auto_increment
    ,especialidade varchar(100)
    ,nome varchar(150)
    ,cpf char(14)
    ,rg varchar(20)
    ,email varchar(150)
    ,telefone varchar(20)
    ,endereco varchar(200)
);

ALTER TABLE tbprofessor AUTO_INCREMENT=10001;

create table tbmateria (
	cod int primary key auto_increment
    ,nome varchar(150)
    ,sigla char(4)
    ,desativado tinyint(1)
    ,professor int
    ,foreign key (professor) references tbprofessor(matricula)
);

create table tbguiaestudos (
	cod int primary key auto_increment
    ,titulo varchar(150)
    ,dataInicio date
    ,dataFim date
    ,ramo varchar(150)
    ,materia int
    ,foreign key (materia) references tbmateria(cod)
);

create table tbMaterialComplementar (
	cod int primary key auto_increment
    ,arquivo varchar(500)
    ,titulo varchar(150)
	,miniatura varchar(500)
    ,descricao varchar(300)
    ,guiaestudos int
    ,foreign key (guiaestudos) references tbguiaestudos(cod)
);

create table tbChatSala (
	cod int primary key auto_increment
    ,titulo varchar(150)
);

create table tbMensagem (
	cod int primary key auto_increment
    ,texto text
    ,arquivo varchar(500)
    ,dataHora datetime
    ,chat int
    ,foreign key (chat) references tbchatsala(cod)
);

create table tbSalaVirtual ( -- turma
	cod int primary key auto_increment
    ,nome varchar(150)
    ,descricao varchar(300)
    ,miniatura varchar(500)
    ,volumetriaEstudantes int
    ,materia int
    ,chat int
    ,foreign key (materia) references tbmateria(cod)
    ,foreign key (chat) references tbchatsala(cod)
);

create table tbestudantes_salavirtual (
	cod int primary key auto_increment
    ,estudante int
    ,salavirtual int
    ,foreign key (estudante) references tbestudante(matricula)
    ,foreign key (salavirtual) references tbSalaVirtual(cod)
);

create table tbArtefatoInteratividade (
	cod int primary key auto_increment
    ,tipo varchar(150)
    ,titulo varchar(150)
    ,descricao varchar(300)
    ,opcoes text
    ,resposta int
    ,requisitos text
    ,entregaveis text
);

create table tbAtividade ( -- cronograma
	cod int primary key auto_increment
    ,nome varchar(150)
    ,dataInicio datetime
    ,dataTermino datetime
    ,salavirtual int
    ,artefatointeratividade int
    ,foreign key (salavirtual) references tbSalaVirtual(cod)
    ,foreign key (artefatointeratividade) references tbArtefatoInteratividade(cod)
);

create table tbEncontroSincrono (
	cod int primary key auto_increment
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

create table tbNotificacao (
	cod int primary key auto_increment
    ,titulo varchar(150)
    ,descricao varchar(300)
    ,visualizado tinyint(1)
    ,atividade int
    ,foreign key (atividade) references tbAtividade(cod)
);

DELIMITER //
CREATE PROCEDURE inserirArtefatoInteratividade(
	p_tipo varchar(150), p_titulo varchar(150), p_descricao varchar(300), p_opcoes text, p_resposta int, p_requisitos text, p_entregaveis text
)
BEGIN
	INSERT INTO tbArtefatoInteratividade(
		`tipo`,
		`titulo`,
		`descricao`,
		`opcoes`,
		`resposta`,
        `requisitos`,
        `entregaveis`
	) VALUES (p_tipo, p_titulo, p_descricao, p_opcoes, p_resposta, p_requisitos, p_entregaveis);
    SELECT LAST_INSERT_ID() as 'Id';
END;
//

call inserirArtefatoInteratividade('Pergunta','Descobrimento do Brasil','Quem descobriu o Brasil?','{1: "Maria Antonieta", 2: "Pero Vaz", 3: "Caio Castro", 4: "Pedro Álvares", 5: "Povos Indígenas"}',5,null, null);
call inserirArtefatoInteratividade('Enquete','Termometro','O que você está achando das aulas online?','{1: "Amo", 2: "Gosto", 3: "Tolero", 4: "Não gosto", 5: "Eu O D E I O"}', null, null, null);
call inserirArtefatoInteratividade('Desafio','Super Desafio','Para completar o desafio você deve assistir todas as aulas!!',null,null,'{1: "Assistir 10 aulas"}',null);
call inserirArtefatoInteratividade('Atividade Colaborativa','Fotosintese em Dupla','Você e um colega devem fazer fotosintese juntos por 15 minutos #Partiu Meditação',null,null,'{1: "Fazer fontosintese com um colega por 15 minutos"}','{1: "Registro fotografico da dupla"}');

DELIMITER //
CREATE PROCEDURE agendarArtefatoInteratividade(
	p_codArtefato int, p_nome varchar(150), p_dataInicio datetime, p_dataTermino datetime, p_codSalaVirtual int
)
BEGIN
	INSERT INTO tbAtividade(
		`nome`,
		`dataInicio`,
		`dataTermino`,
		`salavirtual`,
		`artefatointeratividade`
	) VALUES (p_nome, p_dataInicio, p_dataTermino, p_codSalaVirtual, p_codArtefato);
    SELECT LAST_INSERT_ID() as 'Id';
END;
//

DELIMITER //
CREATE PROCEDURE buscarArtefatoInteratividade(
	p_codArtefatoInteratividade int
)
BEGIN
	SELECT * FROM tbArtefatoInteratividade WHERE `cod` = p_codArtefatoInteratividade;
END;
//

DELIMITER //
CREATE PROCEDURE atualizarArtefatoInteratividade(
	p_codArtefatoInteratividade int, p_tipo varchar(150), p_titulo varchar(150), p_descricao varchar(300), p_opcoes text, p_resposta int, p_requisitos text, p_entregaveis text
)
BEGIN
	UPDATE tbArtefatoInteratividade SET
		`tipo` = p_tipo,
		`titulo` = p_titulo,
		`descricao` = p_descricao,
		`opcoes` = p_opcoes,
		`resposta` = p_resposta,
        `requisitos` = p_requisitos,
        `entregaveis` = p_entregaveis
	WHERE `cod` = p_codArtefatoInteratividade;
END;
//

DELIMITER //
CREATE PROCEDURE deletarArtefatoInteratividade(
	p_codArtefatoInteratividade int
)
BEGIN
	DELETE FROM tbNotificacao
    WHERE `atividade` IN (SELECT `cod` FROM tbAtividade WHERE `artefatointeratividade` = p_codArtefatoInteratividade);
    DELETE FROM tbEncontroSincrono
    WHERE `atividade` IN (SELECT `cod` FROM tbAtividade WHERE `artefatointeratividade` = p_codArtefatoInteratividade);
	DELETE FROM tbAtividade
	WHERE `artefatointeratividade` = p_codArtefatoInteratividade;
    DELETE FROM tbArtefatoInteratividade
    WHERE `cod` = p_codArtefatoInteratividade;
END;
//
