package com.cos.mustacheTest;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.cos.mustacheTest.Repository")
public class SpringBasballApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringBasballApplication.class, args);
	}

}
