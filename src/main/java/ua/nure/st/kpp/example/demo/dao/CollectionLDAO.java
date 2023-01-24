package ua.nure.st.kpp.example.demo.dao;

import ua.nure.st.kpp.example.demo.entity.Product;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class CollectionLDAO implements ProductDAO {

    private static List<Product> products = new ArrayList<>();


    @Override
    public List<Product> getProductByProvider(String providerName) throws SQLException {
        return null;
    }


    @Override
    public Map<Product, String> getMapProducts() throws SQLException {
        return null;
    }

    @Override
    public void insertProduct(Connection con, Product product) throws SQLException {

    }

    @Override
    public void insertProductByProvider(String name, BigDecimal price, String providerName) throws SQLException {

    }


    @Override
    public void deleteProductByID(int id) throws SQLException {

    }

    @Override
    public void changeProductName(int id, String newName) throws SQLException {

    }

    @Override
    public void changeProductPrice(int id, BigDecimal price) throws SQLException {

    }

    @Override
    public void changeProductProvider(int id, String providerName) throws SQLException {

    }

    @Override
    public List<String> providerNames() throws SQLException {
        return null;
    }
}
