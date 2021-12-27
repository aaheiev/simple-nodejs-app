var express = require('express');
const util = require('util');
var router = express.Router();

router.get('/', function(req, res, next) {
    error_code    = 500
    error_message = util.format("Critical application error-%s occurred.", error_code);
    console.error(error_message);
    res.status(error_code).send(error_message);
});

module.exports = router;
