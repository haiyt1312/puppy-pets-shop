package com.ictu.controller.admin;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.ictu.controller.CommonController;
import com.ictu.entity.Category;
import com.ictu.repository.CategoryRepository;
import com.ictu.repository.CustomersRepository;

@Controller
public class CategoryController extends CommonController {
	@Autowired
	CategoryRepository categoryRepository;

	@Autowired
	CustomersRepository customersRepository;

	@ModelAttribute("categories")
	public List<Category> showCategory(Model model) {
		List<Category> categories = categoryRepository.findAll();
		model.addAttribute("categories", categories);

		return categories;
	}

	@GetMapping(value = "/admin/categories")
	public String categories(Model model, Principal principal) {
		Category category = new Category();
		model.addAttribute("category", category);

		return "admin/categories";
	}

	@PostMapping(value = "/addCategory")
	public String addCategory(@Validated @ModelAttribute("category") Category category, ModelMap model,
			BindingResult bindingResult) {

		if (bindingResult.hasErrors()) {
			model.addAttribute("error", "failure");

			return "admin/categories";
		}

		categoryRepository.save(category);
		model.addAttribute("message", "successful!");

		return "redirect:/admin/categories";
	}

	@GetMapping(value = "/editCategory/{id}")
	public String editCategory(@PathVariable("id") Integer id, ModelMap model) {
		Category category = categoryRepository.findById(id).orElse(null);

		model.addAttribute("category", category);

		return "admin/editCategory";
	}

	@GetMapping("/delete/{id}")
	public String delCategory(@PathVariable("id") Integer id, Model model) {

		try {
			categoryRepository.deleteById(id);
			model.addAttribute("message", "Delete successful!");
		} catch (Exception e) {
			return "site/notFound";
		}

		return "redirect:/admin/categories";
	}
}
