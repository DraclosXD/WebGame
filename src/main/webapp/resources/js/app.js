var cvs = document.getElementById("canvas");
cvs.width = window.innerWidth;
cvs.height = window.innerHeight;
var ctx = cvs.getContext("2d");

/*
document.addEventListener("keydown", function(event) {
    if (event.code == 'KeyW') {
        yPos -= speed;
    }
    else if (event.code == 'KeyA') {
        xPos -= speed;
    }
    else if (event.code == 'KeyA' && event.code == 'KeyA') {
        xPos -= speed;
    }
    else if (event.code == 'KeyS') {
        yPos += speed;
    }
    else if (event.code == 'KeyD') {
        xPos += speed;
    }
});*/
/*
function move(event){
    i
}*/

var player = new Image();
var player2 = new Image();
var background = new Image();
var speed = 20;
var xPos = 0;
var yPos = 0;
var playerName = '';
player.src = "/resources/img/player.PNG";
player2.src = "/resources/img/player2.PNG";
background.src = "/resources/img/background.PNG";
var username = document.getElementById('jsonData').textContent;
function draw(){
    ctx.drawImage(background, -10, -10,cvs.width+10, cvs.height+10)
    ctx.drawImage(player, xPos, yPos)

    //xPos+= 1;
    //requestAnimationFrame(draw);
}

background.onload = draw;


var stompClient = null;

function setConnected(connected) {
    $("#connect").prop("disabled", connected);
    $("#disconnect").prop("disabled", !connected);
    if (connected) {
        $("#conversation").show();
    }
    else {
        $("#conversation").hide();
    }
    $("#greetings").html("");
}

function connect() {
    var socket = new SockJS('/gs-guide-websocket');
    stompClient = Stomp.over(socket);
    stompClient.connect({}, function (frame) {
        setConnected(true);
        console.log('Connected: ' + frame);
        stompClient.subscribe('/queue/greetings', function (greeting) {
           // showGreeting(JSON.parse(greeting.body).content);
            xPos = JSON.parse(greeting.body).xPos;
            yPos = JSON.parse(greeting.body).yPos;
            playerName = JSON.parse(greeting.body).name;
            if (playerName == username){
                draw();
            }
            else{
                ctx.drawImage(player2, xPos, yPos)
            }
            console.log(greeting.body);
            console.log("TEST");
        });
    });
}

function disconnect() {
    if (stompClient !== null) {
        stompClient.disconnect();
    }
    setConnected(false);
    console.log("Disconnected");
}

function sendName() {
    stompClient.send("/app/hello", {}, JSON.stringify({'name': username}));
}

function showGreeting(message) {
    $("#greetings").append("<tr><td>" + message + "</td></tr>");
}
document.addEventListener("keydown", function(event) {
    sendName();
});
$(function () {
    connect();
    $("form").on('submit', function (e) {
        e.preventDefault();
    });

    $( "#connect" ).click(function() { connect(); });
    $( "#disconnect" ).click(function() { disconnect(); });
    $( "#send" ).click(function() { sendName(); });
});