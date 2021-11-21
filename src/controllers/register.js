import bcrypt from 'bcrypt';
import connection from '../../database/database.js';

// eslint-disable-next-line consistent-return
async function register(req, res) {
  const {
    name,
    email,
    password,
  } = req.body;

  const user = await connection.query('SELECT * FROM users WHERE email = $1', [email]);

  if (user.rowCount > 0) {
    return res.sendStatus(400);
  }
  try {
    const hash = bcrypt.hashSync(password, 12);
    await connection.query('INSERT INTO users (name,email,password) VALUES ($1,$2,$3)', [name, email, hash]);
    res.sendStatus(201);
  } catch (error) {
    console.log(error);
    res.sendStatus(500);
  }
}

export {
  // eslint-disable-next-line import/prefer-default-export
  register,
};
