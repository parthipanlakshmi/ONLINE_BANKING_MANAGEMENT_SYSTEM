package com.bank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bank.dao.AdminDao;
import com.bank.dto.AdminDto;
import com.bank.model.Admin;
@Service
public class AdminService 
{
	@Autowired
	AdminDao admindao;
	public void adminRegister(AdminDto admindto)
	{
		Admin admin = new Admin();
		admin.setUserId(admindto.getUserId());
		admin.setPassword(admindto.getPassword());
		admindao.save(admin);
	}
	
	public AdminDto adminLogin(String userId,String password)
	{
		AdminDto admindto=new AdminDto();
		Admin admin=admindao.findByUserIdAndPassword(userId, password);
		admindto.setUserId(admin.getUserId());
		admindto.setPassword(admin.getPassword());
		return admindto;
		}
}
