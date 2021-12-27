var express  = require('express');
var osu      = require('node-os-utils');
var mem      = osu.mem;
var router   = express.Router();

router.get('/', function(req, res, next) {
    mem.info()
        .then(info => {
            res.json({mem: info});
        })
});

module.exports = router;
