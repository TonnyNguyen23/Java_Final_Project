/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package context;

import dao.DAO;
import entity.Product;
import java.util.List;

/**
 *
 * @author Admin
 */
public class TestDB {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        DAO pDAO = new DAO();
        List<Product> list = pDAO.getAllProduct();
         for(Product st : list){
            System.out.println(st.toString());
        }
    }
    
}
