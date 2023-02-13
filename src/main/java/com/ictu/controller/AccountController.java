package com.ictu.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ictu.entity.Customer;
import com.ictu.repository.CustomersRepository;
import com.ictu.repository.OrderRepository;
import com.ictu.service.ShoppingCartService;
import com.ictu.service.WishListService;

@Controller
public class AccountController extends CommonController {

	@Autowired
	ShoppingCartService shoppingCartService;

	@Autowired
	CustomersRepository customersRepository;

	@Autowired
	OrderRepository orderRepository;

	@Autowired
	WishListService wishListService;

	@GetMapping(value = "/account")
	public String account(Model model, Principal principal) {

		model.addAttribute("customer", new Customer());
		Customer customer = customersRepository.FindByEmail(principal.getName()).get();
		model.addAttribute("customer", customer);

		List<Object[]> listO2 = orderRepository.orderByCustomerId(customer.getCustomerId());
		model.addAttribute("orders2", listO2);

		model.addAttribute("totalCartItemWishs", wishListService.getCount());
		model.addAttribute("totalCartItems", shoppingCartService.getCount());

		return "site/account";
	}

}
