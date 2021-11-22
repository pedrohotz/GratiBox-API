import connection from '../../database/database.js';
import { signatureValidation } from '../validation/validation.js';

// eslint-disable-next-line consistent-return
async function postSignature(req, res) {
  const {
    planId,
    products,
    signDate,
    deliveryDay,
    fullName,
    adress,
    cep,
    city,
    state,
  } = req.body;
  const productsString = products.join(',');
  const errors = signatureValidation.validate({
    planId,
    productsString,
    signDate,
    deliveryDay,
    fullName,
    adress,
    cep,
    city,
    state,
  }).error;
  if (errors) {
    return res.sendStatus(400);
  }
  const { authorization } = req.headers;
  const token = authorization.split('Bearer ')[1];

  try {
    const session = await connection.query('SELECT * FROM sessions WHERE token = $1', [token]);
    if (session.rowCount === 0) {
      return res.sendStatus(409);
    }
    const userId = session.rows[0].user_id;
    const existentSignature = await connection.query('SELECT * FROM signature WHERE user_id = $1', [userId]);
    if (existentSignature.rowCount === 1) {
      await connection.query('UPDATE signature SET plan_id = $1,products = $2,sign_date = $3, delivery_day = $4 WHERE user_id = $5', [planId, productsString, signDate, deliveryDay, userId]);
      return res.sendStatus(201);
    }

    await connection.query('INSERT INTO signature (user_id,plan_id,products,sign_date,delivery_day) VALUES ($1,$2,$3,$4,$5)', [userId, planId, productsString, signDate, deliveryDay]);
    await connection.query('INSERT INTO adress (user_id,endereco,cep,cidade,estado,name) VALUES ($1,$2,$3,$4,$5,$6)', [userId, adress, cep, city, state, fullName]);
    res.sendStatus(201);
  } catch (error) {
    return res.sendStatus(500);
  }
}

// eslint-disable-next-line consistent-return
async function getSignature(req, res) {
  const { authorization } = req.headers;
  const token = authorization.split('Bearer ')[1];
  const user = await connection.query('SELECT * FROM sessions WHERE token = $1', [token]);
  const userId = user.rows[0].user_id;

  const signature = await connection.query('SELECT plan_id,products,sign_date,delivery_day FROM signature WHERE user_id = $1', [userId]);
  if (signature.rowCount === 0) {
    return res.sendStatus(404);
  }
  res.send(signature.rows[0]);
}

export {
  postSignature,
  getSignature,
};
