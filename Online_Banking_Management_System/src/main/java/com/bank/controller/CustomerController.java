package com.bank.controller;



import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bank.dao.CustomerDao;
import com.bank.model.Customer;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CustomerController 
{
	@Autowired
	private CustomerDao customerDao;
	
	@GetMapping("/")
	public String gotToIndexPage() {
		return "index";
	}
	
	@GetMapping("/home")
	public String gotToHomePage() {
		return "index";
	}
	
	@GetMapping("/updateuser")
	public String gotToUpdatePage() {
		return "updatecustomer";
	}
	
	@GetMapping("/customerlogin")
	public String gotToLoginPage() {
		return "login";
	}
	
	@GetMapping("/customerregister")
	public String goToRegisterPage() {
		return "registeruser";
		
		
	}
	@GetMapping("/contactus")
	public String goTocontactus() {
		return "contactus";
		
		
	}
	
	@PostMapping("/registercustomer")
	public ModelAndView registerCustomer(@ModelAttribute Customer customer) {
		ModelAndView mv = new ModelAndView();
		
		Customer c = customerDao.save(customer);
		
		mv.addObject("status", "Customer Successfully Registered, Customer Id is "+c.getId());
		mv.setViewName("addaccount");
		return mv;
	}
	
	@PostMapping("/updateuser")
	public ModelAndView updateCustomer(@RequestParam("id") Integer id,@RequestParam("phoneNumber") String phoneNumber,@RequestParam("emailId") String emailId,@RequestParam("presentAddress") String presentAddress)
	{
		ModelAndView mv = new ModelAndView();
		Optional<Customer> optional=customerDao.findById(id);
		if(optional.isPresent()) 
		{
		Customer customer1=optional.get();
		customer1.setPhoneNumber(phoneNumber);
		customer1.setEmailId(emailId);
		customer1.setPresentAddress(presentAddress);
		customerDao.save(customer1);
		
		mv.addObject("status","customer detail is updated");
		mv.setViewName("index");
		}
		else
		{
			mv.addObject("status", "customer is not available");
			mv.setViewName("index");
		}
		
		return mv;
	}
	
	@PostMapping("/logincustomer")
	public ModelAndView loginCustomer(@RequestParam("emailId") String emailId, @RequestParam("password") String password, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		Customer c = customerDao.findByEmailIdAndPassword(emailId, password);
		
		if(c != null) {
			HttpSession session = request.getSession();
			session.setAttribute("active-user", c);
			session.setAttribute("user-login","customer");
			mv.addObject("status", "Customer Logged in Successfully.");
			mv.setViewName("index");
		}
		
		else {
			mv.addObject("status", "Failed to login Customer.");
			mv.setViewName("index");
		}
		
		
		return mv;
	}
}
