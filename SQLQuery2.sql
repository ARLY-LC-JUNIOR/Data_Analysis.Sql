-- Este script seleciona todas as colunas da tabela person.Person.
-- Pode ser usado para visualizar todos os dados dispon�veis na tabela.
SELECT*
FROM person.Person;


-- Este script seleciona somente a coluna Title da tabela person.Person.
-- Utilizado para analisar os t�tulos das pessoas registradas na tabela.
SELECT Title
FROM person.Person;

-- Seleciona todas as colunas da tabela person.EmailAddress
-- Para analisar os endere�os de e-mail registrados.
SELECT*
FROM person.EmailAddress

-- Seleciona as colunas FirstName e LastName da tabela person.Person
-- Utilizado para visualizar os nomes e sobrenomes das pessoas.
SELECT firstName, lastName
FROM person.Person;

-- Seleciona nomes �nicos na coluna FirstName da tabela person.Person
-- Removendo duplicatas.
SELECT DISTINCT FirstName
FROM person.Person;


-- Seleciona sobrenomes �nicos na coluna LastName da tabela person.Person
-- Tamb�m removendo duplicatas.
SELECT DISTINCT LastName
FROM person.Person;

-- Filtra a tabela person.Person para encontrar registros
-- Espec�ficos de uma pessoa com sobrenome 'Miller' e nome 'Anna'.
SELECT*
FROM person.person
WHERE LastName = 'miller' and FirstName = 'anna'

-- Seleciona todos os produtos das cores 'blue' ou 'black'
-- na tabela production.Product.
SELECT*
FROM production.Product
WHERE color = 'blue' or color = 'black'
