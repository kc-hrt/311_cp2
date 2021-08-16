const express = require('express')
const availabilityController = require('../controllers/availability')
const router = express.Router()

router.get('/availability', availabilityController.getAvailability);

module.exports = router