package com.service;

import com.model.Book;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap;

public class BookService {
    private static final BookService INSTANCE = new BookService();
    
    private final Map<String, Book> books = new ConcurrentHashMap<>();
    
    private BookService() {
        addBook(new Book("Mothers and Sons", "Adam Hastell", "7885-645-145-102", 2025, 50));
        addBook(new Book("Vantage Points", "Sarah Sligar", "178-2-780-09634-8", 2025, 20));
    }
    
    public static BookService getInstance() {
        return INSTANCE;
    }
    
    public boolean addBook(Book book) {
        if (books.values().stream().anyMatch(b -> b.getIsbn().equals(book.getIsbn()))) {
            return false;
        }
        books.put(book.getId(), book);
        return true;
    }
   
    public boolean updateBook(String id, Book book) {
        if (!books.containsKey(id)) {
            return false;
        }
        book.setId(id);
        books.put(id, book);
        return true;
    }
    
    public boolean deleteBook(String id) {
        return books.remove(id) != null;
    }
  
    public Book getBookById(String id) {
        return books.get(id);
    }
    
   
    public List<Book> getAllBooks() {
        return new ArrayList<>(books.values());
    }
    

    public boolean isBookAvailable(String id) {
        Book book = books.get(id);
        return book != null && book.getExemplairesDisponibles() > 0;
    }
    
    /**
     * Mettre à jour le nombre d'exemplaires disponibles
     * @param id L'ID du livre
     * @param delta La variation du nombre d'exemplaires (+1 pour retour, -1 pour emprunt)
     * @return true si la mise à jour est réussie, false sinon
     */
    public boolean updateAvailableCopies(String id, int delta) {
        Book book = books.get(id);
        if (book == null) {
            return false;
        }
        
        int newCount = book.getExemplairesDisponibles() + delta;
        if (newCount < 0 || newCount > book.getExemplairesTotal()) {
            return false;
        }
        
        book.setExemplairesDisponibles(newCount);
        return true;
    }
} 