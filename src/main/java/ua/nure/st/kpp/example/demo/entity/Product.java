package ua.nure.st.kpp.example.demo.entity;

import java.math.BigDecimal;

public class Product {
    private int ID;

    private String name;
    private BigDecimal price;
    private int providerId;
    public Product(){}

    public Product (String name, BigDecimal price, int providerId) {
        this.name = name;
        this.price = price;
        this.providerId = providerId;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public int getProviderId() {
        return providerId;
    }

    public void setProviderId(int providerId) {
        this.providerId = providerId;
    }

    @Override
    public String toString() {
        return "Product [id = " + ID + ", name = " + name + ", price = " + price + "]\n";
    }

}
