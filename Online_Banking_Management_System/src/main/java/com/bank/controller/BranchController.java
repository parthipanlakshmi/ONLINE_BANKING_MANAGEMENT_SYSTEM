package com.bank.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bank.dto.BranchDto;
import com.bank.service.BranchService;

@Controller
public class BranchController 
{
    @Autowired
    BranchService branchservice;
	
	@GetMapping("/addbranch")
	public String gotToLoginPage() {
		return "addbranch";
	}
	
	@PostMapping("/addbranch")
	public ModelAndView addBranch(@ModelAttribute BranchDto branchdto) {
      ModelAndView mv = new ModelAndView();
		
		branchservice.saveBranch(branchdto);
		
		mv.addObject("status", "Branch Added Successfully.");
		mv.setViewName("index");
		return mv;
	}

}
