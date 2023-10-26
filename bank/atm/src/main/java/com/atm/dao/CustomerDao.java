package com.atm.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.atm.model.Customer;

@Repository
public interface CustomerDao extends JpaRepository<Customer, Integer> {
	
	Customer findByEmailIdAndPassword(String emailId, String password);
	Customer findByEmailId(String emailId);

}
