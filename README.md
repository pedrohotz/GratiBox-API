<h1 align="center"> GratiBox - API </h1>

# Description
Gratibox is an aplication to sign for plans, the are two types of plans that the user can get, first you have to create an account to enter the app, then you should login. You will get to the page to choose the plans. To subscribe to a plan, the user must select the delivery days, and the shipping location informations. After you have signed to a plan it will show in the /subscription page. 


# Getting started

``` postgresql
/* In your psql terminal */
CREATE DATABASE gratibox;
/* Access the database */
\c gratibox
```
Run all commands from Dump.sql to populate DataBase
---
---
Running the Backend (server)
---

``` jsx
// Clone this repository
$ git clone git@github.com:pedrohotz/gratibox-api.git
// Access the project folder cmd/terminal
$ cd gratibox-api
// Install the dependencies
$ npm install
// Create a environment variable
Create a .env.dev file and fill it using your environment variables following the .env.example
// Run the application
$ npx nodemon src/server.js
// The server will start at port: 4000
```

# Tech Stack

The following tools were used in the construction of the project-api:

**Server**  ([NodeJS](https://nodejs.org/en/))

-   **[Express](https://expressjs.com/)**
-   **[CORS](https://expressjs.com/en/resources/middleware/cors.html)**
-   **[bcrypt](https://github.com/kelektiv/node.bcrypt.js)**
-   **[pg](https://github.com/brianc/node-postgres)**
-   **[dotENV](https://github.com/motdotla/dotenv)**
-   **[UUID](https://github.com/uuidjs/uuid)**
-   **[Joi](https://github.com/hapijs/joi)**
-   **[Eslint - Airbnb](https://github.com/airbnb/javascript)**



**Utilities**

-   API:  **[Brasil API](https://github.com/BrasilAPI/cep-promise)**
-   Editor:  **[Visual Studio Code](https://code.visualstudio.com/)**
---
## Author

Developed by Pedro Hotz Bronzato.