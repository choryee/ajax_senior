package com.example.ajax.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
//@RestController
public class BoardWebController {




    @RequestMapping("/getBoardList")
    public String boardList(){
    return "board/testboard22";
    // return "<h1> hello Brian you're phenomenon!!</h1>";
 }
}
