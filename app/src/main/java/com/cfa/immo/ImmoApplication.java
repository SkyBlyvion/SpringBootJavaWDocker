package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ImmoApplication {

	public static void test() {
		System.out.println("test");
	}

	public static void main(String[] args) {
		SpringApplication.run(ImmoApplication.class, args);
	}

}
