package com.web;

import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import com.model.Loan;
import com.service.LoanService;
import java.util.List;
import java.util.Map;

@Path("/loans")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class LoanResource {
    
    private final LoanService loanService = LoanService.getInstance();
    
    /**
     * Créer une demande de prêt (pour les étudiants)
     */
    @POST
    @Path("/request")
    public Response requestLoan(Map<String, String> request) {
        if (request == null || !request.containsKey("userId") || !request.containsKey("bookId")) {
            return Response
                .status(Response.Status.BAD_REQUEST)
                .entity("userId et bookId sont requis")
                .build();
        }
        
        Loan loan = loanService.requestLoan(request.get("userId"), request.get("bookId"));
        if (loan == null) {
            return Response
                .status(Response.Status.BAD_REQUEST)
                .entity("Livre non disponible")
                .build();
        }
        
        return Response
            .status(Response.Status.CREATED)
            .entity("Demande de prêt créée avec succès")
            .build();
    }
    
    /**
     * Approuver un prêt (pour les bibliothécaires)
     */
    @PUT
    @Path("/{loanId}/approve")
    public Response approveLoan(@PathParam("loanId") String loanId) {
        boolean approved = loanService.approveLoan(loanId);
        if (approved) {
            return Response.ok("Prêt approuvé avec succès").build();
        } else {
            return Response
                .status(Response.Status.BAD_REQUEST)
                .entity("Impossible d'approuver le prêt")
                .build();
        }
    }
    
    /**
     * Rejeter un prêt (pour les bibliothécaires)
     */
    @PUT
    @Path("/{loanId}/reject")
    public Response rejectLoan(@PathParam("loanId") String loanId) {
        boolean rejected = loanService.rejectLoan(loanId);
        if (rejected) {
            return Response.ok("Prêt rejeté").build();
        } else {
            return Response
                .status(Response.Status.BAD_REQUEST)
                .entity("Impossible de rejeter le prêt")
                .build();
        }
    }
    
    /**
     * Retourner un livre (pour les bibliothécaires)
     */
    @PUT
    @Path("/{loanId}/return")
    public Response returnBook(@PathParam("loanId") String loanId) {
        boolean returned = loanService.returnBook(loanId);
        if (returned) {
            return Response.ok("Livre retourné avec succès").build();
        } else {
            return Response
                .status(Response.Status.BAD_REQUEST)
                .entity("Impossible de retourner le livre")
                .build();
        }
    }
    
    /**
     * Obtenir tous les prêts (pour les bibliothécaires et admin)
     */
    @GET
    public Response getAllLoans() {
        List<Loan> loans = loanService.getAllLoans();
        return Response.ok(loans).build();
    }
    
    /**
     * Obtenir les prêts d'un utilisateur
     */
    @GET
    @Path("/user/{userId}")
    public Response getUserLoans(@PathParam("userId") String userId) {
        List<Loan> loans = loanService.getUserLoans(userId);
        return Response.ok(loans).build();
    }
    
    /**
     * Obtenir les prêts en attente (pour les bibliothécaires)
     */
    @GET
    @Path("/pending")
    public Response getPendingLoans() {
        List<Loan> loans = loanService.getPendingLoans();
        return Response.ok(loans).build();
    }
} 