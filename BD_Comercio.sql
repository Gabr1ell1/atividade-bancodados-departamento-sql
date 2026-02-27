CREATE DATABASE BD_Comercio;
USE BD_Comercio;

CREATE TABLE Estado_Civil(
	Cod_estado_civ Int PRIMARY KEY,
	Desc_estado_civ Varchar(100) NOT NULL,
);
CREATE TABLE Cliente(
	Cod_Cliente Int PRIMARY KEY,
	Nome_Cliente Varchar(100) NOT NULL,
	Cod_estado_civ int NOT NULL,
	Salario Float NOT NULL,
	
	FOREIGN KEY(Cod_estado_civ) REFERENCES Estado_Civil,
);
CREATE TABLE Tipo_Fone(
	Cod_Fone Int PRIMARY KEY,
	Desc_Fone Varchar(20) NOT NULL,
);
CREATE TABLE Telefone(
	Cod_Cliente Int NOT NULL,
	Cod_Fone Int NOT NULL,
	Numero_Fone Varchar(12),

	FOREIGN KEY(Cod_Fone) REFERENCES Tipo_Fone,
	FOREIGN KEY(Cod_Cliente) REFERENCES Cliente,
);
CREATE TABLE Func(
	Cod_Func Int PRIMARY KEY,
	Nome_Func Varchar(100) NOT NULL,
);
CREATE TABLE Pedido(
	Cod_Pedido Int PRIMARY KEY,
	Cod_Cliente Int NOT NULL,
	Cod_Func Int NOT NULL,
	Data_pedido DATE NOT NULL,

	FOREIGN KEY(Cod_Cliente) REFERENCES Cliente,
	FOREIGN KEY(Cod_Func) REFERENCES Func,
);
CREATE TABLE Produto(
	Cod_Produto Int PRIMARY KEY,
	Nome_Produto Varchar(100) NOT NULL,
	Tipo_Produto Varchar(100) NOT NULL,
);

CREATE TABLE Item_Pedido(
	Cod_Pedido Int NOT NULL,
	Cod_Produto Int NOT NULL,
	Qtde_Produto Int  NOT NULL,

	FOREIGN KEY(Cod_Pedido) REFERENCES Pedido,
	FOREIGN KEY(Cod_Produto) REFERENCES Produto,
);
CREATE TABLE Premio(
	Cod_Func Int NOT NULL,
	Valor_Premio Float NOT NULL,

	FOREIGN KEY(Cod_Func) REFERENCES Func,
);
CREATE TABLE Dependente(
	Cod_Dep Int PRIMARY KEY,
	Nome_Depe Varchar(100) NOT NULL,
	Data_Nasc DATE  NOT NULL,
	Cod_Func Int  NOT NULL,

	FOREIGN KEY(Cod_Func) REFERENCES Func,
);
CREATE TABLE Conjuge(
	Cod_conjuge Int PRIMARY KEY,
	Nome_Conjuge Varchar(100) NOT NULL,
	Cod_Cliente Int NOT NULL

	FOREIGN KEY(Cod_Cliente) REFERENCES Cliente,
);



-- INSERT --

INSERT INTO Estado_Civil Values(1, 'Casado');
INSERT INTO Estado_Civil Values(2, 'Solteiro');
INSERT INTO Estado_Civil Values(3, 'Separado');

INSERT INTO Cliente Values(1, 'Daniel Lima', 1, '1200.00');
INSERT INTO Cliente Values(2, 'Rener Lopez', 2, '1200.00');
INSERT INTO Cliente Values(3, 'João Bieber', 1, '2000.00');
INSERT INTO Cliente Values(4, 'Maria Silvia', 3, '2000.00');
INSERT INTO Cliente Values(5, 'Karinne Ferreira', 2, '1200.00');
INSERT INTO Cliente Values(6, 'Bernardo Farias', 1, '2000.00');

INSERT INTO Tipo_Fone Values (1, 'Residencial');
INSERT INTO Tipo_Fone Values (2, 'Celular');
INSERT INTO Tipo_Fone Values (3, 'Comercial');
INSERT INTO Tipo_Fone Values (4, 'Não Possui Telefone');

INSERT INTO Telefone Values(1, 2, '99999-1111');
INSERT INTO Telefone Values(2, 1, '88888-2222');
INSERT INTO Telefone Values(3, 2, '99999-3333');
INSERT INTO Telefone Values(4, 3, '77777-4444');
INSERT INTO Telefone Values(5, 2, '66666-5555');
INSERT INTO Telefone Values(6, 4, NULL);

INSERT INTO Func Values(1, 'Francisco Kleber');
INSERT INTO Func Values(2, 'Roseane Park');
INSERT INTO Func Values(3, 'Marcos Curuça');
INSERT INTO Func Values(4, 'Leticia Oliveira');
INSERT INTO Func Values(5, 'Jovana Kenel');

INSERT INTO Produto Values(1, 'Fósforo', 'Doméstico');
INSERT INTO Produto Values(2, 'Vela', 'Doméstico');
INSERT INTO Produto Values(3, 'Feijão', 'Alimento');
INSERT INTO Produto Values(4, 'Arroz', 'Alimento');
INSERT INTO Produto Values(5, 'Leite', 'Alimento');
INSERT INTO Produto Values(6, 'Café','Alimento');
INSERT INTO Produto Values(7, 'Açucar', 'Alimento');
INSERT INTO Produto Values(8, 'Sal', 'Alimento');
INSERT INTO Produto VALUES (9, 'Macarrão', 'Alimento');

INSERT INTO Pedido Values(1, 1, 1, '2025-01-10'); 
INSERT INTO Pedido Values(2, 2, 2, '2025-01-12'); 
INSERT INTO Pedido Values(3, 3, 3, '2025-01-05');
INSERT INTO Pedido Values(4, 4, 1, '2025-02-01');
INSERT INTO Pedido Values(5, 5, 2, '2025-02-10');
INSERT INTO Pedido Values(6, 6, 4, '2025-02-15');

INSERT INTO Item_Pedido Values(1, 1, 2);
INSERT INTO Item_Pedido Values(1, 2, 2);
INSERT INTO Item_Pedido Values(2, 3, 3);
INSERT INTO Item_Pedido Values(2, 1, 1);
INSERT INTO Item_Pedido Values(3, 4, 2);
INSERT INTO Item_Pedido Values(3, 5, 1);
INSERT INTO Item_Pedido Values(4, 6, 1);
INSERT INTO Item_Pedido Values(5, 7, 1);
INSERT INTO Item_Pedido Values(6, 8, 2);

INSERT INTO Premio Values(1, '500.00');
INSERT INTO Premio Values(2, '200.00');
INSERT INTO Premio Values(3, '300.00');
INSERT INTO Premio Values(4, '100.00');

INSERT INTO Dependente Values(1, 'Lucas Kleber', '2010-05-05', 1);
INSERT INTO Dependente Values(2, 'Maria Kleber', '2012-03-15', 1);
INSERT INTO Dependente Values(3, 'Felipe Park', '2018-07-20', 2);
INSERT INTO Dependente Values(4, 'Helena Curuça', '2020-10-12', 3);

INSERT INTO Conjuge Values(1, 'Clara Lima', 1); 
INSERT INTO Conjuge Values(2, 'Julia Bieber', 3); 
INSERT INTO Conjuge Values(3, 'Beatriz Farias',6); 


------------------ PARTE 1 --------------------------
SELECT Cliente.Nome_Cliente, Telefone.Numero_Fone 
FROM Cliente 
INNER JOIN Telefone 
ON Cliente.Cod_Cliente = Telefone.Cod_Cliente;

SELECT Cliente.Nome_Cliente, Conjuge.Nome_Conjuge 
FROM Cliente 
INNER JOIN Conjuge 
ON Cliente.Cod_Cliente = Conjuge.Cod_Cliente;

SELECT Cliente.Nome_Cliente, Telefone.Numero_Fone, Tipo_Fone.Desc_Fone 
FROM Cliente 
INNER JOIN Telefone ON Cliente.Cod_Cliente = Telefone.Cod_Cliente
INNER JOIN Tipo_Fone ON Telefone.Cod_Fone = Tipo_Fone.Cod_Fone;

SELECT Pedido.*, Cliente.Nome_Cliente, Func.Nome_Func
FROM Pedido 
INNER JOIN Cliente ON Pedido.Cod_Cliente = Cliente.Cod_Cliente
INNER JOIN Func ON Pedido.Cod_Func = Func.Cod_Func;

SELECT Pedido.Cod_Pedido, Pedido.Data_pedido, Cliente.Nome_Cliente 
FROM Pedido 
INNER JOIN Cliente ON Pedido.Cod_Cliente = Cliente.Cod_Cliente
INNER JOIN Func ON Pedido.Cod_Func = Func.Cod_Func
WHERE Func.Nome_Func = 'Francisco Kleber';

SELECT Pedido.Cod_Pedido, Pedido.Data_pedido, Func.Nome_Func 
FROM Pedido 
INNER JOIN Cliente ON Pedido.Cod_Cliente = Cliente.Cod_Cliente
INNER JOIN Func ON Pedido.Cod_Func = Func.Cod_Func
WHERE Cliente.Nome_Cliente = 'Rener Lopez';


------------------ PARTE 2 --------------------------
SELECT Dependente.Nome_Depe, Dependente.Data_Nasc, Func.Nome_Func 
FROM Dependente 
INNER JOIN Func 
ON Dependente.Cod_Func = Func.Cod_Func;

SELECT Pedido.Cod_Pedido, Pedido.Data_pedido, Produto.Nome_Produto 
FROM Pedido 
INNER JOIN Item_Pedido ON Pedido.Cod_Pedido = Item_Pedido.Cod_Pedido
INNER JOIN Produto ON Produto.Cod_Produto = Item_Pedido.Cod_Produto ;

SELECT Pedido.Cod_Pedido, Pedido.Data_pedido, Func.Nome_Func 
FROM Pedido 
INNER JOIN Func ON Pedido.Cod_Func = Func.Cod_Func
INNER JOIN Item_Pedido ON Pedido.Cod_Pedido = Item_Pedido.Cod_Pedido
INNER JOIN Produto ON Produto.Cod_Produto = Item_Pedido.Cod_Produto 
WHERE Produto.Nome_Produto = 'Fósforo';

SELECT Pedido.Cod_Pedido, Pedido.Data_pedido, Produto.Nome_Produto 
FROM Pedido 
INNER JOIN Cliente ON Pedido.Cod_Cliente = Cliente.Cod_Cliente
INNER JOIN Item_Pedido ON Pedido.Cod_Pedido = Item_Pedido.Cod_Pedido
INNER JOIN Produto ON Produto.Cod_Produto = Item_Pedido.Cod_Produto 
WHERE Cliente.Nome_Cliente = 'Daniel Lima';

SELECT Produto.Nome_Produto
FROM Produto
INNER JOIN Item_Pedido ON Produto.Cod_Produto = Item_Pedido.Cod_Produto
INNER JOIN Pedido ON Item_Pedido.Cod_Pedido = Pedido.Cod_Pedido
INNER JOIN Func ON Pedido.Cod_Func = Func.Cod_Func
WHERE Func.Nome_Func = 'Roseane Park'; 

SELECT Cliente.Nome_Cliente, Produto.Nome_Produto
FROM Cliente
INNER JOIN Pedido ON Cliente.Cod_Cliente = Pedido.Cod_Cliente
INNER JOIN Item_Pedido ON Pedido.Cod_Pedido = Item_Pedido.Cod_Pedido
INNER JOIN Produto ON Produto.Cod_Produto = Item_Pedido.Cod_Produto;

SELECT Func.Nome_Func, Produto.Nome_Produto
FROM Func
INNER JOIN Pedido ON Func.Cod_Func = Pedido.Cod_Func
INNER JOIN Item_Pedido ON Pedido.Cod_Pedido = Item_Pedido.Cod_Pedido
INNER JOIN Produto ON Produto.Cod_Produto = Item_Pedido.Cod_Produto;


------------------ PARTE 3 --------------------------
SELECT Func.Nome_Func, SUM(premio.Valor_Premio) AS valor_total
FROM Func
INNER JOIN Premio ON Func.Cod_Func = Premio.Cod_Func
GROUP BY Func.Nome_Func;  

SELECT Func.Nome_Func, COUNT(Dependente.Cod_Dep) AS total_dep
FROM Func
INNER JOIN Dependente ON Func.Cod_Func = Dependente.Cod_Func
GROUP BY Func.Nome_Func;

SELECT Cod_estado_civ, COUNT(*) AS Total
FROM Cliente
GROUP BY Cod_estado_civ;

SELECT * 
FROM Cliente
INNER JOIN Telefone ON Cliente.Cod_Cliente = Telefone.Cod_Cliente
WHERE Telefone.Cod_Fone = 4; 

SELECT Cliente.Cod_Cliente, Cliente.Nome_Cliente, Cliente.Cod_estado_civ, Cliente.Salario 
FROM Cliente
INNER JOIN Estado_Civil ON Cliente.Cod_estado_civ = Estado_Civil.Cod_estado_civ
WHERE Estado_Civil.Cod_estado_civ = 2; 

SELECT Cliente.Cod_Cliente, Cliente.Nome_Cliente, Cliente.Cod_estado_civ, Cliente.Salario 
FROM Cliente
INNER JOIN Estado_Civil ON Cliente.Cod_estado_civ = Estado_Civil.Cod_estado_civ
WHERE Estado_Civil.Cod_estado_civ = 1; 

SELECT *
FROM Func 
WHERE Cod_Func 
NOT IN (SELECT Cod_Func FROM Premio WHERE Cod_Func IS NOT NULL);

SELECT *
FROM Func 
WHERE Cod_Func 
NOT IN (SELECT Cod_Func FROM Dependente WHERE Cod_Func IS NOT NULL);

SELECT *
FROM Produto 
WHERE Cod_Produto 
NOT IN (SELECT Cod_Produto FROM Item_Pedido WHERE Cod_Produto IS NOT NULL);





