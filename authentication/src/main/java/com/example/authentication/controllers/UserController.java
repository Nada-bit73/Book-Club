package com.example.authentication.controllers;

import org.springframework.stereotype.Controller;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.authentication.models.Book;
import com.example.authentication.models.LoginUser;
import com.example.authentication.models.User;
import com.example.authentication.services.BookService;
import com.example.authentication.services.UserService;

    

    
@Controller
public class UserController {
    
    @Autowired
    private UserService userServ;
    
    @Autowired
    private BookService bookService;
    
    
    // display Registration page
    @GetMapping("/")
    public String index(Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
        return "index.jsp";
    }
    
    // process the registration data
    @PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result,
            Model model,RedirectAttributes redirectAttributes
            ) {
    	// send the instance and the result 
        userServ.register(newUser, result);
        if(result.hasErrors()) {
            model.addAttribute("newLogin", new LoginUser());
            return "index.jsp";
        }
        redirectAttributes.addFlashAttribute("success", "Your account has been created successfully!");
        return "redirect:/";
    }
    
    // process login data
    @PostMapping("/login")
    public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result,
            Model model,
            HttpSession session) {
        User user = userServ.login(newLogin, result);
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
        session.setAttribute("userName", user.getUserName());
        session.setAttribute("userId", user.getId());
        System.out.println(session.getAttribute("userId"));
        return "redirect:/home";
    }
    
    @GetMapping("/home")
    public String home(Model model,HttpSession session) {
    	if(session.getAttribute("userName") == null) {
    		return "redirect:/";
    	}
    	
    	session.getAttribute("userName");
    	model.addAttribute("books",bookService.allBooks());
        return "home.jsp";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("userName");
        return "redirect:/";
    }
    
    @GetMapping("/form")
    public String displayForm(@ModelAttribute("newBook") Book newBook,
    		Model model,HttpSession session) {
    	model.addAttribute("newBook",newBook);
    	session.getAttribute("userName");
        return "addBook.jsp";
    }
    
    @RequestMapping(value="/addBook", method=RequestMethod.POST)
	public String createBook(@Valid @ModelAttribute("newBook") Book newBook,
			BindingResult result,
			RedirectAttributes redirectAttributes,
			HttpSession session,
			Model model
			) {
    	session.getAttribute("userName");
		 if(result.hasErrors()) {			 
			 return "addBook.jsp";
		 }else {
			  bookService.createBook(newBook);
			  redirectAttributes.addFlashAttribute("success", "Book Created !");
			 return "redirect:/form";
		}
		
	}
    
    @GetMapping("/view/{id}")
    public String displayBookDetails(Model model,
    		@PathVariable("id") Long id) {
    	model.addAttribute("book",bookService.findById(id));
        return "viewBook.jsp";
    }
    
    @GetMapping("/edit/{id}")
    public String displayEditTemplate(Model model,
    		@PathVariable("id") Long id) {
        if(!model.containsAttribute("book")) {
        	Book book = bookService.findById(id);
        	model.addAttribute("book",book);
        }
    	model.addAttribute("bookId",id);
        return "editBook.jsp";
    }
    
    @RequestMapping(value="/process/{id}", method=RequestMethod.PUT)
	public String processEditData(@Valid @ModelAttribute("book") Book book,
			BindingResult result,
			Model model,@PathVariable("id") Long id,
			RedirectAttributes redirectAttributes
			) {
		 if(result.hasErrors()) {
			 model.addAttribute("book",book);
			 model.addAttribute("bookId",id);
			 return "editBook.jsp";
		 }else{
			 bookService.updateBook(id,book);
			 redirectAttributes.addFlashAttribute("success", "Your Book has been updated successfully!");
			 return "redirect:/home";
		}
		
	}
    
}
 