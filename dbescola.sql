-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15/08/2024 às 18:12
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbescola`
--

DELIMITER $$
--
-- Procedimentos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `agendarArtefatoInteratividade` (`p_codArtefato` INT, `p_nome` VARCHAR(150), `p_dataInicio` DATETIME, `p_dataTermino` DATETIME, `p_codSalaVirtual` INT)   BEGIN
	INSERT INTO tbAtividade(
		`nome`,
		`dataInicio`,
		`dataTermino`,
		`salavirtual`,
		`artefatointeratividade`
	) VALUES (p_nome, p_dataInicio, p_dataTermino, p_codSalaVirtual, p_codArtefato);
    SELECT LAST_INSERT_ID() as 'Id';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `atualizarArtefatoInteratividade` (`p_codArtefatoInteratividade` INT, `p_tipo` VARCHAR(150), `p_titulo` VARCHAR(150), `p_descricao` VARCHAR(300), `p_opcoes` TEXT, `p_resposta` INT, `p_requisitos` TEXT, `p_entregaveis` TEXT)   BEGIN
	UPDATE tbArtefatoInteratividade SET
		`tipo` = p_tipo,
		`titulo` = p_titulo,
		`descricao` = p_descricao,
		`opcoes` = p_opcoes,
		`resposta` = p_resposta,
        `requisitos` = p_requisitos,
        `entregaveis` = p_entregaveis
	WHERE `cod` = p_codArtefatoInteratividade;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `buscarArtefatoInteratividade` (`p_codArtefatoInteratividade` INT)   BEGIN
	SELECT * FROM tbArtefatoInteratividade WHERE `cod` = p_codArtefatoInteratividade;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deletarArtefatoInteratividade` (`p_codArtefatoInteratividade` INT)   BEGIN
	DELETE FROM tbNotificacao
    WHERE `atividade` IN (SELECT `cod` FROM tbAtividade WHERE `artefatointeratividade` = p_codArtefatoInteratividade);
    DELETE FROM tbEncontroSincrono
    WHERE `atividade` IN (SELECT `cod` FROM tbAtividade WHERE `artefatointeratividade` = p_codArtefatoInteratividade);
	DELETE FROM tbAtividade
	WHERE `artefatointeratividade` = p_codArtefatoInteratividade;
    DELETE FROM tbArtefatoInteratividade
    WHERE `cod` = p_codArtefatoInteratividade;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `inserirArtefatoInteratividade` (IN `p_tipo` VARCHAR(150), IN `p_titulo` VARCHAR(150), IN `p_descricao` VARCHAR(300), IN `p_opcoes` TEXT, IN `p_resposta` TEXT, IN `p_requisitos` TEXT, IN `p_entregaveis` TEXT)   BEGIN
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
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `listarTodosArtefatosInteratividade` ()   BEGIN
	SELECT * FROM tbArtefatoInteratividade;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbartefatointeratividade`
--

CREATE TABLE `tbartefatointeratividade` (
  `cod` int(11) NOT NULL,
  `tipo` varchar(150) DEFAULT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `descricao` varchar(300) DEFAULT NULL,
  `opcoes` text DEFAULT NULL,
  `resposta` text DEFAULT NULL,
  `requisitos` text DEFAULT NULL,
  `entregaveis` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbartefatointeratividade`
--

INSERT INTO `tbartefatointeratividade` (`cod`, `tipo`, `titulo`, `descricao`, `opcoes`, `resposta`, `requisitos`, `entregaveis`) VALUES
(1, 'Pergunta', 'Qual ano ocorreu o descobrimento do Brasil?', 'Responda corretamente em que ano ocorreu o descobrimento do Brasil.', 'A)1600,B)500,C)1550,D)1500', '1500', NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbatividade`
--

CREATE TABLE `tbatividade` (
  `cod` int(11) NOT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `dataInicio` datetime DEFAULT NULL,
  `dataTermino` datetime DEFAULT NULL,
  `salavirtual` int(11) DEFAULT NULL,
  `artefatointeratividade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbatividade`
--

INSERT INTO `tbatividade` (`cod`, `nome`, `dataInicio`, `dataTermino`, `salavirtual`, `artefatointeratividade`) VALUES
(1, 'Atividade 1', '2024-08-16 13:06:35', '2024-08-16 13:06:35', 19, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbchatsala`
--

CREATE TABLE `tbchatsala` (
  `cod` int(11) NOT NULL,
  `titulo` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbchatsala`
--

INSERT INTO `tbchatsala` (`cod`, `titulo`) VALUES
(19, 'Chat de Sala de História'),
(20, 'Chat de Matemática');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbencontrosincrono`
--

CREATE TABLE `tbencontrosincrono` (
  `cod` int(11) NOT NULL,
  `assunto` varchar(150) DEFAULT NULL,
  `descricao` varchar(300) DEFAULT NULL,
  `dataHorario` datetime DEFAULT NULL,
  `tags` varchar(100) DEFAULT NULL,
  `linkConteudo` varchar(300) DEFAULT NULL,
  `ramo` varchar(150) DEFAULT NULL,
  `recompensa` varchar(150) DEFAULT NULL,
  `atividade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbestudante`
--

CREATE TABLE `tbestudante` (
  `matricula` int(11) NOT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `cpf` char(14) DEFAULT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `escola` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbestudante`
--

INSERT INTO `tbestudante` (`matricula`, `nome`, `cpf`, `rg`, `email`, `telefone`, `endereco`, `escola`) VALUES
(1, 'Caio Dib', '324234234234', '5746375841', 'dib@gmail.com', '11957364837', 'Rua ND, 23', 'IFSP'),
(2, 'Pedro Henrique', '4743845771', '5746375841', 'pedro@gmail.com', '11957364837', 'Rua Alguma, 36', 'IFSP'),
(3, 'Gabriela Santana', '4743845771', '5746375841', 'gabi@gmail.com', '11957364837', 'Rua Luan, 899', 'IFSP'),
(4, 'Gabriel Barboza', '423423423423', '5746375841', 'gabriel@gmail.com', '11957364837', 'Rua do IF, 3501', 'IFSP');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbestudantes_salavirtual`
--

CREATE TABLE `tbestudantes_salavirtual` (
  `cod` int(11) NOT NULL,
  `estudante` int(11) DEFAULT NULL,
  `salavirtual` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbestudantes_salavirtual`
--

INSERT INTO `tbestudantes_salavirtual` (`cod`, `estudante`, `salavirtual`) VALUES
(20, 1, 19),
(21, 1, 20),
(22, 2, 20),
(23, 3, 20),
(24, 4, 20);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbguiaestudos`
--

CREATE TABLE `tbguiaestudos` (
  `cod` int(11) NOT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `dataInicio` date DEFAULT NULL,
  `dataFim` date DEFAULT NULL,
  `ramo` varchar(150) DEFAULT NULL,
  `materia` int(11) DEFAULT NULL,
  `miniatura` text DEFAULT NULL,
  `link` text NOT NULL,
  `resumo` text NOT NULL,
  `arquivo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbguiaestudos`
--

INSERT INTO `tbguiaestudos` (`cod`, `titulo`, `dataInicio`, `dataFim`, `ramo`, `materia`, `miniatura`, `link`, `resumo`, `arquivo`) VALUES
(1, 'Descobrimento do Brasil', '2024-08-22', '2024-08-15', 'História', 1, '/img/historia1.jpg', '', 'O descobrimento do Brasil refere-se ao momento em que o território brasileiro foi avistado pelos europeus pela primeira vez. O evento principal ocorreu em 22 de abril de 1500, quando o navegador português Pedro Álvares Cabral chegou à costa do Brasil, na região que hoje é o estado da Bahia. \r\n\r\nA expedição de Cabral fazia parte de uma rota para as Índias, e a chegada ao Brasil foi, na verdade, um desvio inesperado. A terra encontrada foi inicialmente chamada de \"Ilha de Vera Cruz\", mas logo passou a ser conhecida como \"Terra de Santa Cruz\" e, eventualmente, Brasil, devido à abundância de pau-brasil, uma árvore nativa cuja madeira era muito valorizada na Europa.\r\n\r\nA partir de então, Portugal começou a explorar e colonizar a região, iniciando um processo de ocupação e exploração que incluiu a exploração de recursos naturais e a introdução de culturas e práticas europeias. Esse processo também envolveu o impacto significativo sobre as populações indígenas que habitavam o território.', 'src\\files\\descobrimento.pdf'),
(2, 'Inconfidência Mineira\r\n', '2024-08-22', '2024-08-16', 'História', 1, '/img/tiradentes.png', '', 'A Inconfidência Mineira foi um movimento separatista que emergiu no final do século XVIII na capitania de Minas Gerais, parte do Império Português. O descontentamento com o domínio colonial se agravava devido aos altos impostos, especialmente o \"quinto\" — 20% da produção de ouro que era enviada para a Coroa Portuguesa. Esse cenário gerou um forte sentimento de insatisfação entre os colonos, que buscavam maior autonomia e a criação de uma república independente.\r\n\r\nEntre os principais líderes da Inconfidência Mineira estavam Joaquim José da Silva Xavier, conhecido como Tiradentes, Tomás Antônio Gonzaga e Cláudio Manuel da Costa. Tiradentes, especialmente, destacou-se na organização e promoção do movimento, que almejava a independência de Minas Gerais, a redução dos impostos e uma forma de governo mais favorável aos interesses locais.\r\n\r\nNo entanto, o movimento foi descoberto em 1789, após denúncias às autoridades portuguesas. Os líderes foram presos e julgados, e Tiradentes, como principal figura do movimento, foi enforcado e teve seu corpo esquartejado, servindo como um exemplo para desencorajar futuros levantes.\r\n\r\nEmbora a Inconfidência Mineira não tenha alcançado seu objetivo de independência, ela é lembrada como um importante precursor do sentimento nacionalista no Brasil. A figura de Tiradentes tornou-se um símbolo da luta pela liberdade e resistência contra a opressão, inspirando movimentos futuros que culminariam na independência do Brasil em 1822.', 'src\\files\\inconfidencia.pdf'),
(3, 'Tratado de Versalhes', '2024-08-14', '2024-08-16', 'História', 1, '/img/tratadoversalhes.jpg', '', '', '');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbmateria`
--

CREATE TABLE `tbmateria` (
  `cod` int(11) NOT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `sigla` char(4) DEFAULT NULL,
  `desativado` tinyint(1) DEFAULT NULL,
  `professor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbmateria`
--

INSERT INTO `tbmateria` (`cod`, `nome`, `sigla`, `desativado`, `professor`) VALUES
(1, 'História', 'HIS', 0, 1),
(2, 'Português', 'PORT', 0, 1),
(3, 'Matemática', 'MAT', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbmaterialcomplementar`
--

CREATE TABLE `tbmaterialcomplementar` (
  `cod` int(11) NOT NULL,
  `arquivo` varchar(500) DEFAULT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `miniatura` varchar(500) DEFAULT NULL,
  `descricao` varchar(300) DEFAULT NULL,
  `guiaestudos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbmaterialcomplementar`
--

INSERT INTO `tbmaterialcomplementar` (`cod`, `arquivo`, `titulo`, `miniatura`, `descricao`, `guiaestudos`) VALUES
(1, NULL, 'Descobrimento do Brasil', '/img/historia1.jpg', 'Material complementar da aula sobre descobrimento do Brasil', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbmensagem`
--

CREATE TABLE `tbmensagem` (
  `cod` int(11) NOT NULL,
  `texto` text DEFAULT NULL,
  `arquivo` varchar(500) DEFAULT NULL,
  `dataHora` datetime DEFAULT NULL,
  `chat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbnotificacao`
--

CREATE TABLE `tbnotificacao` (
  `cod` int(11) NOT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `descricao` varchar(300) DEFAULT NULL,
  `visualizado` tinyint(1) DEFAULT NULL,
  `atividade` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbnotificacao`
--

INSERT INTO `tbnotificacao` (`cod`, `titulo`, `descricao`, `visualizado`, `atividade`) VALUES
(1, 'Atualizações na matéria de História!', 'Houve atualizações na matéria de História!', 0, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbprofessor`
--

CREATE TABLE `tbprofessor` (
  `matricula` int(11) NOT NULL,
  `especialidade` varchar(100) DEFAULT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `cpf` char(14) DEFAULT NULL,
  `rg` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbprofessor`
--

INSERT INTO `tbprofessor` (`matricula`, `especialidade`, `nome`, `cpf`, `rg`, `email`, `telefone`, `endereco`) VALUES
(1, 'História', 'Carlos Magnus', '4743845771', '5746375841', 'carlos@gmail.com', '11957364837', 'Rua Além, 34');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tbsalavirtual`
--

CREATE TABLE `tbsalavirtual` (
  `cod` int(11) NOT NULL,
  `nome` varchar(150) DEFAULT NULL,
  `descricao` varchar(300) DEFAULT NULL,
  `volumetriaEstudantes` int(11) DEFAULT NULL,
  `materia` int(11) DEFAULT NULL,
  `chat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tbsalavirtual`
--

INSERT INTO `tbsalavirtual` (`cod`, `nome`, `descricao`, `volumetriaEstudantes`, `materia`, `chat`) VALUES
(19, 'Sala de História', 'Sala virtual de História', 1, 1, 19),
(20, 'Matemática', 'Sala virtual de matemática', 4, 3, 20);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tbartefatointeratividade`
--
ALTER TABLE `tbartefatointeratividade`
  ADD PRIMARY KEY (`cod`);

--
-- Índices de tabela `tbatividade`
--
ALTER TABLE `tbatividade`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `salavirtual` (`salavirtual`),
  ADD KEY `artefatointeratividade` (`artefatointeratividade`);

--
-- Índices de tabela `tbchatsala`
--
ALTER TABLE `tbchatsala`
  ADD PRIMARY KEY (`cod`);

--
-- Índices de tabela `tbencontrosincrono`
--
ALTER TABLE `tbencontrosincrono`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `atividade` (`atividade`);

--
-- Índices de tabela `tbestudante`
--
ALTER TABLE `tbestudante`
  ADD PRIMARY KEY (`matricula`);

--
-- Índices de tabela `tbestudantes_salavirtual`
--
ALTER TABLE `tbestudantes_salavirtual`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `estudante` (`estudante`),
  ADD KEY `salavirtual` (`salavirtual`);

--
-- Índices de tabela `tbguiaestudos`
--
ALTER TABLE `tbguiaestudos`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `materia` (`materia`);

--
-- Índices de tabela `tbmateria`
--
ALTER TABLE `tbmateria`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `professor` (`professor`);

--
-- Índices de tabela `tbmaterialcomplementar`
--
ALTER TABLE `tbmaterialcomplementar`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `guiaestudos` (`guiaestudos`);

--
-- Índices de tabela `tbmensagem`
--
ALTER TABLE `tbmensagem`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `chat` (`chat`);

--
-- Índices de tabela `tbnotificacao`
--
ALTER TABLE `tbnotificacao`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `atividade` (`atividade`);

--
-- Índices de tabela `tbprofessor`
--
ALTER TABLE `tbprofessor`
  ADD PRIMARY KEY (`matricula`);

--
-- Índices de tabela `tbsalavirtual`
--
ALTER TABLE `tbsalavirtual`
  ADD PRIMARY KEY (`cod`),
  ADD KEY `materia` (`materia`),
  ADD KEY `chat` (`chat`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tbartefatointeratividade`
--
ALTER TABLE `tbartefatointeratividade`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `tbatividade`
--
ALTER TABLE `tbatividade`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tbchatsala`
--
ALTER TABLE `tbchatsala`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `tbencontrosincrono`
--
ALTER TABLE `tbencontrosincrono`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbestudante`
--
ALTER TABLE `tbestudante`
  MODIFY `matricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100001;

--
-- AUTO_INCREMENT de tabela `tbestudantes_salavirtual`
--
ALTER TABLE `tbestudantes_salavirtual`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de tabela `tbguiaestudos`
--
ALTER TABLE `tbguiaestudos`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tbmateria`
--
ALTER TABLE `tbmateria`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tbmaterialcomplementar`
--
ALTER TABLE `tbmaterialcomplementar`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tbmensagem`
--
ALTER TABLE `tbmensagem`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tbnotificacao`
--
ALTER TABLE `tbnotificacao`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `tbprofessor`
--
ALTER TABLE `tbprofessor`
  MODIFY `matricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10001;

--
-- AUTO_INCREMENT de tabela `tbsalavirtual`
--
ALTER TABLE `tbsalavirtual`
  MODIFY `cod` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tbatividade`
--
ALTER TABLE `tbatividade`
  ADD CONSTRAINT `tbatividade_ibfk_1` FOREIGN KEY (`salavirtual`) REFERENCES `tbsalavirtual` (`cod`),
  ADD CONSTRAINT `tbatividade_ibfk_2` FOREIGN KEY (`artefatointeratividade`) REFERENCES `tbartefatointeratividade` (`cod`);

--
-- Restrições para tabelas `tbencontrosincrono`
--
ALTER TABLE `tbencontrosincrono`
  ADD CONSTRAINT `tbencontrosincrono_ibfk_1` FOREIGN KEY (`atividade`) REFERENCES `tbatividade` (`cod`);

--
-- Restrições para tabelas `tbestudantes_salavirtual`
--
ALTER TABLE `tbestudantes_salavirtual`
  ADD CONSTRAINT `tbestudantes_salavirtual_ibfk_1` FOREIGN KEY (`estudante`) REFERENCES `tbestudante` (`matricula`),
  ADD CONSTRAINT `tbestudantes_salavirtual_ibfk_2` FOREIGN KEY (`salavirtual`) REFERENCES `tbsalavirtual` (`cod`);

--
-- Restrições para tabelas `tbguiaestudos`
--
ALTER TABLE `tbguiaestudos`
  ADD CONSTRAINT `tbguiaestudos_ibfk_1` FOREIGN KEY (`materia`) REFERENCES `tbmateria` (`cod`);

--
-- Restrições para tabelas `tbmateria`
--
ALTER TABLE `tbmateria`
  ADD CONSTRAINT `tbmateria_ibfk_1` FOREIGN KEY (`professor`) REFERENCES `tbprofessor` (`matricula`);

--
-- Restrições para tabelas `tbmaterialcomplementar`
--
ALTER TABLE `tbmaterialcomplementar`
  ADD CONSTRAINT `tbmaterialcomplementar_ibfk_1` FOREIGN KEY (`guiaestudos`) REFERENCES `tbguiaestudos` (`cod`);

--
-- Restrições para tabelas `tbmensagem`
--
ALTER TABLE `tbmensagem`
  ADD CONSTRAINT `tbmensagem_ibfk_1` FOREIGN KEY (`chat`) REFERENCES `tbchatsala` (`cod`);

--
-- Restrições para tabelas `tbnotificacao`
--
ALTER TABLE `tbnotificacao`
  ADD CONSTRAINT `tbnotificacao_ibfk_1` FOREIGN KEY (`atividade`) REFERENCES `tbatividade` (`cod`);

--
-- Restrições para tabelas `tbsalavirtual`
--
ALTER TABLE `tbsalavirtual`
  ADD CONSTRAINT `tbsalavirtual_ibfk_1` FOREIGN KEY (`materia`) REFERENCES `tbmateria` (`cod`),
  ADD CONSTRAINT `tbsalavirtual_ibfk_2` FOREIGN KEY (`chat`) REFERENCES `tbchatsala` (`cod`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
