CREATE TYPE status_type AS ENUM ('Pendente', 'Chamando', 'Atendendo', 'Finalizado');

CREATE TYPE role_type AS ENUM ('Atendente', 'Supervisor');

CREATE TYPE section_type AS ENUM ('Seção 1', 'Seção 2', 'Seção 3');

CREATE TYPE priority_type AS ENUM ('Comum', 'Prioritário');

CREATE TABLE ticket (
    id SERIAL,
    code VARCHAR(20) NOT NULL,
    priority priority_type NOT NULL DEFAULT 'Comum',
    status status_type NOT NULL DEFAULT 'Pendente',
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    section section_type NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE attendant (
    document VARCHAR(15) NOT NULL,
    name VARCHAR(44) NOT NULL,
    role role_type NOT NULL DEFAULT 'Atendente',
    PRIMARY_KEY (email)
);