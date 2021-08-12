const mysql = require('mysql')
const pool = require('../sql/connection')
const { handleSQLError } = require('../sql/error')

const getAllPots = (req, res) => {
  // SELECT ALL USERS
  pool.query("SELECT * FROM pots", (err, rows) => {
    if (err) return handleSQLError(res, err)
    return res.json(rows);
  })
}

const getPotById = (req, res) => {
  // SELECT USERS WHERE ID = <REQ PARAMS ID>
  let sql = "select * from pots where id = ?"
  // WHAT GOES IN THE BRACKETS
  sql = mysql.format(sql, [req.params.id]);

  pool.query(sql, (err, rows) => {
    if (err) return handleSQLError(res, err)
    return res.json(rows);
  })
}

const createPot = (req, res) => {
  // INSERT INTO USERS FIRST AND LAST NAME 
  let sql = "insert into pots (first_name, last_name) values (?, ?)";
 
  // WHAT GOES IN THE BRACKETS
  sql = mysql.format(sql, [ req.body.first_name, req.body.last_name ]);
  
  pool.query(sql, (err, results) => {
    if (err) return handleSQLError(res, err)
    potID = results.insertId
    return res.json({ newId: results.insertId });
  });
}

const updatePotById = (req, res) => {
  // UPDATE USERS AND SET FIRST AND LAST NAME WHERE ID = <REQ PARAMS ID>
  let sql = "update pots set first_name = ?, last_name = ? where id = ?"
  // WHAT GOES IN THE BRACKETS
  sql = mysql.format(sql, [ req.body.first_name, req.body.last_name, req.params.id ])

  pool.query(sql, (err, results) => {
    if (err) return handleSQLError(res, err)
    return res.status(204).json();
  })
}

const deletePotById = (req, res) => {
  // DELETE FROM USERS WHERE FIRST NAME = <REQ PARAMS FIRST_NAME>
  let sql = "delete from pots where id = ?"
  // WHAT GOES IN THE BRACKETS
  sql = mysql.format(sql, [req.body.id])

  pool.query(sql, (err, results) => {
    if (err) return handleSQLError(res, err)
    return res.json({ message: `Deleted ${results.affectedRows} pot(s)` });
  })
}

module.exports = {
  getAllPots,
  getPotById,
  createPot,
  updatePotById,
  deletePotById
}