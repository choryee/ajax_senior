
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
        // 첨 페이지 ready할 때 바로, setList();호출함.
        setList();

        $("#btn-add").on("click", function (evt){
          //  console.log("evt>>>>>>>>", evt);
          //  console.log("currentTarget>>>>>>>>", evt.currentTarget);
            evt.preventDefault();

            appendTest(11, 'test', 3);
        })
    });

    var URL="http://localhost:8080/board/getBoardContent";
    function setList(){
        <!-- 밑 javascript 형태 오브젝트-->
      var p={cmd:"test-by-icode", icode: "2"};
        // var p={icode: 2};

        $.ajax({
            type:"POST",
            url:URL,
            //data:p,  //이렇게 하면, 서버로 날라가는 게, 그냥 key=value형태.
           data:  JSON.stringify(p), // 이렇게 하면, 서버로 날라가는게 json타입. 이거 쓸거면, 밑거와 세트로 써야.
           contentType:"application/json; charset=UTF-8",
           // contentType:"application/json",
           // data : p,
            dataType:"json" // 서버에서 다시 여기로 테이터 받는 타입이 json이라는 것.

        }).done(function (resp){
            //var content=JSON.stringify(json,null," ");
            <!-- $("<pre class=\"content\">").html(content).appendTo("body"); -->
            console.log("resp>>>>", resp);
            if(resp) alert('SUCCESS!!');

            var test=json.test; //31'15
            test.forEach(function (t){
                appendTest(t.id, t.name, t.icode);
            })


        }).fail(function (xhr, status, errorThrown){
            if(status) alert('에러가 났습니다.>>>>'+xhr.statusText);
            console.error(".fail:::::sorry, there was a problem(status)>>>>", status);
            console.log("xhr>>>>>>>", xhr);
            console.log("xhr.status>>>>>>>", xhr.status);

            console.log("xhr.statusText>>>>>>>", xhr.statusText);
        }).always(function (xhr, status){
            console.log("console::The request is complete!!>>>", URL+"?"+$.param(p));
        })
    }

    function appendTest(id, name, icode){
        var btn=$('<button>');
        btn.addClass('list-group-item').addClass('list-group-item-action');
        btn.text(name);
        btn.appendTo($("div.list-group"));

        var a=$("<a>");
        a.addClass("btn").addClass("btn-danger");
        a.text("x");
        a.attr('href', '#');
        a.appendTo(btn);

        var span=$("<span>");
        span.addClass("badge").addClass("bg-primary").addClass("badge-pill");
        span.text(icode);
        span.appendTo(btn);
    }



    </script>
</head>
<body>
   <div class="container">
        <h1>Test Board</h1>

       <div class="list-group">
           <button type="button" class="list-group-item list-group-item-action ptr">
               The current button
               <a href="#" class="btn btn-danger">x</a>
               <span  class="badge bg-primary badge-pill">14</span>
           </button>
           <script>


           </script>

       </div>

       <div class="my-3">
               <form class="form-inline">
                   <div class="form-group mx-sm-3 mb-2">
                       <input type="text" class="form-control" id="name" placeholder="don't forget your name">
                       <input type="text" class="form-control" id="icode" value="3" placeholder="don't forget your icode">
                   </div>
                       <button type="submit" id="btn-add" class="btn2 btn-primary mb-2">+</button>
    <!-- <div><c:out value="${boardContent.cmd}"></c:out></div> -->
               </form>
       </div>
   </div>
</body>
</html>