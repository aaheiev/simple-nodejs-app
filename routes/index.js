var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('one-page', {
        title: 'Express',
        product_version: product_version,
        assembly_version: assembly_version
    }
  );
});

module.exports = router;
