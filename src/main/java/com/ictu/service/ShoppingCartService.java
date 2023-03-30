package com.ictu.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.ictu.dto.CartItem;
import com.ictu.entity.Product;

@Service
@SessionScope
public class ShoppingCartService {
	private Map<Integer, CartItem> map = new HashMap<Integer, CartItem>();

	public void add(CartItem item) {
		CartItem existedItem = map.get(item.getProductId());
		if (existedItem != null) {
			existedItem.setQuantity(item.getQuantity() + existedItem.getQuantity());
			existedItem.setTotalPrice(item.getTotalPrice() + existedItem.getUnitPrice() * existedItem.getQuantity());
		} else {
			map.put(item.getProductId(), item);
		}

	}

	public int getCount() {
		if (map.isEmpty()) {
			return 0;
		}
		return map.values().size();
	}

	public void clear() {
		map.clear();
	}

	public Collection<CartItem> getCartItems() {
		return map.values();
	}

	public void remove(CartItem item) {
		map.remove(item.getProductId());
	}

	public void remove(Product product) {
	}
}
