
CREATE TABLE Empregado(

          NUM_EMP int NOT null,
          SALARIO float NOT null,
          NOME_EMP varchar(50) NOT null,
          NUM_DEPTO int NOT null,
          NOME_DEPTO varchar(50) NOT null,

          PRIMARY KEY (NUM_EMP)

);

CREATE TABLE Dependente(

          ID_DEPEN int NOT null,
          NOME_DEPEN varchar(50) NOT null,
          DATA_NASC date,

          NUM_EMP int NOT null,


          PRIMARY KEY (ID_DEPEN),

          CONSTRAINT Empregado_Possui_Dependente
          FOREIGN KEY (NUM_EMP) references Empregado (NUM_EMP)
          
);

CREATE TABLE Projeto(

          ID_PROJETO int NOT null,
          NOME_PROJETO varchar(50) NOT null,

          NUM_EMP int NOT null,


          PRIMARY KEY (ID_PROJETO),

          CONSTRAINT Empregado_Controla_Projeto
          FOREIGN KEY (NUM_EMP) references Empregado (NUM_EMP) 

);

CREATE TABLE Participa(

          COD_PARTICIPACAO int NOT null,
          HS_TRAB time NOT null,

          NUM_EMP   int NOT null,  
          ID_PROJETO int NOT null,


          PRIMARY KEY(COD_PARTICIPACAO),

          CONSTRAINT Empregado_Participa_Projeto
          FOREIGN KEY (NUM_EMP) references Empregado (NUM_EMP),

          CONSTRAINT Projeto_Participacao_Empregado
          FOREIGN KEY (ID_PROJETO) references Projeto(ID_PROJETO)
);

INSERT INTO Empregado(NUM_EMP, SALARIO, NOME_EMP, NUM_DEPTO, NOME_DEPTO) VALUES (1, 1300, "Mari", 1, "Tecnologia");
INSERT INTO Empregado(NUM_EMP, SALARIO, NOME_EMP, NUM_DEPTO, NOME_DEPTO) VALUES (2, 1250, "Bruno", 2, "Robotica");
INSERT INTO Empregado(NUM_EMP, SALARIO, NOME_EMP, NUM_DEPTO, NOME_DEPTO) VALUES (3, 3200, "Rodrigo", 3, "Limpeza");

INSERT INTO Dependente(ID_DEPEN, NOME_DEPEN, DATA_NASC, NUM_EMP) VALUES (1, "Julia", null, 2);  --Quis colocar um com date, mas nõ soube como inserir
INSERT INTO Dependente(ID_DEPEN, NOME_DEPEN, DATA_NASC, NUM_EMP) VALUES (2, "Grazi", null, 2); 
INSERT INTO Dependente(ID_DEPEN, NOME_DEPEN, DATA_NASC, NUM_EMP) VALUES (3, "Carol", null, 1);

INSERT INTO Projeto(ID_PROJETO, NOME_PROJETO, NUM_EMP) VALUES (1, "Limpeza comunitaria federal", 3);
INSERT INTO Projeto(ID_PROJETO, NOME_PROJETO, NUM_EMP) VALUES (2, "Megazord dos Power Ragers", 2);
INSERT INTO Projeto(ID_PROJETO, NOME_PROJETO, NUM_EMP) VALUES (3, "Bnco de Dados", 1);

INSERT INTO Participa(COD_PARTICIPACAO, HS_TRAB, NUM_EMP, ID_PROJETO) VALUES (1, 3000, 1, 3);
INSERT INTO Participa(COD_PARTICIPACAO, HS_TRAB, NUM_EMP, ID_PROJETO) VALUES (2, 500, 2, 2);
INSERT INTO Participa(COD_PARTICIPACAO, HS_TRAB, NUM_EMP, ID_PROJETO) VALUES (3, 0030, 3,1);