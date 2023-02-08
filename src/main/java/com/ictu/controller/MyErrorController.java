package com.ictu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ictu.service.ShoppingCartService;
import com.ictu.service.WishListService;

@Controller
public class MyErrorController implements ErrorController {

	@Autowired
	ShoppingCartService shoppingCartService;

	@Autowired
	WishListService wishListService;

	@RequestMapping("/error")
	public String handleError(Model model) {
		model.addAttribute("totalCartItemWishs", wishListService.getCount());
		model.addAttribute("totalCartItems", shoppingCartService.getCount());
		return "site/notFound";
	}

	public String getErrorPath() {
		return null;
	}

}
