-- Este script seleciona todas as colunas da tabela person.Person.
-- Pode ser usado para visualizar todos os dados disponíveis na tabela.
SELECT*
FROM person.Person;


-- Este script seleciona somente a coluna Title da tabela person.Person.
-- Utilizado para analisar os títulos das pessoas registradas na tabela.
SELECT Title
FROM person.Person;


-- Seleciona todas as colunas da tabela person.EmailAddress
-- Para analisar os endereços de e-mail registrados.
SELECT*
FROM person.EmailAddress


-- Seleciona as colunas FirstName e LastName da tabela person.Person
-- Utilizado para visualizar os nomes e sobrenomes das pessoas.
SELECT firstName, lastName
FROM person.Person;


-- Seleciona nomes únicos na coluna FirstName da tabela person.Person
-- Removendo duplicatas.
SELECT DISTINCT FirstName
FROM person.Person;


-- Seleciona sobrenomes únicos na coluna LastName da tabela person.Person
-- Também removendo duplicatas.
SELECT DISTINCT LastName
FROM person.Person;


-- Filtra a tabela person.Person para encontrar registros
-- Específicos de uma pessoa com sobrenome 'Miller' e nome 'Anna'.
SELECT*
FROM person.person
WHERE LastName = 'miller' and FirstName = 'anna'


-- Seleciona todos os produtos das cores 'blue' ou 'black'
-- na tabela production.Product.
SELECT*
FROM production.Product
WHERE color = 'blue' or color = 'black'


--**************************************************************************24/08/24
	

-- Seleciona os 15 primeiros nomes mais comuns na tabela 'Person.Person' Isso é útil para obter uma visão rápida dos nomes mais comuns
SELECT TOP 15
       FirstName,                -- Seleciona a coluna 'FirstName' (primeiro nome)
	   COUNT(FirstName) AS qtd   -- Conta quantas vezes cada 'FirstName' aparece e atribui o nome 'qtd' para o resultado
	   FROM Person.Person        -- Especifica a tabela 'Person.Person' de onde os dados serão extraídos
	   GROUP BY FirstName        -- Agrupa os resultados por 'FirstName' para contar as ocorrências de cada nome
ORDER BY qtd DESC;               -- Ordena os resultados em ordem decrescente pela quantidade ('qtd'), mostrando os nomes mais comuns primeiro


-- Retorna o nome completo e o e-mail dos clientes cadastrados( interessante pois podemos confirmar os e mails dos clientes)
SELECT
       CONCAT(p.FirstName, ' ', p.LastName) AS Name, -- Combina 'FirstName' e 'LastName' em um único nome completo
       e.EmailAddress                                -- Seleciona o e-mail dos clientes
FROM 
       Person.Person p                               -- Consulta a tabela 'Person.Person' com o alias 'p'
JOIN 
       Person.EmailAddress e                         -- Realiza um JOIN na tabela 'Person.EmailAddress' com o alias 'e'
ON 
       p.BusinessEntityID = e.BusinessEntityID       -- Relaciona as tabelas pela chave 'BusinessEntityID'
ORDER BY 
       Name ASC;                                     -- Ordena os resultados alfabeticamente pelo nome completo



-- Conta quantos clientes têm sobrenomes que começam com 'P' e quantos começam com 'H'
SELECT 
    COUNT(CASE WHEN LastName LIKE 'P%' THEN 1 END) AS qtd_P, -- Conta sobrenomes que começam com 'P'
    COUNT(CASE WHEN LastName LIKE 'H%' THEN 1 END) AS qtd_H  -- Conta sobrenomes que começam com 'H'
FROM 
    Person.Person;                                           -- Consulta a tabela 'Person.Person'



-- Conta o número de cidades distintas em que os clientes estão registrados
SELECT COUNT(DISTINCT City) AS qtd    -- Conta o número de cidades distintas e atribui o nome 'qtd' ao resultado
FROM Person.Address;                  -- Consulta a tabela 'Person.Address'



-- Conta o número de cidades distintas em que os clientes estão registrados
SELECT COUNT(DISTINCT City) AS qtd    -- Conta o número de cidades distintas e atribui o nome 'qtd' ao resultado
FROM Person.Address;                  -- Consulta a tabela 'Person.Address'



-- Lista todas as cidades distintas em que os clientes estão registrados
SELECT DISTINCT City                 -- Seleciona cidades distintas
FROM Person.Address                 -- Consulta a tabela 'Person.Address'
ORDER BY City                       -- Ordena as cidades em ordem alfabética


--Uma Obs lega é que No SQL Server, o ponto e vírgula (;) é usado para separar instruções SQL, mas não deve ser colocado após
--uma instrução ORDER BY em uma consulta com DISTINCT ou outras cláusulas que são parte da mesma consulta.


-- Lista as tabelas e suas chaves primárias | INNER JOIN é um tipo de junção em SQL que permite combinar registros
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



--Consultar detalhes dos índices
SELECT 
    object_name(object_id) AS TableName,
    name AS IndexName,
    type_desc AS IndexType,
    is_primary_key
FROM 
    sys.indexes
WHERE 
    object_id = OBJECT_ID('PK_ProductDocument_ProductID_DocumentNode'); -- Substitua pelo nome da tabela


--Equipe de Logística a equipe de Logística pediu o total de produtos cadastrados no sistema.

SELECT COUNT(*) AS quantity 
FROM Production.Product 

-- Seleciona todos os registros da tabela 'Production.Product'onde o preço da lista é maior ou igual a 1500 e a cor do produto é 'BLUE'
SELECT *
FROM Production.Product
WHERE ListPrice >= 1000
  AND COLOR = 'BLUE';
