package com.example.helloswagger;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RootRedirectController {

    @GetMapping("/")
    public String index() {
        // Redirect root URL to Swagger UI for zero-click discovery
        return "redirect:/swagger";
    }
}
