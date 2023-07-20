var config = require("../../config/default.json");
var mysql = require("mysql");

var connection = mysql.createConnection({
    host     : config.mysql.host,
    user     : config.mysql.user,
    password : config.mysql.password,
    database : config.mysql.database,
    port     : config.mysql.port
  });
   
  // connection.connect(error => {
  //   if (error) throw error;
  //   console.log("success");
  // });

  function getConnection() {
    if (!connection) {
        connection.connect();
    }
    return connection;
  }

  module.exports = {
    getConnection: getConnection
  }