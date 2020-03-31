package com.single.app.Controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @작성자	black_ping
 * @since	2020-03-09
 * @Method	컨트롤러 테스트
 */

@Controller
public class HomeController {
	@Value("${test.path}")
	public String value;
	
	@GetMapping(value = "/")
	public String home(Locale locale, Model model) {
		return "home";
	}
	
	@GetMapping(value = "/test")
	public String home2(Locale locale, Model model) {
		return "home";
	}
}
