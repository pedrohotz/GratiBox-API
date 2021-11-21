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

export {
  loginValidation,
  registerValidation,
};
