var createError       = require('http-errors');
var express           = require('express');
var path              = require('path');
var cookieParser      = require('cookie-parser');
var logger            = require('morgan');

var indexRouter         = require('./routes/index');
var healthcheckRouter   = require('./routes/healthcheck');
var statsCpuRouter      = require('./routes/stats_cpu');
var statsMemRouter      = require('./routes/stats_mem');
var versionRouter       = require('./routes/version');
var buildInfoRouter     = require('./routes/buildInfo');
var loadGeneratorRouter = require('./routes/loadGenerator');
var error500Router      = require('./routes/error500');

var app                 = express();

var pjson               = require('./package.json');

global.product_version  = pjson.version;
global.assembly_version = process.env.ASSEMBLY_VERSION || product_version;

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/',             indexRouter);
app.use('/health',       healthcheckRouter);
app.use('/version',      versionRouter);
app.use('/buildinfo',    buildInfoRouter);
app.use('/do-hard',      loadGeneratorRouter);
app.use('/stats/cpu',    statsCpuRouter);
app.use('/stats/mem',    statsMemRouter);
app.use('/gen-error500', error500Router);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
