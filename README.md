# Plataforma de Gestão de Cuidados para Idosos e Familiares

## Informações do Aluno
- **Nome:** Victor André Lopes Brasileiro  
- **Matrícula:** 202407269  
- **Curso:** Ciência da Computação

---

## Descrição do Projeto

Sistema desenvolvido para auxiliar na gestão de cuidados domiciliares de pessoas idosas, organizando agendamentos, cadastro de cuidadores e responsáveis, além de facilitar o acompanhamento e a comunicação entre todos os envolvidos.

O objetivo é centralizar informações de idosos, registros de atendimentos e escalas dos cuidadores, promovendo mais transparência, organização e segurança para as famílias.

---

## Funcionalidades Principais

- Cadastro de usuários com perfil de cuidador ou familiar
- Cadastro de idosos (dados pessoais, contato de emergência)
- Cadastro de cuidadores (especialidade, disponibilidade, contato)
- Registro e edição/cancelamento de agendamentos de visitas
- Consulta ao histórico de atendimentos por idoso
- Visualização de visitas e agendamentos pelos familiares responsáveis
- Feedback para cuidadores (nota e comentário)
- Filtros por data, cuidador ou idoso
- Relatórios de visitas agendadas/realizadas, com filtros por período e profissional

---

## Modelagem e Normalização

O projeto segue um modelo relacional, incluindo as seguintes entidades principais: `Idoso`, `Responsável`, `Cuidador`, `Agendamento`, `Avaliação` e tabelas auxiliares para endereços e contatos.

O banco foi normalizado até a 4FN/BCNF para evitar redundâncias e garantir integridade dos dados.  
Confira o diagrama MER e o modelo lógico [aqui](https://dbdiagram.io/d/682741d81227bdcb4ea5f554).

> **Obs.:** Tabelas como endereço e contato se repetem para cada tipo (idoso, cuidador, responsável) por causa dos relacionamentos, mas podem ser unificadas em versões futuras.

---

## SQL e Operações

- Todas as tabelas, constraints e operações estão no arquivo `dump.sql`.
- O repositório traz exemplos de inserção, atualização, remoção, consultas JOIN, agregações, ordenações e subconsultas.
- Exemplos completos no arquivo `consultas.sql` e na documentação.

---

## Considerações Finais

O sistema é uma base sólida, totalmente documentada e normalizada, pronta para ser evoluída em futuras versões (ex: aplicação web/mobile, API etc).  
Agradecimentos à professora, ao monitor e aos colegas pelo apoio durante a disciplina.

---

## Repositório

Acesse o projeto completo:
[https://github.com/VictorBrasileiroo/Projeto-BD-AB2](https://github.com/VictorBrasileiroo/Projeto-BD-AB2)

