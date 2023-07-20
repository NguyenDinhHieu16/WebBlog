var db = require("../common/database");
var q = require("q");

var conn = db.getConnection();

function getAllpPost() {
    var defer = q.defer();
    var query = conn.query('SELECT * FROM blog_content', function (err, posts) {
        if (err) {
            defer.reject("err");
        } else {
            defer.resolve(posts);
        };
    });
    return defer.promise
}

function addPost(params) {
    if (params) {
        var defer = q.defer();
        var query = conn.query('INSERT INTO blog_content SET ?', params, function (err, results) {
            if (err) {
            defer.reject("err");
            } else {
                defer.resolve(results);
            };
        });
        return defer.promise;
    }
    return false;
}

function getPostById(id) {
    var defer = q.defer();
    var query = conn.query('SELECT * FROM blog_content WHERE ?', {id: id}, function (err, posts) {
        if (err) {
            defer.reject("err");
        } else {
            defer.resolve(posts);
        };
    });
    return defer.promise
}

function updatePost(params) {
    if (params) {
        var defer = q.defer();
        var query = conn.query('UPDATE blog_content SET title= ?, content=?, author = ?, update_at = ? WHERE id=?', [params.title, params.content, params.author, new Date(), params.id], function (err, result) {
        if (err) {
            defer.reject("err");
        } else {
            defer.resolve(result);
        }
        });
        return defer.promise;
    };
    return false;
}

function deletePost(id) {
    if (id) {
        var defer = q.defer();
        var query = conn.query('DELETE FROM blog_content WHERE id=?', [id], function (err, result) {
        if (err) {
            defer.reject("err");
        } else {
            defer.resolve(result);
        }
        });
        return defer.promise;
    };
    return false;
}

module.exports = {
    getAllpPost: getAllpPost,
    addPost: addPost,
    getPostById: getPostById,
    updatePost: updatePost,
    deletePost: deletePost
}