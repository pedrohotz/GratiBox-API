import express from 'express';
import cors from 'cors';
import register from './controllers/register.js';
import login from './controllers/login.js';
import { postSignature, getSignature } from './controllers/signature.js';
import authToken from './middleware/authToken.js';

const app = express();
app.use(cors());

app.use(express.json());

app.post('/sign-up', register);
app.post('/sign-in', login);
app.post('/signature', authToken, postSignature);
app.get('/signature', authToken, getSignature);
export default app;
