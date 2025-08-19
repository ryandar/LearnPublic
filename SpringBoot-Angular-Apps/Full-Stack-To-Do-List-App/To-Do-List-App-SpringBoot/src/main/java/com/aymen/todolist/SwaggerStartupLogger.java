package com.aymen.todolist;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

// Added specifically just to remind me of the swagger url !!!
@Component
public class SwaggerStartupLogger implements CommandLineRunner {

    @Override
    public void run(String... args) {
        String swaggerUrl = "http://localhost:8080/swagger-ui/index.html";
        System.out.println("");
        System.out.println("📘 Swagger UI available at: " + swaggerUrl);
        System.out.println("");
    }
}