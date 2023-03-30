package com.ictu.controller.admin;

import com.ictu.controller.CommonController;
import com.ictu.entity.Supplier;
import com.ictu.repository.SuppliersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;
import java.util.List;

@Controller
public class SuppliersController extends CommonController {
    @Autowired
    SuppliersRepository suppliersRepository;

    // show list supplier - table list
    @ModelAttribute("suppliers")
    public List<Supplier> showSupplier(Model model) {
        List<Supplier> suppliers = suppliersRepository.findAll();
        model.addAttribute("suppliers", suppliers);

        return suppliers;
    }

    @GetMapping(value = "/admin/suppliers")
    public String suppliers(Model model, Principal principal) {
        Supplier supplier = new Supplier();
        model.addAttribute("supplier", supplier);

        return "admin/suppliers";
    }

    @PostMapping(value = "/addSupplier")
    public String addSupplier(@Validated @ModelAttribute("supplier") Supplier supplier, ModelMap model,
                              BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            model.addAttribute("error", "failure");

            return "admin/suppliers";
        }

        suppliersRepository.save(supplier);
        model.addAttribute("message", "successful!");

        return "redirect:/admin/suppliers";
    }

    @GetMapping(value = "/editSupplier/{id}")
    public String editSupplier(@PathVariable("id") Integer id, ModelMap model) {
        Supplier supplier = suppliersRepository.findById(id).orElse(null);

        model.addAttribute("supplier", supplier);

        return "admin/editSupplier";
    }


    @GetMapping("/deleteSupplier/{id}")
    public String deleteSupplier(@PathVariable("id") Integer id, Model model) {
        try {
            suppliersRepository.deleteById(id);
            model.addAttribute("message", "Delete successful!");
        } catch (Exception e) {
            return "site/notFound";
        }

        return "redirect:/admin/suppliers";
    }
}
