package com.java456.dao;


import java.util.List;
import java.util.Map;

import com.java456.entity.Client;


public interface ClientDao {
	
	
	public Integer add(Client client);
	
	public Integer update(Client client);
	
	public List<Client> list(Map<String,Object> map);
	
	public Integer getTotal(Map<String,Object> map);
	
	public Client list_heji(Map<String,Object> map);
	
	
	
	public Client findById(Integer id);
	
	public Client findByWXUserId(Integer wxId);
	
	public Client finbByOpenid(String openid);
	
	public Integer delete(Integer id);
	
}
