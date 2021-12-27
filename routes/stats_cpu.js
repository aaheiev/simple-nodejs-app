var express  = require('express');
var osu      = require('node-os-utils');
var cpu      = osu.cpu;
var cpuCount = cpu.count();
var router   = express.Router();

router.get('/', function(req, res, next) {
    let cpuAverage = cpu.average();
    let cpuModel   = cpu.model();
    cpu.usage().then(
        cpuPercentage => {
            res.json({
                cpu: {
                    cpuPercentage: cpuPercentage,
                    cpuAverage:    cpuAverage,
                    cpuCount:      cpuCount,
                    cpuModel:      cpuModel
                }
            });
        }
    )
    // res.json({
    //     cpuPercentage: cpuPercentage,
    //     cpuAverage: cpuAverage,
    //     cpuCount: cpuCount,
    // });
});

module.exports = router;
