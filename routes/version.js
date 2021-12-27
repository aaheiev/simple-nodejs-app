var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
    res.json({ product_version: product_version, assembly_version: assembly_version });
});

module.exports = router;
