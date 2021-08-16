const mysql = require('mysql')
const pool = require('../sql/connection')
const { handleSQLError } = require('../sql/error')

const getAllPots = (req, res) => {
  // SELECT ALL pot
  pool.query("SELECT * FROM pots", (err, rows) => {
    if (err) return handleSQLError(res, err)
    return res.json(rows);
  })
}

const getPotById = (req, res) => {
  // SELECT pot WHERE ID = <REQ PARAMS ID>
  let sql = "select * from pots where id = ?"

  sql = mysql.format(sql, [req.params.id]);

  pool.query(sql, (err, rows) => {
    if (err) return handleSQLError(res, err)
    return res.json(rows);
  })
}

const createPot = (req, res) => {
  // INSERT INTO pot pot size and type 
  let sql = "insert into pots (pot_size, pot_type) values (?, ?)";
 

  sql = mysql.format(sql, [ req.body.pot_size, req.body.pot_type ]);
  
  pool.query(sql, (err, results) => {
    if (err) return handleSQLError(res, err)
    potID = results.insertId
    return res.json({ newId: results.insertId });
  });
}

const updatePotById = (req, res) => {
  // UPDATE pot AND SET pot_size and pot_type WHERE ID = <REQ PARAMS ID>
  let sql = "update pots set pot_size = ?, pot_type = ? where id = ?"

  sql = mysql.format(sql, [ req.body.pot_size, req.body.pot_type, req.params.id ])

  pool.query(sql, (err, results) => {
    if (err) return handleSQLError(res, err)
    return res.status(204).json();
  })
}

const deletePotById = (req, res) => {
  // DELETE FROM pot WHERE id = <REQ PARAMS id>
  let sql = "delete from pots where id = ?"

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