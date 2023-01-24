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
        .prt{cursor: pointer;}
        .list-group-item{width: 600px;}
        .btn{float: right;}
        .badge{margin-right: 11px; margin-top: 9px;}
        .btn-primary{margin-left: 20px;}
        .form-inline{float: left;}

    </style>

    <script>
        var ICODE=2;

    $(document).ready(function (){
        $('#btn-add').on('click', function (e){
            e.preventDefault();
            appendTest(345,'aaa',12);
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


        }


// 화면에 전체 리스트 뿌리기. setList()
    var URL="http://localhost:8080/board/getList";

    function setList(){

    }

 // 태그 요소를 만들고, 리스트에 붙이기.
    function appendTest(id, name, icode){
            var button=$('<button>');
            button.addClass('list-group-item').addClass('list-group-item-action').addClass('prt');
            button.text(name);
            button.attr("id", id);
            button.appendTo($('.list-group'));

            var a=$('<a>');
            a.addClass('btn').addClass('btn-danger');
            a.text('X');
            a.attr('href', '#');
          //  a.attr(('data-id', id))
            a.appendTo(button);

            var span=$('<span>');
            span.addClass('badge').addClass('bg-secondary');
            span.text(icode);
            span.appendTo(button);
            }

    </script>

</head>
<body>
<div class="container">
<h1>I'm Board(<small class="text-muted" id="cnt"></small> )</h1>
    <div class="list-group">
        <button type="button" class="list-group-item list-group-item-action ptr">
            A second button item
            <a href="#" class="btn btn-danger">x</a>
            <span class="badge bg-secondary">New</span>
        </button>
    </div>
       <div>
          <form class="form-inline">
           <div class="form-group mb-2">
               <input type="text"  class="form-control-plaintext" id="name" value="111">
           </div>
           <div class="form-group mx-sm-3 mb-2">
               <input type="text"  class="form-control-plaintext" id="icode" value="111">
           </div>
           <button type="submit" id="btn-add" class="btn btn-primary mb-2">Confirm </button>
           </form>
       </div>

   </div>
</body>
</html>