/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import daos.GenericDAO;
import icontrollers.ICustomerController;
import idaos.IGenericDAO;
import java.math.BigDecimal;
import java.util.List;
import models.Customer;
import models.District;
import models.Province;
import models.Subdistrict;
import models.Urbanvillage;
import org.hibernate.SessionFactory;
import tools.HibernateUtil;

/**
 *
 * @author Bella
 */
public class CustomerController implements ICustomerController{

    private IGenericDAO iGenericDAO;
    SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
    
    public CustomerController(){
        iGenericDAO = new GenericDAO(Customer.class, sessionFactory);
    }
    
    @Override
    public List<Customer> getAll() {
        return iGenericDAO.getAll();
    }

    @Override
    public Customer getById(String id) {
        return (Customer) iGenericDAO.getById(id);
    }

    @Override
    public List<Customer> getByName(String name) {
        return iGenericDAO.getByName(name);
    }

    @Override
    public String insert(String name, String pic, String address, String province, String district, String subdistrict, String urbanvillage, String phone, String email) {
        String result = "";
        Customer customer = new Customer(name, pic, address, phone, email, 
                new District(new BigDecimal(district)), 
                new Province(new BigDecimal(province)), 
                new Subdistrict(new BigDecimal(subdistrict)),
                new Urbanvillage(new BigDecimal(urbanvillage)));
        if(iGenericDAO.insert(customer)){
            result = "Data berhasil disimpan";
        }else{
            result = "Maaf Data gagal disimpan";
        }
        return result;
    }

    @Override
    public String Update(String id, String name, String pic, String address, String province, String district, String subdistrict, String urbanvillage, String phone, String email) {
        String result = "";
        Customer customer = new Customer(new BigDecimal(id), name, pic, address, phone, email, 
                new District(new BigDecimal(district)), 
                new Province(new BigDecimal(province)), 
                new Subdistrict(new BigDecimal(subdistrict)),
                new Urbanvillage(new BigDecimal(urbanvillage)));
        if(iGenericDAO.insert(customer)){
            result = "Data berhasil disimpan";
        }else{
            result = "Maaf Data gagal disimpan";
        }
        return result;
    }
    
    @Override
    public String delete(String id) {
        String result = "";
        Customer customer = new Customer(new BigDecimal(id));
        if(iGenericDAO.delete(customer)){
            result = "Data berhasil dihapus";
        }else{
            result = "maaf data gagal dihapus";
        }
        return result;
    }

}
