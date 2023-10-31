package com.bank.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bank.model.Admin;

public interface AdminDao extends JpaRepository<Admin, Integer> 
{
	Admin findByUserIdAndPassword(String userId, String password);
}
