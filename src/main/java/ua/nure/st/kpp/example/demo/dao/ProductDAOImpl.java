package ua.nure.st.kpp.example.demo.dao;


import ua.nure.st.kpp.example.demo.entity.Product;

import java.math.BigDecimal;
import java.sql.*;
import java.util.*;

public class ProductDAOImpl implements ProductDAO {

    private static final String SQL_INSERT_PRODUCT = "INSERT INTO product (product_name, product_price, provider_id) VALUES (?, ?, ?)";
    private static final String SQL_GET_PRODUCT_BY_PROVIDER = "SELECT * FROM product JOIN provider ON product.provider_id = provider.provider_id WHERE provider_company = ?";
    private static final String SQL_GET_MAP_PRODUCTS = "SELECT * FROM product JOIN provider ON product.provider_id = provider.provider_id ORDER BY product_id";
    private static final String SQL_GET_PROVIDER_BY_COMPANY = "SELECT * FROM provider WHERE provider_company = ?";
    private static final String SQL_SELECT_PROVIDERS = "SELECT * FROM provider";
    private static final String SQL_UPDATE_PRODUCT_ID = "UPDATE product SET provider_id = ? WHERE product_id = ?";
    private static final String SQL_UPDATE_PRODUCT_PRICE = "UPDATE product SET product_price = ? WHERE product_id = ?";
    private static final String SQL_UPDATE_PRODUCT_NAME = "UPDATE product SET product_name = ? WHERE product_id = ?";
    private static final String SQL_DELETE_PRODUCT_FROM_ORDER = "DELETE FROM order_has_product WHERE product_id = ?";
    private static final String SQL_DELETE_PRODUCT = "DELETE FROM product WHERE product_id = ?";


    private final String url;
    private final Properties dbProps = new Properties();

    public ProductDAOImpl(DAOConfig config) {
        url = config.getUrl();
        dbProps.setProperty("user", config.getUser());
        dbProps.setProperty("password", config.getPassword());
    }

    private static void close(AutoCloseable ac) {
        if (ac != null) {
            try {
                ac.close();
            } catch (Exception e) {
                // nothing
            }
        }
    }

    private Connection getConnection() throws SQLException {
        return getConnection(true);
    }

    private Connection getConnection(boolean autoCommit) throws SQLException {
        Connection con = DriverManager.getConnection(url, dbProps);
        con.setAutoCommit(autoCommit);
        return con;
    }

    private void rollback(Connection con) {
        if (con != null) {
            try {
                con.rollback();
            } catch (SQLException e) {
                // nothing to do
            }
        }
    }

    @Override
    public List<Product> getProductByProvider(String providerName) throws SQLException {
        try (Connection con = getConnection()) {
            try (PreparedStatement st = con.prepareStatement(SQL_GET_PRODUCT_BY_PROVIDER)) {
                st.setString(1, providerName);
                try (ResultSet rs = st.executeQuery()){
                    List<Product> products = new ArrayList<>();
                    while (rs.next()){
                        products.add(new Product(rs.getString("product_name"), rs.getBigDecimal("product_price"), rs.getInt("provider_id")));
                    }
                    return products;
                }
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
            throw e;
        }
    }

    @Override
    public Map<Product, String> getMapProducts() throws SQLException {
        try (Connection con = getConnection()) {
            try (Statement st = con.createStatement()) {
                try (ResultSet rs = st.executeQuery(SQL_GET_MAP_PRODUCTS)) {
                    Map<Product, String> productProviderMap = new LinkedHashMap<>();
                    while (rs.next()) {
                        productProviderMap.put(mapProduct(rs), rs.getString("provider_company"));
                    }
                    return productProviderMap;
                }
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
            throw e;
        }
    }


    @Override
    public void insertProduct(Connection con, Product product) throws SQLException {
        try (PreparedStatement st = con.prepareStatement(SQL_INSERT_PRODUCT)) {
            st.setString(1, product.getName());
            st.setBigDecimal(2, product.getPrice());
            st.setInt(3, product.getProviderId());
            st.executeUpdate();
        }
    }

    @Override
    public void insertProductByProvider(String name, BigDecimal price, String providerName) throws SQLException {
        Connection con = null;
        int providerID;
        try {
            con = getConnection(false);
            con.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
            try (PreparedStatement st = con.prepareStatement(SQL_GET_PROVIDER_BY_COMPANY)) {
                st.setString(1, providerName);
                try (ResultSet rs = st.executeQuery()) {
                    rs.next();
                    providerID = rs.getInt("provider_id");
                    insertProduct(con, new Product(name, price, providerID));
                    con.commit();
                }
            }
        } catch (SQLException e) {
            rollback(con);
            System.err.println(e.getMessage());
            throw e;
        } finally {
            close(con);
        }
    }


    @Override
    public void deleteProductByID(int id) throws SQLException {
        Connection con = null;
        try {
            con = getConnection(false);
            con.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
            try (PreparedStatement st = con.prepareStatement(SQL_DELETE_PRODUCT_FROM_ORDER)) {
                st.setInt(1, id);
                st.executeUpdate();
                try (PreparedStatement st1 = con.prepareStatement(SQL_DELETE_PRODUCT)) {
                    st1.setInt(1, id);
                    st1.executeUpdate();
                    con.commit();
                }
            }
        } catch (SQLException e) {
            rollback(con);
            System.err.println(e.getMessage());
            throw e;
        } finally {
            close(con);
        }
    }

    @Override
    public void changeProductName(int id, String newName) throws SQLException {
        Connection con = null;
        try {
            con = getConnection(false);
            con.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
            try (PreparedStatement st = con.prepareStatement(SQL_UPDATE_PRODUCT_NAME)) {
                st.setString(1, newName);
                st.setInt(2, id);
                st.executeUpdate();
                con.commit();
            }
        } catch (SQLException e) {
            rollback(con);
            System.err.println(e.getMessage());
            throw e;
        } finally {
            close(con);
        }
    }

    @Override
    public void changeProductPrice(int id, BigDecimal price) throws SQLException {
        Connection con = null;
        try {
            con = getConnection(false);
            con.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
            try (PreparedStatement st = con.prepareStatement(SQL_UPDATE_PRODUCT_PRICE)) {
                st.setBigDecimal(1, price);
                st.setInt(2, id);
                st.executeUpdate();
                con.commit();
            }
        } catch (SQLException e) {
            rollback(con);
            System.err.println(e.getMessage());
            throw e;
        } finally {
            close(con);
        }
    }

    @Override
    public void changeProductProvider(int id, String providerName) throws SQLException {
        int newProviderID;
        Connection con = null;
        try {
            con = getConnection(false);
            con.setTransactionIsolation(Connection.TRANSACTION_READ_COMMITTED);
            try (PreparedStatement st = con.prepareStatement(SQL_GET_PROVIDER_BY_COMPANY)) {
                st.setString(1, providerName);
                try (ResultSet rs = st.executeQuery()) {
                    rs.next();
                    newProviderID = rs.getInt("provider_id");
                    try (PreparedStatement st1 = con.prepareStatement(SQL_UPDATE_PRODUCT_ID)) {
                        st1.setInt(1, newProviderID);
                        st1.setInt(2, id);
                        st1.executeUpdate();
                        con.commit();
                    }
                }
            }
        } catch (SQLException e) {
            rollback(con);
            System.err.println(e.getMessage());
            throw e;
        } finally {
            close(con);
        }
    }

    @Override
    public List<String> providerNames() throws SQLException {
        try (Connection con = getConnection()) {
            try (Statement st = con.createStatement()) {
                try (ResultSet rs = st.executeQuery(SQL_SELECT_PROVIDERS)) {
                    List<String> names = new ArrayList<>();
                    while (rs.next()) {
                        names.add(rs.getString("provider_company"));
                    }
                    return names;
                }
            }
        } catch (SQLException e) {
            System.err.println(e.getMessage());
            throw e;
        }
    }

    private Product mapProduct(ResultSet rs) throws SQLException {
        Product p = new Product();
        p.setID(rs.getInt("product_id"));
        p.setName(rs.getString("product_name"));
        p.setPrice(rs.getBigDecimal("product_price"));
        p.setProviderId(rs.getInt("provider_id"));
        return p;
    }
}
