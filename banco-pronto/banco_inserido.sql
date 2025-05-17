USE gestao_de_cuidados_idosos;

-- ===========================================
-- 1. INSERÇÃO DE DADOS (INSERT)
-- ===========================================

-- INSERÇÃO DE RESPONSÁVEIS
INSERT INTO Responsavel (nome, parentesco, email) VALUES ('João Marques', 'Filho', 'joao@joao.com');
INSERT INTO Responsavel (nome, parentesco, email) VALUES ('Maria José', 'Esposa', 'maria@maria.com');
INSERT INTO Responsavel (nome, parentesco, email) VALUES ('Pedro Silva', 'Neto', 'pedro@familia.com');
INSERT INTO Responsavel (nome, parentesco, email) VALUES ('Carla Teles', 'Filha', 'carla@teles.com');

-- INSERÇÃO DE CONTATOS DE RESPONSÁVEIS
INSERT INTO Contato_Responsavel (telefone, id_responsavel) VALUES ('82999993231', 1);
INSERT INTO Contato_Responsavel (telefone, id_responsavel) VALUES ('82223321311', 3);
INSERT INTO Contato_Responsavel (telefone, id_responsavel) VALUES ('82988887777', 4);
INSERT INTO Contato_Responsavel (telefone, id_responsavel) VALUES ('82999991111', 4);

-- INSERÇÃO DE ENDEREÇOS DE RESPONSÁVEIS
INSERT INTO Endereco_Responsavel (cep, cidade, bairro, id_responsavel) VALUES ('57044-878', 'Maceió', 'Barro Duro', 1);
INSERT INTO Endereco_Responsavel (cep, cidade, bairro, id_responsavel) VALUES ('17224-878', 'Recife', 'Nova Hortalândia', 3);
INSERT INTO Endereco_Responsavel (cep, cidade, bairro, id_responsavel) VALUES ('57030-000', 'Maceió', 'Ponta Verde', 5);
INSERT INTO Endereco_Responsavel (cep, cidade, bairro, id_responsavel) VALUES ('57025-070', 'Maceió', 'Pajuçara', 4);

-- INSERÇÃO DE CUIDADORES
INSERT INTO Cuidador (nome, cpf, registro_profissional, email) VALUES ('Matheus Cabral', '000.000.000-00', '1231422-12', 'matheus@gmail.com');
INSERT INTO Cuidador (nome, cpf, registro_profissional, email) VALUES ('Eliana Ramos', '123.456.789-10', '3221561-15', 'eliana@gmail.com');

-- INSERÇÃO DE ENDEREÇOS DE CUIDADORES
INSERT INTO Endereco_Cuidador (cep, cidade, bairro, id_cuidador) VALUES ('19864-821', 'Murici', 'Ouro Branco', 1);
INSERT INTO Endereco_Cuidador (cep, cidade, bairro, id_cuidador) VALUES ('57038-111', 'Maceió', 'Jatiúca', 3);

-- INSERÇÃO DE CONTATOS DE CUIDADORES
INSERT INTO Contato_Cuidador (telefone, id_cuidador) VALUES ('82222293211', 1);
INSERT INTO Contato_Cuidador (telefone, id_cuidador) VALUES ('82988884444', 3);

-- INSERÇÃO DE ESPECIALIDADES DE CUIDADORES
INSERT INTO Especialidade_Cuidador (especialidade, id_cuidador) VALUES ('Enfermagem Dermatológica', 1);
INSERT INTO Especialidade_Cuidador (especialidade, id_cuidador) VALUES ('Enfermagem em Assistência Domiciliária', 1);
INSERT INTO Especialidade_Cuidador (especialidade, id_cuidador) VALUES ('Fisioterapia', 3);

-- INSERÇÃO DE DISPONIBILIDADE DE CUIDADORES
INSERT INTO Disponibilidade_Cuidador (dia_semana, hora_inicio, hora_fim, id_cuidador) VALUES ('Segunda-feira','07:30:00','20:30:00', 1);
INSERT INTO Disponibilidade_Cuidador (dia_semana, hora_inicio, hora_fim, id_cuidador) VALUES ('Quarta-feira','07:30:00','20:30:00', 1);
INSERT INTO Disponibilidade_Cuidador (dia_semana, hora_inicio, hora_fim, id_cuidador) VALUES ('Sexta-feira','09:30:00','17:00:00', 1);
INSERT INTO Disponibilidade_Cuidador (dia_semana, hora_inicio, hora_fim, id_cuidador) VALUES ('Terça-feira', '08:00:00', '18:00:00', 3);

-- INSERÇÃO DE IDOSOS
INSERT INTO Idoso (nome, data_nascimento, sexo, telefone_emergencia, id_responsavel) VALUES ('Aldo Alvez', '1969-12-02', 'Masculino' ,'82998213221', 1);
INSERT INTO Idoso (nome, data_nascimento, sexo, telefone_emergencia, id_responsavel) VALUES ('Marcio Luiz', '1932-11-22', 'Masculino' ,'82933213221', 3);
INSERT INTO Idoso (nome, data_nascimento, sexo, telefone_emergencia, id_responsavel) VALUES ('Celina Alves', '1953-05-20', 'Feminino', '82993334444', 4);

-- INSERÇÃO DE ENDEREÇOS DE IDOSOS
INSERT INTO Endereco_Idoso (cep, cidade, bairro, id_idoso) VALUES ('57044-878', 'Maceió', 'Barro Duro', 1);
INSERT INTO Endereco_Idoso (cep, cidade, bairro, id_idoso) VALUES ('17224-878', 'Recife', 'Nova Hortalândia', 5);
INSERT INTO Endereco_Idoso (cep, cidade, bairro, id_idoso) VALUES ('57038-111', 'Maceió', 'Jatiúca', 6);

-- INSERÇÃO DE AGENDAMENTOS
INSERT INTO Agendamento (data_hora_inicio, data_hora_fim, tipo, status_consulta, id_cuidador, id_idoso)
  VALUES ('2025-05-18 09:00:00','2025-05-19 09:00:00','Diária Completa','Pendente',1,1);
INSERT INTO Agendamento (data_hora_inicio, data_hora_fim, tipo, status_consulta, id_cuidador, id_idoso)
  VALUES ('2025-04-28 09:00:00','2025-04-29 09:00:00','Diária Completa','Concluido',1,5);
INSERT INTO Agendamento (data_hora_inicio, data_hora_fim, tipo, status_consulta, id_cuidador, id_idoso)
  VALUES ('2025-06-01 13:00:00','2025-06-01 18:00:00','Meio Período','Pendente',3,6);

-- INSERÇÃO DE AVALIAÇÕES
INSERT INTO Avaliacao (data, nota, comentario, id_cuidador, id_responsavel)
  VALUES ('2025-04-18 09:00:00', 5, 'Ótima profissional' , 1, 3);
INSERT INTO Avaliacao (data, nota, comentario, id_cuidador, id_responsavel)
  VALUES ('2025-06-01 19:00:00', 4, 'Muito atenciosa', 3, 4);

-- ===========================================
-- 2. REMOÇÃO DE DADOS (DELETE)
-- ===========================================

DELETE FROM Agendamento WHERE id = 4;
DELETE FROM Endereco_Idoso WHERE id = 4;
DELETE FROM Idoso WHERE id = 6;

-- ===========================================
-- 3. ATUALIZAÇÃO DE DADOS (UPDATE)
-- ===========================================

UPDATE Cuidador SET email = 'elina@eliana.com' WHERE id = 3;
UPDATE Responsavel SET parentesco = 'Sobrinha' WHERE id = 7;
