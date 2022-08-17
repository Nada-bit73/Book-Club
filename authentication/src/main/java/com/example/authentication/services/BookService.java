package com.example.authentication.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.example.authentication.models.Book;
import com.example.authentication.repositories.BookRepository;

import java.util.*;

@Service
public class BookService {

	@Autowired
	BookRepository bookRepository;
	
	public List<Book> allBooks(){
		return bookRepository.findAll();
	}
	
	public Book createBook(Book book) {
		return bookRepository.save(book);
	}
	
	public Book findById(Long id){
		Optional<Book> optionalBook = bookRepository.findById(id);
		if (optionalBook.isPresent()) {
			return optionalBook.get();
		} else {
			return null;
		}
	}
	
	public Book updateBook(Long id, @ModelAttribute("book") Book book) {
		if(findById(id) == null) {
			return null;
		}else{
			Optional<Book> optionalBook = bookRepository.findById(id);
			Book book2 = optionalBook.get();
			book2.setTitle(book.getTitle());
			book2.setAuthor(book.getAuthor());
			book2.setThoughts(book.getThoughts());
			
			return bookRepository.save(book2);
		}
		
		
	
	}
}
