var express = require('express');
var router  = express.Router();

function blockCpu(shouldRun = 1) {
    var result = 0;
    while(shouldRun) {
        result += Math.sqrt(Math.random() * Math.random());
        shouldRun -= 1;
    }
    return result;
}
let start = Date.now();

// router.use(logger('combined'));
router.get('/', function(req, res, next) {
    let count = req.query.times || 1000;
    countResult = blockCpu(count);
    let finish = Date.now();
    let time_elapsed = finish - start;
    console.log("calculating rand " + count + " times...");
    res.json({
        rand_value:       countResult,
        started_at:       new Date(start).toISOString(),
        fineshed_at:      new Date(finish).toISOString(),
        time_elapsed_sec: time_elapsed
    });
});

module.exports = router;
