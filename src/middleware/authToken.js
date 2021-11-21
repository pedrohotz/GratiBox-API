import connection from '../../database/database.js';

// eslint-disable-next-line consistent-return
async function authToken(req, res, next) {
  const { authorization } = req.headers;
  const token = authorization?.split('Bearer ')[1];
  try {
    const session = await connection.query('SELECT * FROM sessions WHERE TOKEN = $1', [token]);

    if (session.rowCount === 0) {
      return res.sendStatus(401);
    }
  } catch (error) {
    res.sendStatus(500);
  }
  next();
}

export default authToken;
