USE LMS;

SELECT c.Nome AS Curso, d.Nome AS Disciplina,
p.Nome AS Professor FROM DisciplinaOfertada dof
JOIN Disciplina d ON dof.IdDisciplina = d.ID
JOIN Curso c ON dof.IdCurso = c.ID
JOIN Professor p ON dof.IdCoordenador = p.ID
WHERE d.Status = 'Aberta'
ORDER BY Curso, Professor;

SELECT a.Nome AS Aluno, d.Nome AS Disciplina, 
c.Nome AS Curso FROM SolicitacaoMatricula sm
JOIN Aluno a ON sm.IdAluno = a.ID
JOIN DisciplinaOfertada dof ON sm.IdDisciplinaOfertada = dof.ID
JOIN Disciplina d ON dof.IdDisciplina = d.ID
JOIN Curso c ON dof.IdCurso = c.ID
ORDER BY Aluno, Curso, Disciplina

SELECT p.Nome AS Professor, d.Nome AS Disciplina
FROM DisciplinaOfertada dof
JOIN Disciplina d ON dof.IdDisciplina = d.ID
JOIN Professor p ON dof.IdProfessor = p.ID
WHERE IdProfessor IS NULL

SELECT DISTINCT IdAluno, IdAtividadeVinculada, Status
FROM dbo.Entrega
INNER JOIN DisciplinaOfertada
ON Entrega.IdAtividadeVinculada = IdAtividadeVinculada
WHERE Entrega.Status LIKE 'E%';

SELECT DISTINCT B.IdProfessor, B.IdAtividadeVinculada, B.Status
FROM dbo.Entrega AS B
INNER JOIN dbo.Entrega AS J
ON B.Status = J.Status
WHERE J.Status LIKE 'C%';

SELECT c.Nome as Curso, d.Nome as Disciplina
FROM DisciplinaOfertada as do JOIN Curso as c
ON c.ID = do.IdCurso
JOIN Disciplina as d
ON d.ID = do.IdDisciplina

SELECT a.Titulo, a.Descricao, p.Nome as Professor
FROM Atividade as a JOIN Professor as p
ON a.IdProfessor = p.ID