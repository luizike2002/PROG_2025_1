-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Tempo de geração: 29/06/2025 às 20:14
-- Versão do servidor: 8.3.0
-- Versão do PHP: 8.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `hospital_system`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `consulta`
--

CREATE TABLE `consulta` (
  `id` int NOT NULL,
  `paciente_id` int NOT NULL,
  `medico_id` int NOT NULL,
  `data_consulta` datetime NOT NULL,
  `observacoes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `consulta`
--

INSERT INTO `consulta` (`id`, `paciente_id`, `medico_id`, `data_consulta`, `observacoes`) VALUES
(1, 1, 10, '2025-06-30 10:15:00', 'Paciente Vira em Jejum');

-- --------------------------------------------------------

--
-- Estrutura para tabela `medico`
--

CREATE TABLE `medico` (
  `id` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `crm` varchar(15) NOT NULL,
  `especialidade` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `medico`
--

INSERT INTO `medico` (`id`, `nome`, `crm`, `especialidade`, `telefone`) VALUES
(1, 'Dr. Ana Beatriz', '123456-SP', 'Cardiologia', '(11) 99999-1111'),
(2, 'Dr. João Pedro', '654321-RJ', 'Ortopedia', '(21) 98888-2222'),
(3, 'Dra. Camila Souza', '112233-MG', 'Dermatologia', '(31) 97777-3333'),
(4, 'Dr. Ricardo Lima', '445566-SP', 'Pediatria', '(11) 95555-4444'),
(5, 'Dra. Fernanda Alves', '778899-BA', 'Ginecologia', '(71) 93333-5555'),
(6, 'Dr. Bruno Rocha', '998877-PE', 'Neurologia', '(81) 92222-6666'),
(7, 'Dra. Juliana Costa', '334455-RS', 'Endocrinologia', '(51) 94444-7777'),
(8, 'Dr. Marcelo Andrade', '556677-PR', 'Psquiatria', '(41) 98888-8888'),
(9, 'Dra. Luiza Ramos', '889900-MA', 'Reumatologia', '(98) 97777-9999'),
(10, 'Dr. Eduardo Pires', '223344-AM', 'Urologia', '(92) 91111-0000');

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

CREATE TABLE `paciente` (
  `id` int NOT NULL,
  `nome` varchar(255) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `data_nascimento` date NOT NULL,
  `sexo` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Despejando dados para a tabela `paciente`
--

INSERT INTO `paciente` (`id`, `nome`, `cpf`, `data_nascimento`, `sexo`) VALUES
(1, 'Lucas Martins', '12345678900', '1990-05-12', 'M'),
(2, 'Mariana Rocha', '9876543210', '1985-08-25', 'F'),
(3, 'Carlos Henrique', '45612378999', '2002-11-03', 'M');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paciente_id` (`paciente_id`),
  ADD KEY `medico_id` (`medico_id`);

--
-- Índices de tabela `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `crm` (`crm`);

--
-- Índices de tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cpf` (`cpf`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `consulta`
--
ALTER TABLE `consulta`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `medico`
--
ALTER TABLE `medico`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
