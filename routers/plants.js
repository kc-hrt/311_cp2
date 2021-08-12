const express = require('express')
const plantsController = require('../controllers/plants')
const router = express.Router()

router.get('/plants', plantsController.getAllPlants)

router.get('/plants/:id', plantsController.getPlantById)

router.post('/plants', plantsController.createPlant)

router.put('/plants/:id', plantsController.updatePlantById)

router.delete('/plants/:id', plantsController.deletePlantById)

module.exports = router