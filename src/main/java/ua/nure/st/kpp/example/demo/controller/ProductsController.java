package ua.nure.st.kpp.example.demo.controller;

import java.math.BigDecimal;
import java.sql.SQLException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import ua.nure.st.kpp.example.demo.dao.ProductDAO;
import ua.nure.st.kpp.example.demo.entity.Product;
import ua.nure.st.kpp.example.demo.form.AddProductForm;

import javax.validation.Valid;

@Controller
public class ProductsController {

    // Autowire the ProductDAO bean so it can be used in the methods
    @Autowired
    private ProductDAO productDAO;

    // Handle both GET and POST requests to the / and /products routes
    @RequestMapping(value = {"/", "/products"}, method = {RequestMethod.GET, RequestMethod.POST})
    public String showAllProducts(Model model) throws SQLException {
        // Get a map of all products and their corresponding providers
        Map<Product, String> productProviderMap = productDAO.getMapProducts();
        // Add the map to the model so it can be accessed in the view
        model.addAttribute("allProducts", productProviderMap);
        // Return the name of the view template to render
        return "productsPage";
    }

    // Handle GET requests to the /addProduct route
    @GetMapping(value = {"/addProduct"})
    public String showAddProductsView(Model model) throws SQLException {
        // Create a new AddProductForm object and add it to the model
        AddProductForm addProductForm = new AddProductForm();
        model.addAttribute("addProductForm", addProductForm);
        // Get a list of all providers and add it to the model
        List<String> providers = productDAO.providerNames();
        model.addAttribute("providers", providers);
        // Return the name of the view template to render
        return "addProductPage";
    }

    // Handle POST requests to the /addProduct route
    @PostMapping(value = {"/addProduct"})
    public String addProduct(Model model, @Valid AddProductForm addProductForm, BindingResult bindingResult) {
        try {
            // Check if the form has any validation errors
            if (bindingResult.hasErrors()) {
                // If there are errors, get the list of providers and add it to the model
                List<String> providers = productDAO.providerNames();
                model.addAttribute("providers", providers);
                // Add the validation errors to the model
                model.addAttribute("errors", bindingResult.getAllErrors());
                // Return the name of the view template to render
                return "/addProductPage";
            } else {
                // If there are no errors, insert the new product into the database using the DAO
                productDAO.insertProductByProvider(addProductForm.getName(), addProductForm.getPrice(), addProductForm.getProviderName());
            }
        } catch (SQLException e) {
            // If there is a database error, add an error message to the model and return the name of the error template
            model.addAttribute("error", "This product already exists!!!");
            return "/databaseError";
        }
        // If the product was successfully added, redirect to the /products route
        return "redirect:/products";
    }

    // Handle GET requests to the /modalChangeName route
    @GetMapping(value = "/modalChangeName")
    public String modalChangeName(Model model, @RequestParam int prodID) {
        // Add the product ID to the model so it can be accessed in the view
        model.addAttribute("prodID", prodID);
        return "changeName";
    }

    @PostMapping(value = {"/changeProductName"})
    public String changeProductName(@RequestParam int prodID, @RequestParam String newName, Model model) {
        try {
            productDAO.changeProductName(prodID, newName);
        } catch (SQLException e) {
            model.addAttribute("error", "This product name already exists!!!");
            return "/databaseError";
        }
        return "redirect:/products";
    }

    // Handle GET requests to the /modalChangePrice route
    @GetMapping(value = "/modalChangePrice")
    public String modalChangePrice(Model model, @RequestParam int prodID) {
        // Add the product ID to the model so it can be accessed in the view
        model.addAttribute("prodID", prodID);
        // Return the name of the view template to render
        return "changePrice";
    }

    // Handle POST requests to the /changeProductPrice route
    @PostMapping(value = {"/changeProductPrice"})
    public String changeProductPrice(@RequestParam int prodID, @RequestParam BigDecimal newPrice) throws SQLException {
        // Use the DAO to change the price of the product in the database
        productDAO.changeProductPrice(prodID, newPrice);
        // Redirect to the /products route
        return "redirect:/products";
    }

    // Handle GET requests to the /modalChangeProvider route
    @GetMapping(value = "/modalChangeProvider")
    public String modalChangeProvider(Model model, @RequestParam int prodID) throws SQLException {
        // Add the product ID to the model so it can be accessed in the view
        model.addAttribute("prodID", prodID);
        // Get a list of all providers and add it to the model
        List<String> providers = productDAO.providerNames();
        model.addAttribute("providers", providers);
        // Return the name of the view template to render
        return "changeProvider";
    }

    // Handle POST requests to the /changeProductProvider route
    @PostMapping(value = {"/changeProductProvider"})
    public String changeProductProvider(@RequestParam int prodID, @RequestParam String providerName) throws SQLException {
        // Use the DAO to change the provider of the product in the database
        productDAO.changeProductProvider(prodID, providerName);
        // Redirect to the /products route
        return "redirect:/products";
    }

    // Handle POST requests to the /deleteProductByID route
    @PostMapping(value = {"/deleteProductByID"})
    public String deleteProduct(@RequestParam int prodID) throws SQLException {
        // Use the DAO to delete the product from the database
        productDAO.deleteProductByID(prodID);
        // Redirect to the /products route
        return "redirect:/products";
    }

    // Handle GET requests to the /productsByProvider route
    @GetMapping(value = {"/productsByProvider"})
    public String showGetProductsByProviderName(Model model) throws SQLException {
        // Get a list of all providers and add it to the model
        List<String> providers = productDAO.providerNames();
        // Get a map of all products and their corresponding providers
        Map<Product, String> productProviderMap = productDAO.getMapProducts();
        // Add the providers and products map to the model so they can be accessed in the view
        model.addAttribute("providers", providers);
        model.addAttribute("allProducts", productProviderMap);
        return "getProductsByProviderPage";
    }

    // Handle POST requests to the /productsByProvider route
    @PostMapping(value = {"/productsByProvider"})
    public String getProductsByProviderName(Model model, @RequestParam String providerName) throws SQLException {
        // Use the DAO to get a list of products from the specified provider
        List<Product> products = productDAO.getProductByProvider(providerName);
        List<String> providers = productDAO.providerNames();
        // Add the list of products to the model so it can be accessed in the view
        model.addAttribute("providers", providers);
        Map<Product, String> allProducts = new LinkedHashMap<>();
        for (Product p : products) {
            allProducts.put(p, providerName);
        }
        model.addAttribute("allProducts", allProducts);
        // Return the name of the view template to render
        return "getProductsByProviderPage";
    }
}
