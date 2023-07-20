function appear() {
    var eyeBtn = document.getElementById("passW");
    console.log(eyeBtn);
    if (eyeBtn.type === "password") {
        eyeBtn.type = "text";
    }
    else {
        eyeBtn.type = "password";
    }
}


function appearR() {
    var eyeBtn = document.getElementById("RePassW");
    console.log(eyeBtn);
    if (eyeBtn.type === "password") {
        eyeBtn.type = "text";
    }
    else {
        eyeBtn.type = "password";
    }
}