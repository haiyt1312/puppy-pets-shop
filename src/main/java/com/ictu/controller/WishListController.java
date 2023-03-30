package com.ictu.controller;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.ictu.dto.CartItemWish;
import com.ictu.entity.Product;
import com.ictu.repository.ProductRepository;
import com.ictu.service.ShoppingCartService;
import com.ictu.service.WishListService;

@Controller
public class WishListController extends CommonController {
	@Autowired
	ShoppingCartService shoppingCartService;

	@Autowired
	WishListService wishListService;

	@Autowired
	ProductRepository productRepository;

	@Autowired
	HttpSession session;

	@GetMapping(value = "/wishlist")
	public String getWishList(Model model) {

		Collection<CartItemWish> cartItemWishs = wishListService.getCartItemWishs();
		model.addAttribute("cartItemWishs", cartItemWishs);

		model.addAttribute("totalCartItemWishs", wishListService.getCount());
		model.addAttribute("totalCartItems", shoppingCartService.getCount());
		return "site/wishList";
	}

	@GetMapping(value = "/addToWish")
	public String addToWishList(@RequestParam("productId") Integer productId, HttpServletRequest request, Model model) {

		Product product = productRepository.findById(productId).orElse(null);

		session = request.getSession();
		Collection<CartItemWish> cartItemWishs = wishListService.getCartItemWishs();
		if (product != null) {
			CartItemWish item = new CartItemWish();
			BeanUtils.copyProperties(product, item);
			item.setProduct(product);
			item.setProductId(productId);
			wishListService.add(item);
		}
		session.setAttribute("cartItemWishs", cartItemWishs);
		model.addAttribute("totalCartItemWishs", wishListService.getCount());
		model.addAttribute("totalCartItems", shoppingCartService.getCount());

		return "redirect:/products";
	}

	@SuppressWarnings("unlikely-arg-type")
	@GetMapping(value = "/removeWish/{id}")
	public String removeWishList(@PathVariable("id") Integer id, HttpServletRequest request, Model model) {
		Product product = productRepository.findById(id).orElse(null);

		Collection<CartItemWish> cartItemWishs = wishListService.getCartItemWishs();
		session = request.getSession();
		if (product != null) {
			CartItemWish item = new CartItemWish();
			BeanUtils.copyProperties(product, item);
			item.setProduct(product);
			cartItemWishs.remove(session);
			wishListService.remove(item);
		}
		model.addAttribute("totalCartItemWishs", wishListService.getCount());
		model.addAttribute("totalCartItems", wishListService.getCount());

		return "redirect:/wishlist";
	}
}
