import { Pool } from 'pg';
import dotenv from 'dotenv';

dotenv.config();

const pool = new Pool({
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    host: "localhost",
    database: process.env.DB_NAME,
    port: 5432,
    max: 10, //máximo de conexões
    idleTimeoutMillis: 3000 //tempo que conexão pode ficar inativa até ser fechada
});

pool.on('connect', () => {
    console.log("Connected with db");
});

pool.on('error', (error) => {
    console.log("Error to connect", error);
});

export default pool;