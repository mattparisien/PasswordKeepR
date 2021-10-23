const express = require('express');
const router = express.Router();

module.exports = (db) => {

  // get login form
  router.get('/login'), (req, res) => {
    // const currentUser = req.session.user_id;
    // console.log(req);
    // res.render('index');
  };

  router.post("/login", (req, res) => {
    const { email } = req.body;
    console.log(req.body);

    //If it's an empty field redirect to same page
    if (!email) {
      res.status(400).redirect("/");
      return;
    }

    //Get id from email input to set a cookie
    const queryText = `
      SELECT * FROM accounts
      WHERE email = $1;
    `;
    const queryParams = [email];

    return db
      .query(queryText, queryParams)
      .then((account) => {
        //If it returns an empty array (no user exists)
        if (account.rows.length === 0) {
          res.status(400).redirect("/");
          return;
        }
        //Set cookie to user id retrieved from db
        req.session["user_id"] = account.rows[0].id;
        // res.status(200).redirect("/passwords");
        console.log(account)
      })
      .catch((err) => console.log(err));
  });


  // logout
  router.post('/logout', (req, res) => {

  })

  return router;
}