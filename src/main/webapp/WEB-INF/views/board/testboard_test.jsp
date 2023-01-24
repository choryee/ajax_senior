<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <style>
        .ptr {cursor:pointer; }
        .badge {float:right; position: absolute; right: 44px;}
        .list-group-item {width: 550px; background-color: #6bb1f9 }
        .list-group{position: relative;}
        .btn { position: absolute; top: 4px; right: 7px;}
        .my-3 {position: relative;}
    </style>

    <script>
        var ICODE=2;

    $(document).ready(function (){
        $('#btn-add').on('click', function (e){
            e.preventDefault();
            appendTest(111, 'ttt', 23);
        })
    })

        // console.log("--------------------------Del event starting")
        // $("a.btn-danger").on("click", function (evt){
        //     //  console.log("evt>>>>>>>>", evt);
        //     console.log("currentTarget>>>>>>>>", evt.currentTarget);
        //     evt.preventDefault();
        //     delTest();
        // })
   // });

    function delTest(id){

    }


    // textarea 2개의 내용을 ajax로 save 컨트롤러 호출(저장) 하는 것.
    function addTest(){
       var $name= $('#name');
       var username=$name.val();
    console.log('name>>>', username);

        var $pw=$('#icode');
        var password=$pw.val();

        if(username == ''){
            alert('내용 입력하셈!!');
            $name.focus();
            return;
        }
        if(password == ''){
            alert('비번 입력하셈!!!');
            $pw.focus();
            return;
        }

         var p={username:username, password:password};

        $.ajax({
            type:'POST',
            url: "http://localhost:8080/board/save",
            data:JSON.stringify(p),
            contentType:"application/json; charset=UTF-8",
            dataType:"json"

        }).done(function (brian){
            console.log('>>>>>', brian);
            //appendTest()


        }).fail(function (xhr, status, errorThrown){
            console.log("status>>>", status);

        }).always(function (){

        })

        }


// 화면에 전체 리스트 뿌리기. setList()
    var URL="http://localhost:8080/board/getList";

    function setList(){

    }

 // 태그 요소를 만들고, 리스트에 붙이기.
    function appendTest(id, name, icode){
        var btn=$('<button>');
        btn.addClass('list-group-item').addClass('list-group-item-action').addClass('prt');
        btn.text(name);
        btn.appendTo($('div.list-group')); //div안 써도 됨.

        var a=$('<a>');
        a.addClass('btn').addClass('btn-danger');
        a.text('x');
        a.attr('href', '#');
        a.attr('data-id', id);
        a.appendTo(btn);

        var span=$('<span>');
        span.addClass('badge').addClass('bg-primary').addClass('badge-pill');
        span.text(icode);
        span.appendTo(btn);


    }

    </script>
</head>
<body>
<div class="container">
<h1>I'm Board(<small class="text-muted" id="cnt"></small> )</h1>

       <div class="list-group">
            <button type="button" class="list-group-item list-group-item-action ptr">
                    The current button
               <a href="#" class="btn btn-danger">x</a>
               <span  class="badge bg-primary badge-pill">14</span>
           </button>

       </div>

       <div class="my-3">
           <form class="form-inline">
               <div class="form-group mx-sm-3 mb-2">
                   <input type="text" class="form-control" id="name" placeholder="don't forget your name">
                   <input type="text" class="form-control" id="icode" value="3" placeholder="don't forget your icode">
               </div>
           <button type="submit" id="btn-add" class="btn2 btn-primary mb-2">+</button>
<!-- 위 버튼이 form안에 있으므로, 기본이 submit이다. <div><c:out value="${boardContent.cmd}"></c:out></div> -->
           </form>
       </div>
   </div>
</body>
</html>