package com.web;

import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import com.model.Book;
import com.service.BookService;
import java.util.List;

/**
 * Endpoint REST pour la gestion du catalogue de livres
 */
@Path("/books")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class BookResource {
    
    private final BookService bookService = BookService.getInstance();
    
    /**
     * Récupérer tous les livres du catalogue
     */
    @GET
    public Response getAllBooks() {
        List<Book> books = bookService.getAllBooks();
        return Response.ok(books).build();
    }
    
    /**
     * Récupérer un livre par son ID
     */
    @GET
    @Path("/{id}")
    public Response getBook(@PathParam("id") String id) {
        Book book = bookService.getBookById(id);
        if (book != null) {
            return Response.ok(book).build();
        }
        return Response
            .status(Response.Status.NOT_FOUND)
            .entity("Livre non trouvé")
            .build();
    }
    
    /**
     * Ajouter un nouveau livre (réservé à l'administrateur)
     */
    @POST
    public Response addBook(Book book) {
        if (book.getTitre() == null || book.getAuteur() == null || 
            book.getIsbn() == null || book.getAnneePublication() <= 0 || 
            book.getExemplairesTotal() <= 0) {
            return Response
                .status(Response.Status.BAD_REQUEST)
                .entity("Tous les champs sont obligatoires et doivent être valides")
                .build();
        }
        
        boolean added = bookService.addBook(book);
        if (added) {
            return Response
                .status(Response.Status.CREATED)
                .entity("Livre ajouté avec succès")
                .build();
        } else {
            return Response
                .status(Response.Status.CONFLICT)
                .entity("Un livre avec cet ISBN existe déjà")
                .build();
        }
    }
    
    /**
     * Mettre à jour un livre existant (réservé à l'administrateur)
     */
    @PUT
    @Path("/{id}")
    public Response updateBook(@PathParam("id") String id, Book book) {
        if (book.getTitre() == null || book.getAuteur() == null || 
            book.getIsbn() == null || book.getAnneePublication() <= 0 || 
            book.getExemplairesTotal() <= 0) {
            return Response
                .status(Response.Status.BAD_REQUEST)
                .entity("Tous les champs sont obligatoires et doivent être valides")
                .build();
        }
        
        boolean updated = bookService.updateBook(id, book);
        if (updated) {
            return Response.ok("Livre mis à jour avec succès").build();
        } else {
            return Response
                .status(Response.Status.NOT_FOUND)
                .entity("Livre non trouvé")
                .build();
        }
    }
    
    /**
     * Supprimer un livre (réservé à l'administrateur)
     */
    @DELETE
    @Path("/{id}")
    public Response deleteBook(@PathParam("id") String id) {
        boolean deleted = bookService.deleteBook(id);
        if (deleted) {
            return Response.ok("Livre supprimé avec succès").build();
        } else {
            return Response
                .status(Response.Status.NOT_FOUND)
                .entity("Livre non trouvé")
                .build();
        }
    }
} 