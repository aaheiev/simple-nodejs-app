var express = require('express');
var router = express.Router();

router.get('/', require('express-healthcheck')());

module.exports = router;
