var express = require("express");
var router = express.Router();
var user_md = require("../model/user");
var post_md = require("../model/post");

var helper = require("../helps/helper");

router.get("/", function(req, res){
    if (req.session.user) {
        var data= post_md.getAllpPost();
        data.then(function(posts) {
            var data ={
                posts: posts,
                error: false
            };
            res.render("admin/posts/dashboard", {data: data});
        }).catch(function(err) {
            res.render("admin/posts/dashboard", {data: {error: "Get post data is Error"}});
        });
    }else{
        res.redirect("/admin/login");
    }
    
    
    
});

router.get("/signUp", function(req, res){
    // res.json({"message" : "this is homepage"});
    res.render("signUp", {data: {}});
});

router.post("/signUp", function(req, res){
    var user= req.body;
    if (user.email.trim().length == 0) {
        res.render("signUp", {data: {error: "Email is req"}});
    }

    if (user.passwd != user.repasswd && user.passwd.trim().length != 0) {
        res.render("signUp", {data: {error: "Password not match"}});
    }

    //inser database
    password= helper.hash_pw(user.passwd);

    user = {
        email: user.email,
        password: password,
        first_name: user.fName,
        last_name: user.lName
    };
    var result = user_md.addUser(user);

    result.then(function(data) {
        res.redirect("/admin/login");
    }).catch(function(err) {
        res.render("signUp", {data: {error: "error"}});
    });

});

router.get("/login", function(req, res) {
    res.render("login", {data: {}});
});

router.post("/login", function(req, res) {
    var params = req.body;

    if (params.email.trim().length == 0) {
        res.render("login", {data: {error: "Please enter an email"}})
    }else{
        var data = user_md.getUserByEmail(params.email);
        data.then(function(users){
        var user= users[0];
        var status = helper.compare_pw(params.passW, user.password);
        if(!status) {
            res.render("login", {data: {error: "PassWord Wrong"}});
        }else{
            req.session.user = user;
            res.redirect("/admin/")
        }
        }).catch(function(err){
            res.render("login", {data: {error: "User not exists"}});
        });
    }
});

router.get("/posts/new", function(req, res) {
    if (req.session.user) {
        res.render("admin/posts/new", {data: {error: false}});
    }else {
        res.redirect("/admin/login");
    }
});

router.post("/posts/new", function(req, res) {
    var params = req.body;

    var now = new Date();
    params.create_at = now;
    params.update_at = now;

    var data = post_md.addPost(params);

    data.then(function(result) {
        res.redirect("/admin");
    }).catch(function(err) {
        var data = {
            error: "Cound not insert post"
        };
        res.render("admin/posts/new", {data: data});
    });
});

router.get("/posts/edit/:id", function(req, res) {
    if (req.session.user) {
        var params = req.params;
        var id = params.id;
        var data = post_md.getPostById(id);

        if (data) {
            data.then(function(posts) {
                var post = posts[0];
                var data= {
                    post: post,
                    error: false
                };
                res.render("admin/posts/edit", {data: data});
            }).catch(function(err) {
                var data={error: "could not get POst by ID"};
                res.render("admin/posts/edit", {data: data});
            });
        }else {
            var data={error: "could not get POst by ID"};
            res.render("admin/posts/edit", {data: data});
        }
    }else {
        res.redirect("/admin/login");
    }
});

router.put("/posts/edit", function(req, res) {
    var params = req.body;
    var data = post_md.updatePost(params);

    if(!data) {
        res.json({status_code: 500});
    }else{
        data.then(function(result) {
            res.json({status_code: 200});
        }).catch(function(err){
            res.json({status_code: 500});
        });
    }
});

router.delete("/posts/delete", function(req, res) {
    var post_id = req.body.id;
    console.log(post_id);
    var data= post_md.deletePost(post_id);
    if (!data) {
        res.json({status_code: 500});
    }else {
        data.then(function(result) {
            res.json({status_code: 200});
        }).catch(function(err) {
            res.json({status_code: 500});
        });
    }
});

router.get("/posts", function(req, res) {
    if (req.session.user) {
        res.redirect("/admin");
    }else{
        res.redirect("/admin/login");
    }
});

router.get("/user", function(req, res) {
    if (req.session.user) {
        var data = user_md.getAllUsers();
        data.then(function(users) {
            var data= {
                users: users,
                error: false
            }
            res.render("admin/user", {data: data})
        }).catch(function(err){
            var data= {
                error: "Cound not get user info"
            };
            res.render("admin/user", {data:data});
        });
    }else{
        res.redirect("/admin/login");
    }
});

module.exports = router;