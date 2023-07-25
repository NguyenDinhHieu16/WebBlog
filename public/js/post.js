function post() {
    function bindEvent() {
        $(".post_edit").click(function(e) {
            console.log("nguyendinhhieu");
            var params = {
                id: $(".id").val(),
                title: $(".title").val(),
                content: tinymce.get("content").getContent(),
                author: $(".author").val()
            };
            
            // var base_url = location.protocol + "//" + document.hostname + ":" + location.port;
            var base_url = "http://localhost:3000";

            $.ajax({
                url: base_url + "/admin/posts/edit",
                type: "PUT",
                data: params,
                dataType: "json",
                success: function(res) {
                    if (res && res.status_code == 200) {
                        location.reload();
                    }
                }
            })
        });

        $(".post_delete").click(function(e) {
            var post_id = $(this).attr("post_id");
            console.log(post_id);
            // var base_url = location.protocol + "//" + document.domain + ":" + location.port;
            var base_url = "http://localhost:3000";

            $.ajax({
                url: base_url + "/admin/posts/delete",
                type: "DELETE",
                data: {id: post_id},
                dataType: "json",
                success: function(res) {
                    if (res && res.status_code == 200) {
                        location.reload();
                    }
                }
            });
        });
    }
    bindEvent();
}

$(document).ready(function() {
    new post();
})