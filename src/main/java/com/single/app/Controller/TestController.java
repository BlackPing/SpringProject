package com.single.app.Controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.single.app.Util.Interface.StatusInterface;

@Controller
public class TestController {
	@Autowired
	StatusInterface status;
	
	@GetMapping(value = "/test2")
	public String test2(Locale locale, Model model) {
		return "home";
	}
}
