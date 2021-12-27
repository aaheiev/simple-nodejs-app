var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
    res.json({ 
        git_commit_id: process.env.GIT_COMMIT_ID || 'undef',
        git_branch: process.env.GIT_BRANCH_NAME || 'undefined',
        product_version: product_version, 
        assembly_version: assembly_version 
    });
});

module.exports = router;
