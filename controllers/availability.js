const mysql = require('mysql')
const pool = require('../sql/connection')
const { handleSQLError } = require('../sql/error')

const getAvailability = (req, res) => {
  // Select  Availbability
  pool.query("SELECT * FROM crops WHERE available_date <= currentdate()", (err, rows) => {
    if (err) return handleSQLError(res, err)
    return res.json(rows);
  })
};


module.exports = { getAvailability }