package com.example.ajax.controller;

import com.example.ajax.dto.BoardDto;
import com.example.ajax.dto.ResponseDto;
import com.example.ajax.model.User33;
import com.example.ajax.repository.UserRepository;
import com.fasterxml.jackson.annotation.JacksonInject;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
//@RequiredArgsConstructor
// @RestController는 return에 있는 값을 그냥 그대로 전달해주는 것.
public class BoardApiController {


   //private final UserRepository userRepository;

    @Autowired
    UserRepository userRepository;

    @GetMapping("board/getOne")
    public void getOne(@RequestBody User33 user33){
        System.out.println("get=======>"+user33.getUsername());
        //userRepository.findAllById(user33.getId());

    }

    @PostMapping("board/getall")
    public ResponseDto<Integer> findAll(@RequestBody User33 user33){
        System.out.println("getUsername()======>"+user33.getUsername());
        userRepository.findAll();
        System.out.println("test++++++++++>"+userRepository.findAll());
        return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
    }

    @PostMapping("board/getList")
    public List<User33>  getList(){
      //  List<User33> list= userRepository.findAll();
        return  userRepository.findAll();
    }

    @PostMapping("board/save")
    public User33 save(@RequestBody User33 user33){
        System.out.println("User33========>>"+user33.getPassword());
        // 포스트맨으로 하니, 밑의 객체를  return이 json로 함.
        return userRepository.save(user33);
    }

    @DeleteMapping("board/delete/{id}")
  //  public void delete(@PathVariable("id") Integer id, @RequestBody User33 user33){
    public ResponseDto<Integer> delete(@PathVariable("id") Integer id){
         userRepository.deleteById(id);
         return new ResponseDto<Integer>(HttpStatus.OK.value(), 1);
    }


    @GetMapping("board/getBoardContent")
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
