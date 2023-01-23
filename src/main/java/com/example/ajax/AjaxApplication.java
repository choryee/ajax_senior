package com.example.ajax;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(scanBasePackages = {"com.example.ajax.repository", "com.example.ajax.controller",
"com.example.ajax.dto"})
//@SpringBootApplication
public class AjaxApplication {

    public static void main(String[] args) {
        SpringApplication.run(AjaxApplication.class, args);
    }

}
