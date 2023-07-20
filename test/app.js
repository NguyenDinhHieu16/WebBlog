var express = require("express");
var bodyParser = require("body-parser");
var config = require("../config/default.json");
var session = require("express-session");
var socketio = require("socket.io");

var app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: true}));

app.set('trust proxy', 1) // trust first proxy
app.use(session({
  secret: config.secret_key,
  resave: false,
  saveUninitialized: true,
  cookie: { secure: false }
}));

var controller = require("../apps/controller");

app.set("views", "../apps/views");
app.set("view engine", "ejs");

app.use("/static", express.static("../public"));

app.use(controller);

var host= config.sever.host;
var port = config.sever.port;
var server = app.listen(port, host, function(){
    console.log("Serverrun", port);
});

var io = socketio(server);

