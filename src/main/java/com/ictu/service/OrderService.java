package com.ictu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ictu.entity.Order;
import com.ictu.repository.OrderRepository;

@Service
public class OrderService {
	@Autowired
	OrderRepository orderRepository;

	public List<Order> listAll() {
		return (List<Order>) orderRepository.findAll();
	}
}
