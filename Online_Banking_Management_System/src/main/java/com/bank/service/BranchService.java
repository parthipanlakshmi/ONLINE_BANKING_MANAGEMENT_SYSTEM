package com.bank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bank.dao.BranchDao;
import com.bank.dto.BranchDto;
import com.bank.model.Branch;

@Service
public class BranchService 
{
	@Autowired
	BranchDao branchdao;
	public void saveBranch(BranchDto branchdto)
	{
		Branch branch=new Branch();
		branch.setId(branchdto.getId());
		branch.setName(branchdto.getName());
		branch.setCity(branchdto.getCity());
		branch.setState(branchdto.getState());
		branchdao.save(branch);
	}
}
