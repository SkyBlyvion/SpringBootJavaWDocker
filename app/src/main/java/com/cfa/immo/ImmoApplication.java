package com.cfa.immo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


//TODO: Résoudre le problème Controller
@RestController
@SpringBootApplication
public class ImmoApplication {

	@RequestMapping(value="/", method = RequestMethod.GET)
	public String home() {
		return "bonjour le CFA";
	}


	public static void main(String[] args) {
		SpringApplication.run(ImmoApplication.class, args);
	}

}
