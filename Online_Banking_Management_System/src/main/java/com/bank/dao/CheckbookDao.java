package com.bank.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bank.model.Checkbook;

public interface CheckbookDao extends JpaRepository<Checkbook, Integer> 
{
	Checkbook findByCustomerId(int customerId);
}
