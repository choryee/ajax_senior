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
            addTest();
        })

        // console.log("--------------------------Del event starting")
        // $("a.btn-danger").on("click", function (evt){
        //     //  console.log("evt>>>>>>>>", evt);
        //     console.log("currentTarget>>>>>>>>", evt.currentTarget);
        //     evt.preventDefault();
        //     delTest();
        // })
    });

    function delTest(id){
        var URL="http://localhost:8080/board/delete/";
        $.ajax({
            type:"delete",
            url: URL+id,

            // delete는 data는 넘기는 게 아니므로, 밑 필요 x
            // data:  JSON.stringify(p),
            // contentType:"application/json; charset=UTF-8",
            // dataType:"json" // 서버에서 다시 여기로 테이터 받는 타입이 json이라는 것.

        }).done(function (brian){
            console.log('delTest>>>', brian);
            //$('button#32')
            $('#'+id).remove();


        }).fail(function (xhr, status, errorThrown){
            if(status) alert('delete 에러가 났습니다.>>>>'+xhr.statusText);
            //  console.error(".fail:::::sorry, there was a problem(status)>>>>", status);
            console.log("xhr save>>>>>>>", xhr);
            console.log("xhr.status>>>>>>>", xhr.status);

            console.log("xhr.statusText>>>>>>>", xhr.statusText);
        }).always(function (xhr, status){
            //   console.log("console::The request is complete!!>>>", URL+"?"+$.param(p));
        })
    }


    // textarea 2개의 내용을 ajax로 save 컨트롤러 호출(저장) 하는 것.
    function addTest(){
        var $name=$('#name'); // jquery는 찾는데 시간 많이 걸리므로, 여러번 쓰는 것은 변수로 빼라
        var username=$name.val();

        var $pw=$('#icode');
        var password=$pw.val();
        if(!username) {
            alert('이름을 입력 하셈!!');
            $name.focus();
            return  //밑에 appendTest() 시행하면 안 되서.
        } else  if(!password){
            alert('비번을 잊어군요!!');
            $pw.focus();
            return;
        }

        //밑 ajax- +버튼 누르면, name과 icode가 서버에 가서 저장되게 하려고.
        var p= { username: username,  password: password }
            $.ajax({
                type:"post",
                url: "http://localhost:8080/board/save",
                //data:p,  //이렇게 하면, 서버로 날라가는 게, 그냥 key=value형태.
                data:  JSON.stringify(p),
                contentType:"application/json; charset=UTF-8",
                // contentType:"application/json",
                // data : p,
                dataType:"json" // 서버에서 다시 여기로 테이터 받는 타입이 json이라는 것.

            }).done(function (brian){
                appendTest(brian.id, name, password);
                console.log('brian.id>>>', brian.id);
                //var content=JSON.stringify(json,null," ");
                <!-- $("<pre class=\"content\">").html(content).appendTo("body"); -->
                console.log("brian save>>>>", brian);
                if(brian) alert('SUCCESS!!');

            }).fail(function (xhr, status, errorThrown){
                if(status) alert('save 에러가 났습니다.>>>>'+xhr.statusText);
              //  console.error(".fail:::::sorry, there was a problem(status)>>>>", status);
                console.log("xhr save>>>>>>>", xhr);
                console.log("xhr.status>>>>>>>", xhr.status);

                console.log("xhr.statusText>>>>>>>", xhr.statusText);
            }).always(function (xhr, status){
             //   console.log("console::The request is complete!!>>>", URL+"?"+$.param(p));
            })
        }


// 화면에 전체 리스트 뿌리기. setList()
    var URL="http://localhost:8080/board/getList";

    function setList(){
        console.log("-------------------------setList start 화면에 전체 리스트 뿌리기 시작 ")
        <!-- 밑 javascript 형태 오브젝트-->
      var p={username:"test-by-kim", password: "27896"};
        // var p={icode: 2};

        $.ajax({
            type:"post",
            url:URL,
            //data:p,  //이렇게 하면, 서버로 날라가는 게, 그냥 key=value형태.
           data:  JSON.stringify(p), // 이렇게 하면, 서버로 날라가는게 json타입. 이거 쓸거면, 밑거와 세트로 써야.
           contentType:"application/json; charset=UTF-8",
           // contentType:"application/json",
           // data : p,
            dataType:"json" // 서버에서 다시 여기로 테이터 받는 타입이 json이라는 것.

        }).done(function (brian){
            console.log("setList--------------------->>화면에 전체 리스트 뿌리기 완료")
            //var content=JSON.stringify(json,null," ");
            <!-- $("<pre class=\"content\">").html(content).appendTo("body"); -->
            console.log("brian getList>>>>", brian);
           // if(brian) alert('SUCCESS!!');


            //31'15
            var json=brian;
            // json.forEach(function(t){
            //     console.log(t.id, t.username, t.password)
            // }) 이건 강사가 브라우저 콘솔창에서 작업하는 것 보여줌. 30;53

            json.forEach(function(t){
                appendTest(t.id, t.username, t.password);
            });

            $('#cnt').text(json.length);

        //밑부분은 01'09'52. 막 새로 추가한 것은 삭제버튼 작동 안해서, 최종 수정한것.
            // console.log("--------------------------Del event는 여기에 등록해야")
            // $("a.btn-danger").on("click", function (evt){
            //     console.log("evt>>>>>>>>", evt);
            //     // target-내가 클릭한 개체.
            //     console.log("currentTarget>>>>>>>>", evt.currentTarget);
            //     evt.preventDefault();
            //     var $btnDel=$(evt.target);
            //     console.log(">>>>>$btnDel & data-id>", $btnDel, $btnDel.attr('data-id'));
            //     console.log(">>>>>$btnDel & data-id>", $btnDel, $btnDel.data('id')); //data라는 것을 많이 써서, 위와 동일. 51'37
            //     delTest( $btnDel.data('id') );
            // })

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

 // 태그 요소를 만들고, 리스트에 붙이기.
    function appendTest(id, name, icode){
        var btn=$('<button>');
        btn.attr('id', id); //6강 43;21 삭제 부분에서
        btn.addClass('list-group-item').addClass('list-group-item-action');
        btn.text(name);
        btn.appendTo($("div.list-group")); //div안 써도 됨.

        var a=$("<a>");
        a.addClass("btn").addClass("btn-danger");
        a.text("x");
        a.attr('href', '#');
        a.attr('data-id', id);
        a.appendTo(btn);

      //  console.log("--------------------------Del event는 여기에 등록해야")
        a.on("click", function (evt){
            console.log("evt>>>>>>>>", evt);
            // target-내가 클릭한 개체.
            console.log("currentTarget>>>>>>>>", evt.currentTarget);
            evt.preventDefault();
            var $btnDel=$(evt.target);
            console.log(">>>>>$btnDel & data-id>", $btnDel, $btnDel.attr('data-id'));
            console.log(">>>>>$btnDel & data-id>", $btnDel, $btnDel.data('id')); //data라는 것을 많이 써서, 위와 동일. 51'37
            delTest( $btnDel.data('id') );
        })

        var span=$("<span>");
        span.addClass("badge").addClass("bg-primary").addClass("badge-pill");
        span.text(icode);
        span.appendTo(btn);
    }

    </script>
</head>
<body>
<div class="container">
<h1>I'm Board(<small class="text-muted" id="cnt"></small> )</h1>

       <div class="list-group">
     <!-- <button type="button" class="list-group-item list-group-item-action ptr">
                     The current button
               <a href="#" class="btn btn-danger">x</a>
               <span  class="badge bg-primary badge-pill">14</span>
           </button>
         6강에서  -->
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