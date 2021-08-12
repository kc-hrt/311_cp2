const express = require('express')
const cropsController = require('../controllers/crops')
const router = express.Router()

router.get('/crops', cropsController.getAllCrops)

router.get('/crops/:id', cropsController.getCropById)

router.post('/crops', cropsController.createCrop)

router.put('/crops/:id', cropsController.updateCropById)

router.delete('/crops/:id', cropsController.deleteCropById)

module.exports = router