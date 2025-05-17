USE gestao_de_cuidados_idosos;

CREATE TABLE Responsavel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(256) NOT NULL,
    parentesco VARCHAR(256) NOT NULL,
    email VARCHAR(256)
);

CREATE TABLE Endereco_Responsavel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cep VARCHAR(9),
    cidade VARCHAR(256),
    bairro VARCHAR(256),
    id_responsavel INT,
    FOREIGN KEY (id_responsavel) REFERENCES Responsavel(id)
);

CREATE TABLE Contato_Responsavel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    telefone VARCHAR(20),
    id_responsavel INT,
    FOREIGN KEY (id_responsavel) REFERENCES Responsavel(id)
);
    
CREATE TABLE Idoso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(256) NOT NULL,
    data_nascimento DATE NOT NULL,
    sexo VARCHAR(256) NOT NULL,
    telefone_emergencia VARCHAR(20),
    id_responsavel INT,
    FOREIGN KEY (id_responsavel) REFERENCES Responsavel(id)
);

CREATE TABLE Endereco_Idoso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cep VARCHAR(9),
    cidade VARCHAR(256),
    bairro VARCHAR(256),
    id_idoso INT,
    FOREIGN KEY (id_idoso) REFERENCES Idoso(id)
);

CREATE TABLE Cuidador (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(256) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    registro_profissional VARCHAR(256) NOT NULL,
    email VARCHAR(256)
);

CREATE TABLE Especialidade_Cuidador (
    id INT AUTO_INCREMENT PRIMARY KEY,
    especialidade VARCHAR(256),
    id_cuidador INT,
    FOREIGN KEY (id_cuidador) REFERENCES Cuidador(id)
);

CREATE TABLE Disponibilidade_Cuidador (
    id INT AUTO_INCREMENT PRIMARY KEY,
    dia_semana VARCHAR(15),
    hora_inicio TIME,
    hora_fim TIME,
    id_cuidador INT,
    FOREIGN KEY (id_cuidador) REFERENCES Cuidador(id)
);

CREATE TABLE Contato_Cuidador (
    id INT AUTO_INCREMENT PRIMARY KEY,
    telefone VARCHAR(20),
    id_cuidador INT,
    FOREIGN KEY (id_cuidador) REFERENCES Cuidador(id)
);

CREATE TABLE Endereco_Cuidador (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cep VARCHAR(9),
    cidade VARCHAR(256),
    bairro VARCHAR(256),
    id_cuidador INT,
    FOREIGN KEY (id_cuidador) REFERENCES Cuidador(id)
);

CREATE TABLE Agendamento (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_hora_inicio DATETIME NOT NULL,
    data_hora_fim DATETIME NOT NULL,
    tipo VARCHAR(20),
    status_consulta VARCHAR(20),
    id_cuidador INT,
    id_idoso INT,
    FOREIGN KEY (id_cuidador) REFERENCES Cuidador(id),
    FOREIGN KEY (id_idoso) REFERENCES Idoso(id)
);

CREATE TABLE Avaliacao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATETIME NOT NULL,
    nota INT NOT NULL,
    comentario VARCHAR(256),
    id_cuidador INT,
    id_responsavel INT,
    FOREIGN KEY (id_cuidador) REFERENCES Cuidador(id),
    FOREIGN KEY (id_responsavel) REFERENCES Responsavel(id)
);
