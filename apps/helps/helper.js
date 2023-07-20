var bcrypt = require("bcrypt");
var config = require("../../config/default.json");

function hash_pw(password) {
    var saltRounds = config.salt;
    var salt = bcrypt.genSaltSync(saltRounds);

    var hash = bcrypt.hashSync(password, salt);

    return hash;
}

function compare_pw(password, hash) {
    return bcrypt.compareSync(password, hash);
    
}

module.exports = {
    hash_pw : hash_pw,
    compare_pw: compare_pw
}