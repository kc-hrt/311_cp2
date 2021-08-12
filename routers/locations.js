const express = require('express')
const locationsController = require('../controllers/locations')
const router = express.Router()

router.get('/locations', locationsController.getAllLocations)

router.get('/locations/:id', locationsController.getLocationById)

router.post('/locations', locationsController.createLocation)

router.put('/locations/:id', locationsController.updateLocationById)

router.delete('/locations/:id', locationsController.deleteLocationById)

module.exports = router