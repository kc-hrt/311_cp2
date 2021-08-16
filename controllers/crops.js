const mysql = require('mysql')
const pool = require('../sql/connection')
const { handleSQLError } = require('../sql/error')

const getAllCrops = (req, res) => {
  // SELECT ALL USERS
  pool.query("SELECT * FROM crops", (err, rows) => {
    if (err) return handleSQLError(res, err)
    return res.json(rows);
  })
}

const getCropById = (req, res) => {
  // SELECT USERS WHERE ID = <REQ PARAMS ID>
  let sql = "select * from crops where id = ?"
  // WHAT GOES IN THE BRACKETS
  sql = mysql.format(sql, [req.params.id]);

  pool.query(sql, (err, rows) => {
    if (err) return handleSQLError(res, err)
    return res.json(rows);
  })
}

const createCrop = (req, res) => {
  // INSERT INTO USERS FIRST AND LAST NAME 
  let sql = "insert into crops (plant_id, pot_id, location_id, planted_date, projected_date, available_date, planted_quantity, available_quantity) values (?, ?, ?, ?, ?, ?, ?, ?)";
  // WHAT GOES IN THE BRACKETS
  sql = mysql.format(sql, [ 
    req.body.plant_id, 
    req.body.pot_id,
    req.body.location_id,
    req.body.planted_date,
    req.body.projected_date,
    req.body.available_date,
    req.body.planted_quantity,
    req.body.available_quantity
  ]);
  
  pool.query(sql, (err, results) => {
    if (err) return handleSQLError(res, err)
    cropID = results.insertId
    return res.json({ newId: results.insertId });
  });
}

const updateCropById = (req, res) => {
  
  let sql = "update crops set plant_id = ?, pot_id = ?, location_id = ?, planted_date = ?, projected_date = ?, available_date = ?, planted_quantity = ?, available_quantity = ? where id = ?"
  
  sql = mysql.format(sql, [ 
    req.body.plant_id, 
    req.body.pot_id,
    req.body.location_id,
    req.body.planted_date,
    req.body.projected_date,
    req.body.available_date,
    req.body.planted_quantity,
    req.body.available_quantity,
    req.params.id
  ]);

  pool.query(sql, (err, results) => {
    if (err) return handleSQLError(res, err)
    return res.status(204).json();
  })
}

const deleteCropById = (req, res) => {
  let sql = "delete from crops where id = ?"
  sql = mysql.format(sql, [req.body.id])

  pool.query(sql, (err, results) => {
    if (err) return handleSQLError(res, err)
    return res.json({ message: `Deleted ${results.affectedRows} crop(s)` });
  })
}

module.exports = {
  getAllCrops,
  getCropById,
  createCrop,
  updateCropById,
  deleteCropById
}