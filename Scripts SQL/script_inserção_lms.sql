INSERT INTO Aluno (Login, Senha, Nome, Email, Celular, DtExpiracao, RA) 
	VALUES ('Roadm11', 'rodrigo170', 'Rodrigo Macedo', 'rodrigo.adm11@gmail.com', '986877072', '20180513', '1701304'),
		   ('Daniimd', 'dani@40', 'Daniela Martins', 'danii__@hotmail.com', '986877073', '20180513', '1701098'),
		   ('Tamysantos', 'tamy_50', 'Tamires Santos', 'tamiressantos@hotmail.com', '954768842', '20180715', '1701006'),
		   ('Mvoliveira', 'marcao1415', 'Marcos Oliveira', 'marcos_oliveira@gmail.com', '975428926', '20180718', '1701334'),
		   ('Jojotodin', 'josefa.024', 'Josefa Silva', 'jojo.gigi@bol.com', '974569852', '20190524', '1702692');
GO

INSERT INTO Coordenador (Login, Senha, Nome, Email, Celular, DtExpiracao) 
	VALUES ('Otakai', 'otakai20', 'Gilberto Otakai', 'otakai@gmail.com', '954685624', '20180513'),
		   ('Osvalda1', 'osvalda113', 'Osvaldo Ferreira', 'osvaldofer@hotmail.com', '975369514', '20180513'),
		   ('Marciana', 'marcia22', 'Marcia Santos', 'marciana5@hotmail.com', '947896321', '20180715'),
		   ('Josi14', '14jose', 'Josiane Valdes', 'josivaldes@gmail.com', '945637896', '20180718'),
		   ('Sand', 'onosand', 'Sand Onofre', 'sand.onofre@gmail.com', '941539574', '20190524');
GO

INSERT INTO Professor (Login, Senha, Nome, Email, Celular, DtExpiracao, Apelido) 
	VALUES ('GilbertC', 'Gilbert85', 'Gilberto Cesar', 'Gilbertin@gmail.com', '954685624', '20180514', 'Gil'),
		   ('Clayde', 'clm47', 'Cleide Maria', 'osvaldofer@hotmail.com', '975369514', '20180513', 'Cleide'),
		   ('Marciana', 'marcia22', 'Marcia Santos', 'marciana5@hotmail.com', '947896321', '20180715', 'Marcinha'),
		   ('JrCleber', 'jr3564', 'Cleber Junior', 'cleberj@gmail.com', '948659758', '20180718', 'Clebao'),
		   ('Sand', 'onosand', 'Sand Onofre', 'sand.onofre@gmail.com', '941539574', '20190524', 'Areia');
GO

insert into disciplina(nome, PlanoDeEnsino,CargaHoraria,Competencias, Habilidades, Ementa, 
ConteudoProgramatico, BibliografiaBasica, BibliografiaComplementar, PercentualPratico, 
PercentualTeorico, IdCoordenador) values
('Tecnolgia Web','Introdu��o �s tecnologias de desenvolvimento WEB.',80,'Html, Javascript, CSS, Python, Django','Desenvolver sites','Desenvolvimento de sites com tecnologia HTML.','1. Programa��o para Web. 2. Frameworks Web. 3. Engenharia Web.','ALMEIDA, M.G. E ROSA, P.C., Internet, Intranet e Redes Corporativas.','Rio de Janeiro, Brasport, 1a. Edi��o, 2000.',80,20,1),
('Engenharia de Software',
'Introdu��o � engenharia de softwares.',
80,
'Capacidade de defender o uso de m�todos consagradas da Engenharia de Software.',
'Discernir Software e Hardware, bem como as suas caracter�sticas.',
'Engenharia de Software: Conceitos e objetivos. ',
'1.Introdu��o. 2.Abordagens de An�lise de Software',
'HIRAMA, K. Engenharia de Software. Rio de Janeiro: Elsevier, 2015.',
'BECK, K. TDD � Desenvolvimento Guiado por Testes. Porto Alegre: Bookman, 2010.',
0,
100,
2),
('Linguagem de Programa��o II',
'Desenvolvimento de algoritmos com linguagem de programa��o.',
80,
'Analisar problemas computacionais e projetar solu��es por meio da constru��o de algoritmos.',
'Codificar e interpretar c�digos na linguagem de programa��o Python.',
'A  linguagem  de  programa��o  Python  oferece  diversas  ferramentas  que  colaboram  para  a aprendizagem de programa��o.',
'1. Vari�veis. 2. Tipos de dados. 3. Estruturas de repeti��o.',
'BORGES, Luiz. Python para desenvolvedores.1. ed. S�o Paulo: Novatec, 2014.',
'MENEZES, Nilo. Introdu��o � Programa��o Python. 2. S�o Paulo:  Novatec, 2014.',
80,
20,
3),
('Banco de Dados',
'Compreens�o e pr�tica da linguagem SQL.',
80,
'Manipular uma base de dados atrav�s da linguagem SQL.',
'Elaborar consultas com as opera��es da �lgebra Relacional.',
'Linguagem de defini��o e manipula��o de dados( SQL � DDL e DML).',
'1. Modelagem de Dados, 2. Normaliza��o, 3. DDL, 4. DML',
'Sistemas de Banco de Dados ELMASRI, R., Pearson, Addison, Wesley 4� edi��o 2005',
'Projeto de Banco de Dados Heuser, C. A. Bookman 6� edi��o 2009',
80,
20,
5),
('L�gica de Programa��o',
'Introdu��o � l�gica de programa��o e algoritmos.',
80,
'Ter racioc�nio l�gico, codificar, compilar, e testar.',
'Construir e testar algoritmos; utilizar estruturas de dados na resolu��o de problemas computacionais.',
'Introdu��o � inform�tica. No��es de algoritmos e suas representa��es.',
'1. Defini��o de l�gica e algoritmo. 2. Vari�veis. 3. Tipos de dados. 4. Pseudoc�digo',
'Alcalde, E.; Garcia, M.; Penuelas, S. Inform�tica B�sica. MAKRON Books, 1991.',
'Meirelles, F. S. Inform�tica � Novas Aplica��es com Microcomputadores. MAKRON Books, 1991.',
50,
50,
4);
GO

INSERT INTO Curso(Nome)
VALUES('Sistemas de Informa��o'),
('An�lise e Desenvolvimento de Sistemas'),
('Banco de Dados'),
('Administra��o'),
('Redes de Computadores');
GO

INSERT INTO DisciplinaOfertada(IdCoordenador, DtInicioMatricula, DtFimMatricula,IdDisciplina, IdCurso, Ano, Semestre, Turma, IdProfessor, Metodologia, Recursos, CriterioAvaliacao, PlanoDeAulas)
VALUES(1, '2018-01-05', '2018-01-20', 1, 1, 2018, 1, 'A', 1, 'Tradicional', 'Computador, biblioteca', 'Media >= 7 e 75% de presen�a = APROVADO, M�dia < 7 e presen�a < 75%= EXAME, Media <=3 e presen�a < 75% = REPROVADO', '1. Programa��o para Web, 2. Frameworks Web, 3.Acesso a Banco de Dados e Sistemas Web, 4.Engenharia Web '),
(2, '2015-07-10', '2015-07-28', 2, 2, 2015, 2, 'B', 2, 'Tradicional', 'Computador, dicion�rio', 'Media >= 7 e 75% de presen�a = APROVADO, M�dia < 7 e presen�a < 75%= EXAME, Media <=3 e presen�a < 75% = REPROVADO', null),
(3, '2017-01-02', '2017-02-02', 3, 3, 2017, 1, 'C', 3, 'Tradicional', 'Computador, programa SQL', 'Media >= 7 e 75% de presen�a = APROVADO, M�dia < 7 e presen�a < 75%= EXAME, Media <=3 e presen�a < 75% = REPROVADO', null),
(4, '2015-02-04', '2018-10-05', 4, 4, 2018, 1, 'D', 4, 'Tradicional', 'Computador, biblioteca', 'Media >= 7 e 75% de presen�a = APROVADO, M�dia < 7 e presen�a < 75%= EXAME, Media <=3 e presen�a < 75% = REPROVADO', '1.Conceitos,2.Gera��o de valor para o cliente, 3. Empreendorismo, 4. Mercados Novos e Diferenciados'),
(5, '2014-10-06', '2014-11-06', 5, 5, 2014, 2, 'E', 5, 'Tradicional', 'Computador, cabeamento, biblioteca', 'Media >= 7 e 75% de presen�a = APROVADO, M�dia < 7 e presen�a < 75%= EXAME, Media <=3 e presen�a < 75% = REPROVADO', '1. Comunica��o de  Dados, 2. Conceitos e evolu��o hist�rica,3. Conceitos de Redes e Computadores, 4. Tipos e classifica��es');
GO

insert into Mensagem(IdAluno, IdProfessor, Assunto, Referencia, Conteudo, Status, DtEnvio, DtResposta, Resposta)
values (1, 2, 'Atividade', 'AC 01', 'Gostaria de saber se a AC 01 pode ser feita em grupo','Enviado','2018-05-21',null,null),
(2, 2, 'Nota', 'Banco de Dados', ' Boa tarde. Quando ser� lan�ado as notas das atividades?','Respondido','2017-08-12','2017-09-12','Provavalmente na pr�xima aula as notas estar�o no portal'),
(3, 3, 'Falta','Tecnologia Web', ' Como posso recuperar a minha falta da aula passada?', 'Lido', '2018-01-16',null,null),
(4, 4, 'Trabalho', 'Linguagem de Programa��o II', 'Gostaria de saber qual � o prazo limite para a entrega do trabalho', 'Enviado', '2017-11-20',null,null),
(5, 5, 'Mudan�a de Turno', 'Engenharia de Software', ' Mudei de turno, e preciso que minhas notas sejam passadas ao novo professor. Como devo proceder?','Respondido','2015-02-10','2015-02-11',' Esse procedimento � feito na secretaria da faculdade');
GO

Insert into  Atividade(Titulo,  Descricao , Conteudo  ,  Tipo, Extras ,  IdProfessor)

Values('Historia do hadware'  ,'O aluno devera  fazer um breve resumo da historia do hardware desde os percursores ate os tempos atuais , mostrando seus avan�os e conquistas para tecnologia',   'percusores ,historia ,evolu��o ,vantagens ',  'Aberta',  'www.canaltech.com.br', 1),

('Atividade modulos', 'Atividade de linguagem de programa�ao II ', 'Impota�ao absoluta,atributo de um modulo,importa��o relativa,criando um modulo', 'Teste' ,  'www.clubedaprogramacao.com', 2),

('AS vantagens da engenharia de software ',  'Atividade complementar em turma', 'Tecnologias da engenharia de software,as vantagens e desvantages ,o uso  da engenharia de software','Aberta', null , 3),

('Ferramentas open souce para o desenvolvimento de software', 'Pesquisar ferramentas open souce ultilizadas  no desenvolvimentop de software', 'ferramentas open souce ,suas vantagens e desvantagens','Aberta', null, 4),

('A seguran�a de dados', 'Como implatar um sistema de dados e proteg�lo-lo', 'Sistemas, prote��o', 'Aberta', null, 5);
GO
 

Insert into AtividadeVinculada(IdAtividade,IdProfessor,IdDisciplinaOfertada,Rotulo,Status,DtInicioRespostas,DtFimRespostas)
values (1, 1, 1, 'AC1','Disponibilizada', '2018-04-05', '2018-04-10'),
		(2, 2, 2, 'AC1','Aberta', '20180403', '2018-04-07'),
		(3, 3, 3, 'AC1', 'Disponibilizada','2018-04-07','2018-04-10'),
		(4, 4, 4,'AC2', 'Aberta','20180405','2018-04-11'),
		(5, 5, 5,'AC2','aberta','20180407','2018-04-09');
GO

INSERT INTO Entrega(IdAluno, IdAtividadeVinculada, Titulo, Resposta, DtEntrega, Status, IdProfessor, Nota, DtAvaliacao, Obs)
VALUES (1, 1, 'Linguargem de programa��o II', 'm�todo padronizado para comunicar instru��es para um computador', '2018-04-10', 'Entregue', 1, 10, '2018-04-26', 'Parab�ns!'),
(2, 2, 'Engenharia de Software', '� uma �rea da computa��o voltada � especifica��o, desenvolvimento, manuten��o e cria��o de softwareo', '2018-04-10', 'Corrigido', 2, 10, '2018-11-27', 'Parab�ns!'),
(3, 3, 'Linguagem SQL', 'Manipula��o de dados', '2018-04-10', 'Entregue', 3, 10, '2018-04-28', 'Parab�ns!'),
(4, 4, 'Tecnologia Web', '� a linguagem usada para descrever e definir o conte�do de uma p�gina Web em um formato estruturado', '2018-04-10', 'Corrigido', 4, 10, '2018-04-29', 'Parab�ns!'),
(5, 5, 'Ambiente de Desenvolvimento e Opera��o', 'permite que os aplicativos provisionem seus pr�prios ambientes operacionais', '2018-04-10', 'Entregue', 5, 10, '2018-04-30', 'Parab�ns!');
GO

INSERT INTO SolicitacaoMatricula(IdAluno,IdDisciplinaOfertada,DtSolicitacao,IdCoordenador)
VALUES(1,1,'2018-02-01',1),(2,2,'2018-05-04',2),(3,3,'2018-07-06',3),(4,4,'2018-05-08',4),(5,5,'2018-06-26',5);
GO

