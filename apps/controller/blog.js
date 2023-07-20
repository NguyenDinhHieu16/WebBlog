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
    
    // res.render("admin/homePage");
});

router.get("/detail/:id", function(req, res) {
    var data = post_md.getPostById(req.params.id);
    data.then(function(posts) {
        var post = posts[0];
        var result = {
            post: post,
            error: false
        };
        res.render("admin/posts/details/blog", {data: result});
    }).catch(function(err) {
        var result = {
            error: "Cound not get post detail"
        };
        res.render("admin/posts/details/blog", {data: result});
    });
    
});

router.get("/about", function(req, res){
    res.render("admin/posts/details/about");
})

module.exports = router;