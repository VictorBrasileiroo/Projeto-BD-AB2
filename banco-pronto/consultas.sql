USE gestao_de_cuidados_idosos;

-- 1. Listar todas as informações dos idosos
SELECT * FROM idoso;

-- 2. Listar todos os idosos e seus responsaveis
SELECT 
  idoso.nome as nome_idoso, 
  responsavel.nome as nome_responsavel, 
  responsavel.parentesco as parentesco_responsavel
  FROM idoso
  INNER JOIN responsavel ON idoso.id_responsavel = responsavel.id;
        
-- 3. Listar todos os cuidadores e seus contatos
SELECT 
  cuidador.nome as nome_cuidador, 
  contato_cuidador.telefone as contato_cuidador	
  FROM cuidador
  LEFT JOIN contato_cuidador ON cuidador.id = contato_cuidador.id_cuidador;
        
-- 4. Listar apenas os agendamentos que já foram concluídos
SELECT 
  agendamento.data_hora_fim as horario_finalizacao_consulta, 
  idoso.nome as nome_idoso, 
  cuidador.nome as nome_cuidador
  FROM agendamento
  INNER JOIN idoso ON agendamento.id_idoso = idoso.id
  INNER JOIN cuidador ON agendamento.id_cuidador = cuidador.id
  WHERE agendamento.status_consulta = 'Concluido';

-- 5. Listar cuidadores e suas especializações
SELECT 
  cuidador.nome as nome_cuidador, 
  especialidade_cuidador.especialidade as especializacao
  FROM cuidador
  INNER JOIN especialidade_cuidador ON cuidador.id = especialidade_cuidador.id_cuidador;

-- 6. Listar todos os idosos e agendamentos
SELECT 
  idoso.nome as nome_idoso, 
  agendamento.data_hora_inicio, 
  agendamento.status_consulta
  FROM idoso
  LEFT JOIN agendamento ON idoso.id = agendamento.id_idoso;
        
-- 7. Listar responsaveis e endereços
SELECT
  responsavel.nome as nome_responsavel, 
  endereco_responsavel.cidade, 
  endereco_responsavel.bairro
  FROM endereco_responsavel
  RIGHT JOIN responsavel ON endereco_responsavel.id_responsavel = responsavel.id;

-- 8. Listar cuidadores e endereços
SELECT 
  cuidador.nome as nome_cuidador, 
  endereco_cuidador.cidade, 
  endereco_cuidador.bairro
  FROM endereco_cuidador
  RIGHT JOIN cuidador ON endereco_cuidador.id_cuidador = cuidador.id;

-- 9. Listar avaliacoes que possuem nota acima de 3.0
SELECT * 
  FROM avaliacao 
  WHERE nota >= 3;
            
-- 10. Listar todas as avaliações e as informações dos idoso e responsaveis
SELECT 
  avaliacao.id, 
  avaliacao.nota, 
  cuidador.nome AS nome_cuidador, 
  cuidador.registro_profissional as registro_cuidador, 
  responsavel.nome AS nome_responsavel
  FROM avaliacao
  INNER JOIN cuidador ON avaliacao.id_cuidador = cuidador.id
  INNER JOIN responsavel ON avaliacao.id_responsavel = responsavel.id;

-- 1. Total de cuidadores cadastrados
SELECT COUNT(*) as total_cuidadores FROM cuidador;   

-- 2. Total de idosos cadastrados
SELECT COUNT(*) as total_idosos FROM idoso;   

-- 3. Média das notas de avaliações
SELECT AVG(nota) as media_nota FROM avaliacao;    

-- 4. Média das idades dos idosos
SELECT AVG(YEAR(CURDATE()) - YEAR(data_nascimento)) as media_idade FROM idoso;   

-- 5. Total de agendamentos pendentes
SELECT COUNT(*) as total_pendentes FROM agendamento WHERE status_consulta = 'Pendente';   

-- 6. Maior e menor nota das avaliacoes
SELECT MAX(nota) as nota_maxima, MIN(nota) as nota_minima FROM avaliacao;

-- 7. Total de avaliações
SELECT COUNT(*) as total_avaliacoes FROM avaliacao;

-- 8. Total de contatos de responsaveis cadastrados
SELECT COUNT(*) FROM contato_responsavel;    

-- 9. Total de responsaveis
SELECT COUNT(*) FROM responsavel;   

-- 10. total de endereços de idosos cadastrados
SELECT COUNT(*) FROM endereco_idoso;

-- 1. Quantidade de avaliações por cuidador
SELECT id_cuidador, count(*) as total_avaliacoes
  FROM avaliacao
  GROUP BY id_cuidador;

-- 2. Média de notas por cuidador
SELECT id_cuidador, avg(nota) as media_nota
  FROM avaliacao
  GROUP BY id_cuidador;

-- 3. Quantidade de agendamentos por status --> ordenando do maior para o menor 
SELECT status_consulta, count(*) as total_agendamentos
  FROM agendamento
  GROUP BY status_consulta
  ORDER BY total_agendamentos DESC;

-- 4. Cuidadores ordenados por nome
SELECT * FROM cuidador
  ORDER BY nome ASC;

-- 5. Idosos ordenados por idade
SELECT * FROM idoso
  ORDER BY data_nascimento ASC;

-- 6. Cuidadores que possuem mais de uma especialização
SELECT id_cuidador, count(*) as total_especialidades
  FROM especialidade_cuidador
  GROUP BY id_cuidador
  HAVING count(*) > 1;

-- 7. 5 idosos mais novos
SELECT * FROM idoso
  ORDER BY data_nascimento DESC
  LIMIT 5;

-- 8. Média das notas ordenadas
SELECT id_cuidador, avg(nota) as media_nota
  FROM avaliacao
  GROUP BY id_cuidador
  ORDER BY media_nota DESC;

-- 9. Total de contatos cadastrados dos cuidadores ordenados
SELECT id_cuidador, count(*) as total_contatos
  FROM contato_cuidador
  GROUP BY id_cuidador
  ORDER BY total_contatos DESC;

-- 10. Agendamentos ordenados por data de inicio
SELECT * FROM agendamento
  ORDER BY data_hora_inicio ASC;

-- 1. Listar cuidadores que possuem avaliações
SELECT * FROM cuidador
  WHERE id in (SELECT id_cuidador FROM avaliacao);

-- 2. Listar responsáveis que possuem mais de um idoso
SELECT * FROM responsavel
  WHERE id in (
      SELECT id_responsavel FROM idoso
      GROUP BY id_responsavel
      HAVING count(*) > 1
  );

-- 3. Listar idosos que não têm agendamento
SELECT * FROM idoso i
  WHERE NOT EXISTS (
      SELECT 1 FROM agendamento a
      WHERE a.id_idoso = i.id
  );

-- 4. Listar cuidadores que nunca receberam avaliação
SELECT * FROM cuidador
  WHERE id NOT IN (SELECT id_cuidador FROM avaliacao);

-- 5. Listar agendamentos que receberam nota 5
SELECT * FROM agendamento
  WHERE id_idoso in (
      SELECT id_idoso FROM avaliacao
      WHERE nota = (SELECT max(nota) FROM avaliacao)
  );

-- 6. Listar responsáveis que já avaliaram algum cuidador
SELECT distinct r.*
  FROM responsavel r
  WHERE EXISTS (
      SELECT 1 FROM avaliacao a
      WHERE a.id_responsavel = r.id and a.id_cuidador = 1
  );

-- 7. Listar cuidadores que tem mais de uma especialidade 
SELECT * FROM cuidador
  WHERE id in (
      SELECT id_cuidador FROM especialidade_cuidador
      GROUP BY id_cuidador
      HAVING count(*) > 1
  );

-- 8. Listar todos os idosos que moram nos bairros dos cuidadores
SELECT * FROM idoso
  WHERE id in (
      SELECT e.id_idoso FROM endereco_idoso e
      WHERE e.bairro in (
          SELECT ec.bairro FROM endereco_cuidador ec
      )
  );

-- 9. Listar cuidadores que tem mais de um agendamento concluído 
SELECT * FROM cuidador c
  WHERE EXISTS (
      SELECT 1 FROM agendamento a
      WHERE a.id_cuidador = c.id and a.status_consulta = 'concluido'
  );

-- 10. Listar responsáveis que nunca cadastraram contato
SELECT * FROM responsavel r
  WHERE NOT EXISTS (
      SELECT 1 FROM contato_responsavel cr
      WHERE cr.id_responsavel = r.id
  );
