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


--**************************************************************************24/08/24

-- Seleciona os 15 primeiros nomes mais comuns na tabela 'Person.Person' Isso � �til para obter uma vis�o r�pida dos nomes mais comuns
SELECT TOP 15
       FirstName,                -- Seleciona a coluna 'FirstName' (primeiro nome)
	   COUNT(FirstName) AS qtd   -- Conta quantas vezes cada 'FirstName' aparece e atribui o nome 'qtd' para o resultado
	   FROM Person.Person        -- Especifica a tabela 'Person.Person' de onde os dados ser�o extra�dos
	   GROUP BY FirstName        -- Agrupa os resultados por 'FirstName' para contar as ocorr�ncias de cada nome
ORDER BY qtd DESC;               -- Ordena os resultados em ordem decrescente pela quantidade ('qtd'), mostrando os nomes mais comuns primeiro


-- Retorna o nome completo e o e-mail dos clientes cadastrados( interessante pois podemos confirmar os e mails dos clientes)
SELECT
       CONCAT(p.FirstName, ' ', p.LastName) AS Name, -- Combina 'FirstName' e 'LastName' em um �nico nome completo
       e.EmailAddress                                -- Seleciona o e-mail dos clientes
FROM 
       Person.Person p                               -- Consulta a tabela 'Person.Person' com o alias 'p'
JOIN 
       Person.EmailAddress e                         -- Realiza um JOIN na tabela 'Person.EmailAddress' com o alias 'e'
ON 
       p.BusinessEntityID = e.BusinessEntityID       -- Relaciona as tabelas pela chave 'BusinessEntityID'
ORDER BY 
       Name ASC;                                     -- Ordena os resultados alfabeticamente pelo nome completo



-- Conta quantos clientes t�m sobrenomes que come�am com 'P' e quantos come�am com 'H'
SELECT 
    COUNT(CASE WHEN LastName LIKE 'P%' THEN 1 END) AS qtd_P, -- Conta sobrenomes que come�am com 'P'
    COUNT(CASE WHEN LastName LIKE 'H%' THEN 1 END) AS qtd_H  -- Conta sobrenomes que come�am com 'H'
FROM 
    Person.Person;                                           -- Consulta a tabela 'Person.Person'



-- Conta o n�mero de cidades distintas em que os clientes est�o registrados
SELECT COUNT(DISTINCT City) AS qtd    -- Conta o n�mero de cidades distintas e atribui o nome 'qtd' ao resultado
FROM Person.Address;                  -- Consulta a tabela 'Person.Address'



-- Conta o n�mero de cidades distintas em que os clientes est�o registrados
SELECT COUNT(DISTINCT City) AS qtd    -- Conta o n�mero de cidades distintas e atribui o nome 'qtd' ao resultado
FROM Person.Address;                  -- Consulta a tabela 'Person.Address'



-- Lista todas as cidades distintas em que os clientes est�o registrados
SELECT DISTINCT City                 -- Seleciona cidades distintas
FROM Person.Address                 -- Consulta a tabela 'Person.Address'
ORDER BY City                       -- Ordena as cidades em ordem alfab�tica


--Uma Obs lega � que No SQL Server, o ponto e v�rgula (;) � usado para separar instru��es SQL, mas n�o deve ser colocado ap�s
--uma instru��o ORDER BY em uma consulta com DISTINCT ou outras cl�usulas que s�o parte da mesma consulta.


-- Lista as tabelas e suas chaves prim�rias | INNER JOIN � um tipo de jun��o em SQL que permite combinar registros
SELECT 
    t.name AS TableName,
    pk.name AS PrimaryKeyName,
    c.name AS ColumnName
FROM 
    sys.tables t
    INNER JOIN sys.indexes pk ON t.object_id = pk.object_id
    INNER JOIN sys.index_columns ic ON pk.object_id = ic.object_id AND pk.index_id = ic.index_id
    INNER JOIN sys.columns c ON ic.object_id = c.object_id AND ic.column_id = c.column_id
WHERE 
    pk.is_primary_key = 1
ORDER BY 
    t.name, pk.name;



-- Listar tabelas e suas colunas
SELECT 
    t.name AS TableName,
    c.name AS ColumnName,
    c.system_type_id AS DataType
FROM 
    sys.tables t
    INNER JOIN sys.columns c ON t.object_id = c.object_id
ORDER BY 
    t.name, c.column_id;



--Consultar detalhes dos �ndices
SELECT 
    object_name(object_id) AS TableName,
    name AS IndexName,
    type_desc AS IndexType,
    is_primary_key
FROM 
    sys.indexes
WHERE 
    object_id = OBJECT_ID('PK_ProductDocument_ProductID_DocumentNode'); -- Substitua pelo nome da tabela


--Equipe de Log�stica a equipe de Log�stica pediu o total de produtos cadastrados no sistema.

SELECT COUNT(*) AS quantity 
FROM Production.Product 

-- Seleciona todos os registros da tabela 'Production.Product'onde o pre�o da lista � maior ou igual a 1500 e a cor do produto � 'BLUE'
SELECT *
FROM Production.Product
WHERE ListPrice >= 1000
  AND COLOR = 'BLUE';
