const mysql = require('mysql')
const pool = require('../sql/connection')
const { handleSQLError } = require('../sql/error')

const getAllLocations = (req, res) => {
  // SELECT ALL locations
  pool.query("SELECT * FROM locations", (err, rows) => {
    if (err) return handleSQLError(res, err)
    return res.json(rows);
  })
}

const getLocationById = (req, res) => {
  // SELECT locations WHERE ID = <REQ PARAMS ID>
  let sql = "select * from locations where id = ?"

  sql = mysql.format(sql, [req.params.id]);

  pool.query(sql, (err, rows) => {
    if (err) return handleSQLError(res, err)
    return res.json(rows);
  })
}

const createLocation = (req, res) => {
  // INSERT INTO locations location id and description 
  let sql = "insert into locations (location_id, location_description) values (?, ?)";
 

  sql = mysql.format(sql, [ req.body.location_id, req.body.location_description ]);
  
  pool.query(sql, (err, results) => {
    if (err) return handleSQLError(res, err)
    locationID = results.insertId
    return res.json({ newId: results.insertId });
  });
}

const updateLocationById = (req, res) => {
  // UPDATE locations AND SET location id and description WHERE ID = <REQ PARAMS ID>
  let sql = "update locations set location_id = ?, location_description = ? where id = ?"

  sql = mysql.format(sql, [ req.body.location_id, req.body.location_description, req.params.id ])

  pool.query(sql, (err, results) => {
    if (err) return handleSQLError(res, err)
    return res.status(204).json();
  })
}

const deleteLocationById = (req, res) => {
  // DELETE FROM locations WHERE id  = <REQ PARAMS id>
  let sql = "delete from locations where id = ?"

  sql = mysql.format(sql, [req.body.id])

  pool.query(sql, (err, results) => {
    if (err) return handleSQLError(res, err)
    return res.json({ message: `Deleted ${results.affectedRows} location(s)` });
  })
}

module.exports = {
  getAllLocations,
  getLocationById,
  createLocation,
  updateLocationById,
  deleteLocationById
}