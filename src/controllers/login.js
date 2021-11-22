import bcrypt from 'bcrypt';
import { v4 as uuid } from 'uuid';
import connection from '../../database/database.js';
import { loginValidation } from '../validation/validation.js';
// eslint-disable-next-line consistent-return
async function login(req, res) {
  const {
    email,
    password,
  } = req.body;

  const erros = loginValidation.validate({
    email,
    password,
  }).error;

  if (erros) {
    return res.sendStatus(400);
  }
  try {
    const user = await connection.query('SELECT * FROM users WHERE email = $1', [email]);
    if (user.rowCount === 0) {
      return res.sendStatus(404);
    }
    const encryptedPass = user.rows[0].password;
    const matchPass = bcrypt.compareSync(password, encryptedPass);
    if (!matchPass) {
      return res.sendStatus(401);
    }
    const token = uuid();
    await connection.query('INSERT INTO sessions (user_id,token) VALUES ($1,$2)', [user.rows[0].id, token]);
    const userName = user.rows[0].name;
    const existentSignature = await connection.query('SELECT * FROM signature WHERE user_id = $1', [user.rows[0].id]);
    if (existentSignature.rowCount === 0) {
      res.send({
        name: userName,
        token,
      });
    } else {
      res.send({
        name: userName,
        token,
      });
    }
  } catch (error) {
    return res.sendStatus(500);
  }
}

export default login;
