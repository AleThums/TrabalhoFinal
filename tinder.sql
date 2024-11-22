-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/11/2024 às 13:51
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
-- Banco de dados: `tinder`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `filme`
--

CREATE TABLE `filme` (
  `nome` varchar(300) NOT NULL,
  `caminhoFoto` varchar(300) NOT NULL,
  `descricao` varchar(300) NOT NULL,
  `idFilme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `filme`
--

INSERT INTO `filme` (`nome`, `caminhoFoto`, `descricao`, `idFilme`) VALUES
('Annabelle', 'uploads/annabelle.png', 'Filme de terror sobre uma boneca possuída por um espírito maligno.', 1),
('Enrolados', 'uploads/enrolados.png', 'Uma versão moderna do conto de Rapunzel, com muita aventura e humor.', 2),
('Harry Potter e a Pedra Filosofal', 'uploads/harry_potter1.png', 'O jovem Harry Potter descobre que é um bruxo e começa sua jornada na escola de magia.', 3),
('Harry Potter e a Câmara Secreta', 'uploads/harry_potter2.png', 'Harry Potter enfrenta perigos na escola de magia, incluindo a descoberta de uma câmara secreta.', 4),
('Harry Potter e o Prisioneiro de Azkaban', 'uploads/harry_potter3.png', 'Harry encontra o prisioneiro fugitivo Sirius Black e descobre segredos sobre seu passado.', 5),
('Harry Potter e o Cálice de Fogo', 'uploads/harry_potter4.png', 'Harry é misteriosamente inscrito no Torneio Tribruxo e enfrenta perigos em várias provas.', 6),
('Harry Potter e a Ordem da Fênix', 'uploads/harry_potter5.png', 'Harry forma a Ordem da Fênix para enfrentar Lord Voldemort e seus seguidores.', 7),
('Harry Potter e o Príncipe Mestres da Morte', 'uploads/harry_potter6.png', 'Harry aprende mais sobre a história de Voldemort e busca formas de derrotá-lo.', 8),
('Harry Potter e as Relíquias da Morte: Parte 1', 'uploads/harry_potter7.png', 'Harry, Hermione e Ron tentam destruir as horcruxes para derrotar Voldemort.', 9),
('Harry Potter e as Relíquias da Morte: Parte 2', 'uploads/harry_potter8.png', 'A batalha final contra Voldemort ocorre enquanto Harry luta para salvar o mundo bruxo.', 10),
('Jogos Vorazes', 'uploads/jogos_vorazes1.png', 'Em um futuro distópico, Katniss Everdeen luta pela sobrevivência no brutal jogo de TV.', 11),
('Jogos Vorazes: Em Chamas', 'uploads/jogos_vorazes2.png', 'Katniss volta para os Jogos Vorazes e se torna um símbolo de rebelião.', 12),
('O Menino do Pijama Listrado', 'uploads/menino_pijama.png', 'A história de uma amizade improvável entre um menino e o filho de um oficial nazista durante a Segunda Guerra Mundial.', 13),
('Procurando Nemo', 'uploads/procurando_nemo.png', 'Marlin, um peixe, viaja pelo oceano para encontrar seu filho perdido, Nemo.', 14),
('Toy Story', 'uploads/toy_story.png', 'Os brinquedos de Andy ganham vida quando ele não está por perto e enfrentam aventuras incríveis.', 15);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUser` int(11) NOT NULL,
  `emailInstitucional` varchar(300) NOT NULL,
  `nome` varchar(300) NOT NULL,
  `senha` varchar(300) NOT NULL,
  `isGerente` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`idUser`, `emailInstitucional`, `nome`, `senha`, `isGerente`) VALUES
(0, 'admin', 'admin', 'senha@123', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `voto`
--

CREATE TABLE `voto` (
  `idVoto` int(11) NOT NULL,
  `idFilme` int(11) NOT NULL,
  `idUser` int(11) NOT NULL,
  `numStars` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `filme`
--
ALTER TABLE `filme`
  ADD PRIMARY KEY (`idFilme`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUser`);

--
-- Índices de tabela `voto`
--
ALTER TABLE `voto`
  ADD PRIMARY KEY (`idVoto`),
  ADD KEY `idFilme` (`idFilme`),
  ADD KEY `idUser` (`idUser`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `filme`
--
ALTER TABLE `filme`
  MODIFY `idFilme` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `voto`
--
ALTER TABLE `voto`
  MODIFY `idVoto` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `voto`
--
ALTER TABLE `voto`
  ADD CONSTRAINT `voto_ibfk_1` FOREIGN KEY (`idFilme`) REFERENCES `filme` (`idFilme`),
  ADD CONSTRAINT `voto_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `usuario` (`idUser`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
