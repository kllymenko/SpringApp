package ua.nure.st.kpp.example.demo.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import ua.nure.st.kpp.example.demo.entity.Product;

@Service
public interface ProductDAO {

    List<Product> getProductByProvider(String providerName) throws SQLException;

    Map<Product, String> getMapProducts() throws SQLException;

    void insertProduct(Connection con, Product product) throws SQLException;

    void insertProductByProvider(String name, BigDecimal price, String providerName) throws SQLException;

    void deleteProductByID(int id) throws SQLException;

    void changeProductName(int id, String newName) throws SQLException;

    void changeProductPrice(int id, BigDecimal price) throws SQLException;

    void changeProductProvider(int id, String providerName) throws SQLException;

    List<String> providerNames() throws SQLException;

}
