CREATE DATABASE academiamovimentomais_ruan;

USE academiamovimentomais_ruan;

CREATE TABLE Cliente (
    IdCliente	INT IDENTITY(1,1) PRIMARY KEY,
    Nome	VARCHAR(100) NOT NULL,
    CPF	CHAR(11)	NOT NULL UNIQUE,
    Email	VARCHAR(100)	NOT NULL UNIQUE,
    Telefone	VARCHAR(20)	NOT NULL,
    DataNascimento	DATE NULL,
    Ativo	BIT	NOT NULL DEFAULT 1, 

);

CREATE TABLE Instrutores (
    IdInstrutor	INT	IDENTITY(1,1)  PRIMARY KEY,
    Nome	VARCHAR(100)	NOT NULL,
    CREF	VARCHAR(20)	NOT NULL UNIQUE,
    Especialidade	VARCHAR(80)	NOT NULL,
    Email	VARCHAR(100)	NOT NULL UNIQUE,
    Ativo	BIT	DEFAULT 1,
);

CREATE TABLE Modalidades (
    IdModalidade	INT	IDENTITY(1,1) PRIMARY KEY,
    NomeModalidade	VARCHAR(80)	NOT NULL UNIQUE,
    Nivel	VARCHAR(20)	NOT NULL,
    DuracaoMinutos	INT	NOT NULL CHECK (DuracaoMinutos >= 1 AND DuracaoMinutos<=200),
    Descricao VARCHAR(200),
)

DROP TABLE Modalidades;

CREATE TABLE Planos (
    IdPlano	INT	IDENTITY(1,1) PRIMARY KEY,
    NomePlano	VARCHAR(80)	NOT NULL UNIQUE,
    ValorMensal	DECIMAL(10,2)	NOT NULL  CHECK (ValorMensal>0),
    DuracaoMeses	INT	NOT NULL CHECK (DuracaoMeses > 1 AND DuracaoMeses<=24),
    AcessoLivre	BIT	DEFAULT 0,
);

CREATE TABLE Matricula(
IdMatricula INT IDENTITY(1,1) PRIMARY KEY,
IdCliente INT NOT NULL FOREIGN KEY REFERENCES Cliente(IdCliente),
IdPlano INT NOT NULL FOREIGN KEY REFERENCES Planos(IdPlano),
DataInicio DATE NOT NULL,
StatusMatricula VARCHAR(15) NOT NULL DEFAULT 'Ativa',
Desconto DECIMAL(5,2) NOT NULL DEFAULT 0 CHECK (Desconto >= 0 AND Desconto <= 100)
);

CREATE TABLE Aulas(
    IdAula INT IDENTITY(1,1) PRIMARY KEY,
    IdModalidade INT NOT NULL FOREIGN KEY REFERENCES Modalidades(IdModalidade),
    IdInstrutor INT NOT NULL FOREIGN KEY REFERENCES Instrutores(IdInstrutor),
    DataAula DATE NOT NULL,
    Horario TIME NOT NULL,
    Vagas INT NOT NULL CHECK (Vagas >= 1 AND Vagas <= 50),
    Sala VARCHAR(30) NOT NULL
);

INSERT INTO Instrutores (Nome, CREF, Especialidade, Email)
VALUES
('André Silva', 'CREF-SP-1001',	'Musculação', 'andre.silva@movimentomais.com'),
('Beatriz Costa', 'CREF-SP-1002',	'Pilates',	'beatriz.costa@movimentomais.com'),
('Caio Mendes',	'CREF-SP-1003',	'Cross Training', 'caio.mendes@movimentomais.com'),
('Daniela Reis',	'CREF-SP-1004',	'Dança', 'daniela.reis@movimentomais.com'),
('Eduardo Lima',	'CREF-SP-1005',	'Natação',	'eduardo.lima@movimentomais.com'),
('Fernanda Alves', 'CREF-SP-1006', 'Yoga',	'fernanda.alves@movimentomais.com'),
('Gabriel Rocha', 'CREF-SP-1007', 'Funcional',	'gabriel.rocha@movimentomais.com'),
('Helena Souza', 'CREF-SP-1008', 'Corrida',	'helena.souza@movimentomais.com'),
('Igor Martins', 'CREF-SP-1009', 'Lutas',	'igor.martins@movimentomais.com'),
('Juliana Nunes', 'CREF-SP-1010', 'Alongamento',	'juliana.nunes@movimentomais.com');

INSERT INTO Modalidades (NomeModalidade, Nivel, DuracaoMinutos, Descricao)
VALUES
('Musculação', 'Todos',	'60',	'Treino com pesos e equipamentos'),
('Pilates', 'Iniciante',	'50',	'Exercícios de equilíbrio e fortalecimento'),
('Cross Training',	'Intermediário',	'45',	'Circuito de alta intensidade'),
('Zumba',	'Todos',	'50',	'Aula de dança com ritmos variados'),
('Natação', 'Iniciante',	'45',	'Fundamentos de natação'),
('Yoga', 'Todos',	'60',	'Posturas, respiração e concentração'),
('Treino Funcional', 'Intermediário',	'45',	'Movimentos para condicionamento físico'),
('Corrida Orientada', 'Intermediário',	'40',	'Técnica e resistência para corrida'),
('Muay Thai', 'Iniciante',	'60',	'Fundamentos da luta e condicionamento'),
('Alongamento', 'Todos',	'30',	'Mobilidade e flexibilidade');

SELECT * FROM Instrutores;
SELECT * FROM  Modalidades;
SELECT * FROM  Clientes;
SELECT * FROM  Planos;