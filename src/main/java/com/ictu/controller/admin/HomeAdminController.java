package com.ictu.controller.admin;

import java.math.BigInteger;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.ictu.entity.Customer;
import com.ictu.repository.CustomersRepository;
import com.ictu.repository.OrderDetailRepository;

@Controller
public class HomeAdminController {
	@Autowired
	CustomersRepository customersRepository;

	@Autowired
	OrderDetailRepository orderDetailRepository;

	@GetMapping(value = "admin/home")
	public String indexAdmin(Model model, Principal principal) {
		model.addAttribute("customer", new Customer());
		Customer customer = customersRepository.FindByEmail(principal.getName()).get();
		model.addAttribute("customer", customer);

		List<Object[]> dashboard = customersRepository.getDashboard();
		model.addAttribute("dashboard", dashboard);

		Date year = new Date();
		List<Object[]> repoMonth = orderDetailRepository.repoMonth(year);
		List<Double> data = new ArrayList<Double>();
		for (Object[] objectArray : repoMonth) {
			for (Object object : objectArray) {
				data.add((Double) object);
			}
		}
		model.addAttribute("data", data);

		List<Object[]> repoCategory = orderDetailRepository.repoCategory();
		List<BigInteger> dataCategory = new ArrayList<BigInteger>();
		for (Object[] objectArray : repoCategory) {
			for (Object object : objectArray) {
				dataCategory.add((BigInteger) object);
			}
		}
		model.addAttribute("dataCategory", dataCategory);

		return "admin/index";
	}
}
