package com.bank.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bank.model.Customer;

public interface CustomerDao extends JpaRepository<Customer, Integer> 
{
	Customer findByEmailIdAndPassword(String emailId, String password);
	Customer findByEmailId(String emailId);

}
