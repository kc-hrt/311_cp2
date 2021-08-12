const mysql = require('mysql')
const pool = require('../sql/connection')
const { handleSQLError } = require('../sql/error')

const getAllPlants = (req, res) => {
  // SELECT ALL USERS
  pool.query("SELECT * FROM plants", (err, rows) => {
    if (err) return handleSQLError(res, err)
    return res.json(rows);
  })
}

const getPlantById = (req, res) => {
  // SELECT USERS WHERE ID = <REQ PARAMS ID>
  let sql = "select * from plants where id = ?"
  // WHAT GOES IN THE BRACKETS
  sql = mysql.format(sql, [req.params.id]);

  pool.query(sql, (err, rows) => {
    if (err) return handleSQLError(res, err)
    return res.json(rows);
  })
}

const createPlant = (req, res) => {
  // INSERT INTO USERS FIRST AND LAST NAME 
  let sql = "insert into plants (plant_name, plant_variant, plant_color) values (?, ?, ?)";
 
  // WHAT GOES IN THE BRACKETS
  sql = mysql.format(sql, [ req.body.plant_name, req.body.plant_variant, req.body.plant_color ]);
  
  pool.query(sql, (err, results) => {
    if (err) return handleSQLError(res, err)
    userID = results.insertId
    return res.json({ newId: results.insertId });
  });
}

const updatePlantById = (req, res) => {
  // UPDATE USERS AND SET FIRST AND LAST NAME WHERE ID = <REQ PARAMS ID>
  let sql = "update plants set plant_name = ?, plant_variant = ?, plant_color = ? where id = ?"
  // WHAT GOES IN THE BRACKETS
  sql = mysql.format(sql, [ req.body.plant_name, req.body.plant_variant, req.body.plant_color, req.params.id ])

  pool.query(sql, (err, results) => {
    if (err) return handleSQLError(res, err)
    return res.status(204).json();
  })
}

const deletePlantById = (req, res) => {
  
  let sql = "delete from plants where id = ?"
  // WHAT GOES IN THE BRACKETS
  sql = mysql.format(sql, [req.body.id])

  pool.query(sql, (err, results) => {
    if (err) return handleSQLError(res, err)
    return res.json({ message: `Deleted ${results.affectedRows} user(s)` });
  })
}

module.exports = {
  getAllPlants,
  getPlantById,
  createPlant,
  updatePlantById,
  deletePlantById
}