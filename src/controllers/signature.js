import connection from '../../database/database';
import { signatureValidation } from '../validation/validation.js';

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

  const errors = signatureValidation.validate({
    planId,
    deliveryId,
    products,
    signDate,
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
    await connection.query('INSERT INTO signatures (user_id,plan_id,delivery_type_id,products,sign_date) VALUES ($1,$2,$3,$4,$5)', [userId, planId, deliveryId, products, signDate]);
    await connection.query('INSERT INTO adress (user_id,endereco,cep,cidade,estado,name) VALUES ($1,$2,$3,$4,$5)', [userId, adress, cep, city, state, fullName]);
    res.sendStatus(201);
  } catch (error) {
    return res.sendStatus(500);
  }
}

export {
  postSignature,
};
