import joi from 'joi';

const loginValidation = joi.object({
  email: joi.string().email().required(),
  password: joi.string().alphanum().min(5).required(),
});

const registerValidation = joi.object({
  nome: joi.string().min(3).max(30).required(),
  email: joi.string().email().required(),
  password: joi.string().alphanum().min(5).required(),
});

const signatureValidation = joi.object({
  planId: joi.number().min(1).max(2).required(),
  delivery_type: joi.number().min(1).max(2).required(),
  products: joi.string().required(),
  sign_date: joi.string().required(),
  fullName: joi.string().required(),
  adress: joi.string().required(),
  cep: joi.string().length(8).pattern(/^[0-9]+$/).required(),
  city: joi.string().required,
  state: joi.string().length(2).required,
});

export {
  loginValidation,
  registerValidation,
  signatureValidation,
};
