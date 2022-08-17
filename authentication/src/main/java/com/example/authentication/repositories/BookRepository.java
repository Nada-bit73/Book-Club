package com.example.authentication.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.authentication.models.Book;

import java.util.*;

@Repository
public interface BookRepository extends CrudRepository<Book, Long>{
	List<Book> findAll();
	Optional<Book> findById(Long id);
	
}
