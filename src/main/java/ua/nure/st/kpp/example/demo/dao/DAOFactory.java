package ua.nure.st.kpp.example.demo.dao;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import javax.naming.ConfigurationException;

@Component
public class DAOFactory {

    DAOConfig config;

    @Bean
    public ProductDAO getProductDAOInstance(DAOConfig config) {
        if (TypeDAO.MySQL.name().equalsIgnoreCase(config.getType())) {
            return new ProductDAOImpl(config);
        }
        if (TypeDAO.COLLECTION.name().equalsIgnoreCase(config.getType())) {
            return new CollectionLDAO();
        }
        throw new RuntimeException(new ConfigurationException("Unknown DAO type: " + config));
    }
}
