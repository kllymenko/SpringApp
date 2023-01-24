package ua.nure.st.kpp.example.demo.form;

import javax.validation.constraints.*;
import java.math.BigDecimal;

public class AddProductForm {
    @NotNull(message = "Name is required")
    @Size(min=2, max=10, message = "Must be from 2 to 10 characters")
    private String name;

    @NotNull(message = "Price is required")
    @DecimalMin(value = "0.05", inclusive = false, message = "Price must be greater than 0.05")
    @Max(value = 1000, message = "Price must be less than 1000")
    private BigDecimal price;

    @NotNull(message = "Provider is required")
    @Size(min=2, max=15, message = "Must be from 2 to 15 characters")
    private String providerName;

    public AddProductForm(){}

    public AddProductForm(String name, BigDecimal price, String providerName){
        this.name = name;
        this.price = price;
        this.providerName = providerName;
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

    public String getProviderName() {
        return providerName;
    }

    public void setProviderName(String providerName) {
        this.providerName = providerName;
    }
}
