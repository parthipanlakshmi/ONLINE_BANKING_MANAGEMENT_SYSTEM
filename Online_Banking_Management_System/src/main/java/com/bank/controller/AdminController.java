package com.bank.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bank.dto.AdminDto;
import com.bank.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController 
{
	@Autowired
	private AdminService adminservice;
	
	@GetMapping("/adminlogin")
	public String gotToLoginPage() {
		return "loginadmin";
	}
	
	@GetMapping("/adminregister")
	public String goToRegisterPage() {
		return "registeradmin";
	}
	
	@GetMapping("/addaccount")
	public String goToAddAccount() {
		return "addaccount";
	}
	
	@GetMapping("/admindashboard")
	public String goToAdminDashboard() {
		return "admindashboard";
	}
	
	@PostMapping("/adminregister")
	public ModelAndView registerAdmin(@ModelAttribute AdminDto admindto) {
		ModelAndView mv = new ModelAndView();
		
		adminservice.adminRegister(admindto);
		
		mv.addObject("status", "Admin Registered Successfully.");
		mv.setViewName("loginadmin");
		return mv;
	}
	
	@PostMapping("/adminlogin")
	public ModelAndView registerLogin(@RequestParam("userId") String userId, @RequestParam("password") String password, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		AdminDto admindto = adminservice.adminLogin(userId, password);
		
		if(admindto != null) {
			HttpSession session = request.getSession();
			session.setAttribute("active-user", admindto);
			session.setAttribute("user-login","admindto");
			mv.addObject("status", "Admin Logged in Successfully.");
			mv.setViewName("index");
		}
		
		else {
			mv.addObject("status", "Failed to login admin.");
			mv.setViewName("index");
		}
		
		
		return mv;
	}
	
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		session.invalidate();
		mv.addObject("status", "Logged out sucessfully!");
		mv.setViewName("index");
		return mv;
	}

}
