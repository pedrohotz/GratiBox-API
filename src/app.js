import express from 'express';
import cors from 'cors';
import register from './controllers/register.js';
import login from './controllers/login.js';

const app = express();
app.use(cors());

app.use(express.json());

app.post('/sign-up', register);
app.post('/sign-in', login);
export default app;
