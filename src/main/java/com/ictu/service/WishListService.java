package com.ictu.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.ictu.dto.CartItemWish;
import com.ictu.entity.Product;

@Service
public class WishListService {
	private Map<Integer, CartItemWish> map = new HashMap<Integer, CartItemWish>();

	public void clear() {
		map.clear();
	}

	public Collection<CartItemWish> getCartItemWishs() {
		return map.values();
	}

	public void remove(CartItemWish item) {
		map.remove(item.getProductId());
	}

	public void add(CartItemWish item) {
		CartItemWish existedItem = map.get(item.getProductId());
		if (existedItem != null) {
			existedItem.setUnitPrice(item.getUnitPrice());
//			existedItem.setQuantity(item.getQuantity() + existedItem.getQuantity());
//			existedItem.setTotalPrice(item.getTotalPrice() + existedItem.getUnitPrice() * existedItem.getQuantity());
		} else {
			map.put(item.getProductId(), item);
		}
	}

	public void remove(Product product) {

	}

	public int getCount() {
		if (map.isEmpty()) {
			return 0;
		}
		return map.values().size();
	}
}
