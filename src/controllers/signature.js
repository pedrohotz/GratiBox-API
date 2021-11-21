import connection from '../../database/database.js';
import { signatureValidation } from '../validation/validation.js';

// eslint-disable-next-line consistent-return
async function postSignature(req, res) {
  const {
    planId,
    deliveryId,
    products,
    signDate,
    fullName,
    adress,
    cep,
    city,
    state,
  } = req.body;
  const productsString = products.join(',');
  const errors = signatureValidation.validate({
    planId,
    deliveryId,
    productsString,
    signDate,
    fullName,
    adress,
    cep,
    city,
    state,
  }).error;
  if (errors) {
    console.log(errors);
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
      await connection.query('UPDATE signature SET plan_id = $1,delivery_type_id = $2,products = $3,sign_date = $4 WHERE user_id = $5', [planId, deliveryId, productsString, signDate, userId]);
      return res.sendStatus(201);
    }

    await connection.query('INSERT INTO signature (user_id,plan_id,delivery_type_id,products,sign_date) VALUES ($1,$2,$3,$4,$5)', [userId, planId, deliveryId, productsString, signDate]);
    await connection.query('INSERT INTO adress (user_id,endereco,cep,cidade,estado,name) VALUES ($1,$2,$3,$4,$5,$6)', [userId, adress, cep, city, state, fullName]);
    res.sendStatus(201);
  } catch (error) {
    console.log(error);
    return res.sendStatus(500);
  }
}

export default postSignature;
