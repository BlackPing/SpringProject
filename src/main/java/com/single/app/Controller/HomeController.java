package com.single.app.Controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @�ۼ���	black_ping
 * @since	2020-03-09
 * @Method	��Ʈ�ѷ� �׽�Ʈ
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
	
	@GetMapping(value = "/gridstack")
	public String gridstack(Locale locale, Model model) {
		return "gridstack";
	}
	
	@GetMapping(value = "/page1")
	public String page1(Locale locale, Model model) {
		return "page1";
	}
	
	@GetMapping(value = "/page2")
	public String page2(Locale locale, Model model) {
		return "page2";
	}
}
