package net.xzh.webflux.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import net.xzh.webflux.model.User;
import net.xzh.webflux.service.UserSerivice;
import reactor.core.publisher.Mono;

/**
 * @Version: 1.0
 * @Desc:
 */
@RestController
public class UserController {

	@Autowired
	UserSerivice userSerivice;

	@GetMapping("/getUserById/{id}")
	public Mono<User> getUserById(@PathVariable Long id) {
		return userSerivice.getUserById(id);
	}
}
