package com.example.helloswagger;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
@Tag(name = "Hello")
public class HelloController {

    @Operation(summary = "Say hello", description = "Returns a friendly greeting.")
    @GetMapping("/hello")
    public String hello() {
        return "Hello, World!";
    }
}
