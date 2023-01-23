//package com.example.ajax.service;
//
//import com.example.ajax.model.User22;
//import com.example.ajax.repository.UserRepository;
//import lombok.RequiredArgsConstructor;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
//
//@Service
//@RequiredArgsConstructor
//public class UserService {
//
//    @
//    private final UserRepository userRepository;
//
//    @Transactional(readOnly = true)
//    public User22 find(String password) {
//        User22 user22 = userRepository.findAll(password).orElseThrow(() -> {
//            return new IllegalArgumentException("회원 찾기 실패");
//        });
//        return user22;
//    }
//}
