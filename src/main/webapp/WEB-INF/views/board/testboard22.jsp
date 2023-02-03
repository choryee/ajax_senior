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
   //     var ICODE=2;

    $(document).ready(function(){

      setList();

      $('#btn-add').on('click', function(e){
        console.log('e======>', e);
        e.preventDefault();

    	 addServerTest();
      });
     }); //--$(document).ready(function ()



     function delTest(id){




     };


     function addServerTest(){
       //  alert('addServerTest() 실행됨!!');
         var $name=$('#name');
         var username=$name.val();

         var $icode=$('#icode');
         var password=$icode.val();
         console.log('name==>', name);
         if(!username){
          alert('이름을 입력하세요');
          $name.focus();
          return;
          }else if(!password){
           alert('패스워드 입력하삼!!');
           $icode.focus();
           return;
           }

          var p={username: username, password:password};
          $.ajax({
            type:"post",
            url:"http://localhost:8080/board/save",
            data:JSON.stringify(p),
            contentType:"application/json; charset=UTF-8",
            dataType: "json"

          }).done(function(minsung){
          console.log('minsung=====>', minsung)
          appendTest(minsung.id, username, password);
          }).fail(function(xhr, status, errorThrown){
          console.log('xhr===>',xhr);
          console.log('status===>',status);

          }).always(function(xhr, status){
           alert('youre great,!!');

          });

         };



     function setList(){
        var p={username:"test-by-kim", password: "27896"};
      $.ajax({
        type:"post",
        url: "http://localhost:8080/board/getList",
        data:JSON.stringify(p),
        contentType:"application/json; charset=UTF-8",
        dataType:"json"

      }).done(function(sekyung){
        console.log("sekyung===>", sekyung);
        var json=sekyung;
        json.forEach(function(t){
        console.log('t======>', t);
         appendTest(t.id, t.username, t.password);
        })

      }).fail(function(xhr, status, errorThrown){

      }).always(function(xhr, status){

      })

      }; // setList()


     function appendTest(id, name, icode){
          var btn=$('<button>');
          btn.addClass('list-group-item').addClass('list-group-item-action').addClass('prt');
          btn.attr('id', id);
          btn.text(name);
          btn.appendTo('div.list-group');

          var a=$('<a>');
          a.addClass('btn').addClass('btn-danger');
          a.text('X');
          a.attr('href','#');
          a.attr('data-id', id)
          a.appendTo(btn);

          var span=$('<span>');
          span.addClass('badge').addClass('bg-primary').addClass('badge-pill');
          span.text(icode);
          span.appendTo(btn);


     };//--appendTest

</script>


</head>
<body>
<div class="container">
<h1>Berlin(<small class="text-muted" id="cnt"></small> )</h1>

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
                           <input type="text" class="form-control" id="icode" value="" placeholder="don't forget your icode">
                       </div>
               <button type="submit" id="btn-add" class="btn2 btn-primary mb-2"> + </button>
<!-- 위 버튼이 form안에 있으므로, 기본이 submit이다. <div><c:out value="${boardContent.cmd}"></c:out></div> -->
               </form>
       </div>
   </div>
</body>
</html>