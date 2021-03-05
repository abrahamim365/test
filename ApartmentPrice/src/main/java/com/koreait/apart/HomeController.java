package com.koreait.apart;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.koreait.apart.model.ApartmentInfoEntity;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private HomeService service;
	
	@GetMapping("/")
	public String home(ApartmentInfoEntity p, Model model) {
		model.addAttribute("location_cd", p.getLocation_cd());
		return "home";
	}
	
	@GetMapping("/result") //내일 이부분을 post로 바꾼다.
	public String result(ApartmentInfoEntity p, Model model) {
		model.addAttribute("list",service.getData(p));
		return "result";
	}
	
}
