package com.example.ajax.controller;

import com.example.ajax.dto.BoardDto;
import com.example.ajax.dto.ResponseDto;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
// @RestController는 return에 있는 값을 그냥 그대로 전달해주는 것.
public class BoardApiController {

    @PostMapping("board/getBoardContent")
    public ResponseDto<Integer> test(@RequestBody BoardDto dto){
        System.out.println("dto======>"+dto.getCmd());

        return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
    }

    //최주호 나만의 블로그, 4강 마지막부분.  페이지 뜨는 지 테스트하기.
    @GetMapping("board/hello")
    public String hello(){
        return "<h1> hello Brian you're phenomenon!!</h1>";
    }

}
