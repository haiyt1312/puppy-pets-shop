package com.ictu.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ictu.entity.Category;
import com.ictu.entity.Customer;
import com.ictu.entity.Supplier;
import com.ictu.repository.CategoryRepository;
import com.ictu.repository.SuppliersRepository;
import com.ictu.service.ShoppingCartService;

@Controller
@RequestMapping(value = "/")
public class CommonController {
	@Autowired
	ShoppingCartService shoppingCartService;

	@Autowired
	CategoryRepository categoryRepository;

	@Autowired
	SuppliersRepository suppliersRepository;

	@ModelAttribute(value = "customer")
	public Customer initCustomer(Principal principal) {
		Customer customer = new Customer();
		if (principal != null) {
			customer = (Customer) ((Authentication) principal).getPrincipal();
		}
		return customer;
	}

	@ModelAttribute("categoryList")
	public List<Category> showCategory(Model model) {
		List<Category> categoryList = categoryRepository.findAll();
		model.addAttribute("categoryList", categoryList);

		return categoryList;
	}

	@ModelAttribute("supplierList")
	public List<Supplier> supplierList(Model model) {
		List<Supplier> supplierList = suppliersRepository.findAll();
		model.addAttribute("supplierList", supplierList);

		return supplierList;
	}
}
