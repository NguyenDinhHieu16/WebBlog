var express = require("express");
var router = express.Router();
var post_md = require("../model/post");

router.get("/", function(req, res){
    var data = post_md.getAllpPost();
    data.then(function(posts){
        var result = {
            posts: posts,
            error: false
        };
        res.render("admin/homePage", {data: result});
    }).catch(function(err){
        var result = {
            error: "Cound not post data"
        };
        res.render("admin/homePage", {data: result});
    });
});

router.get("/detail/:id", function(req, res) {

    var data = post_md.getPostById(req.params.id);
    data.then(function(posts) {
        var post = posts[0];
        var result = {
            post: post,
            error: false
        };
        var data1 = post_md.getAllCmt(req.params.id);
        data1.then(function(cmts) {
        var result1 = {
            cmts: cmts,
            error: false
        }
        res.render("admin/posts/details/blog", {data: result, data1: result1});
    }).catch(function(err) {
        var result = {
            error: "Cound not get post detail"
        };
        res.render("admin/posts/details/blog", {data: result});
    });

});
});

router.post("/detail/:id", function(req, res) {
    var cmts= req.body;
    if (cmts.cmt.trim().length == 0) {
        res.render("admin/posts/details/blog", {data: {error: "Comment is none"}});
    }
    var now = new Date();
    //inser database
    cmts = {
        content: cmts.cmt,
        author: "nguyendinhhieu",
        create_at: now,
        id_post: req.params.id
    };
    
    var result = post_md.addCmt(cmts);
    result.then(function(data) {
        res.redirect("/blog");
    }).catch(function(err) {
        res.render("signUp", {data: {error: "error"}});
    });
});

router.get("/about", function(req, res){
    res.render("admin/posts/details/about");
});

module.exports = router;