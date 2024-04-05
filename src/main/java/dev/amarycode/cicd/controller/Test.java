package dev.amarycode.cicd.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
public class Test {

    @GetMapping("/")
    public Map<String, Object> index(){

        Map<String, Object> map = new HashMap<>();
        map.put("message", "Hello World");

        return map;
    }

}
