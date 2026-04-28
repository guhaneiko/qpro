CREATE TYPE status_type AS ENUM ('Pendente', 'Chamando', 'Atendendo', 'Finalizado');

CREATE TYPE role_type AS ENUM ('Atendente', 'Supervisor');

CREATE TYPE type AS ENUM ('1', '2', '3');

CREATE TYPE ticket_type AS ENUM ('Comum', 'Prioritário');

CREATE TABLE ticket (
    id SERIAL,
    weight INT NOT NULL, --calcular ticket na inserção
    priority priority_type NOT NULL DEFAULT 'Comum',
    status status_type NOT NULL DEFAULT 'Pendente',
    created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    type ticket_type NOT NULL,
    PRIMARY KEY(id)
);
-- o service pegará priority[0] + section + (id mod 100) pra montar o código do ticket.

-- calcular peso na inserção do ticket, guardar no banco e na hora de puxar, pegar os 
-- com maior peso de cada tipo prioritário (priority). 

CREATE TABLE attendant (
    document VARCHAR(15) NOT NULL,
    name VARCHAR(44) NOT NULL,
    role role_type NOT NULL DEFAULT 'Atendente',
    PRIMARY_KEY (email)
);