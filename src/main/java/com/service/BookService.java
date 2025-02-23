package com.service;

import com.model.Book;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Service de gestion du catalogue de livres
 */
public class BookService {
    private static final BookService INSTANCE = new BookService();
    
    // Stockage en mémoire des livres
    private final Map<String, Book> books = new ConcurrentHashMap<>();
    
    private BookService() {
        // Ajouter quelques livres de test
        addBook(new Book("Le Petit Prince", "Antoine de Saint-Exupéry", "978-2-07-040850-4", 1943, 5));
        addBook(new Book("Les Misérables", "Victor Hugo", "978-2-253-09634-8", 1862, 3));
    }
    
    public static BookService getInstance() {
        return INSTANCE;
    }
    
    /**
     * Ajouter un nouveau livre au catalogue
     * @param book Le livre à ajouter
     * @return true si l'ajout est réussi, false si l'ISBN existe déjà
     */
    public boolean addBook(Book book) {
        if (books.values().stream().anyMatch(b -> b.getIsbn().equals(book.getIsbn()))) {
            return false;
        }
        books.put(book.getId(), book);
        return true;
    }
    
    /**
     * Mettre à jour un livre existant
     * @param id L'ID du livre
     * @param book Les nouvelles informations du livre
     * @return true si la mise à jour est réussie, false si le livre n'existe pas
     */
    public boolean updateBook(String id, Book book) {
        if (!books.containsKey(id)) {
            return false;
        }
        book.setId(id);
        books.put(id, book);
        return true;
    }
    
    /**
     * Supprimer un livre du catalogue
     * @param id L'ID du livre à supprimer
     * @return true si la suppression est réussie, false si le livre n'existe pas
     */
    public boolean deleteBook(String id) {
        return books.remove(id) != null;
    }
    
    /**
     * Récupérer un livre par son ID
     * @param id L'ID du livre
     * @return Le livre ou null s'il n'existe pas
     */
    public Book getBookById(String id) {
        return books.get(id);
    }
    
    /**
     * Récupérer tous les livres du catalogue
     * @return La liste des livres
     */
    public List<Book> getAllBooks() {
        return new ArrayList<>(books.values());
    }
    
    /**
     * Vérifier si un livre est disponible pour l'emprunt
     * @param id L'ID du livre
     * @return true si le livre est disponible, false sinon
     */
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