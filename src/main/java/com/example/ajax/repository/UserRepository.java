package com.example.ajax.repository;

import com.example.ajax.model.User33;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User33, Integer>  {

    //Optional<User22> findAll(String password);
}
