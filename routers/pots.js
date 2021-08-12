const express = require('express')
const potsController = require('../controllers/pots')
const router = express.Router()

router.get('/pots', potsController.getAllPots)

router.get('/pots/:id', potsController.getPotById)

router.post('/pots', potsController.createPot)

router.put('/pots/:id', potsController.updatePotById)

router.delete('/pots/:id', potsController.deletePotById)

module.exports = router