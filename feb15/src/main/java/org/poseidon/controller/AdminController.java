package org.poseidon.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

//administrator = admin
//root
@Controller
@RequestMapping("/admin")
public class AdminController {

	// http://localhost/web/admin/index
	// 경로----------------------

	@GetMapping("/")
	public String index() {
		return "admin/index";
	}

	@GetMapping("/index")
	public String index2() {
		return "admin/index";
	}

	@GetMapping("/login")
	public String login() {
		return "admin/login";
	}

	@GetMapping("/join")
	public String join() {
		return "admin/join";
	}

}
