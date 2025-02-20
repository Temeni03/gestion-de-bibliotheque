package com.web;

import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import com.model.User;
import com.service.AuthService;
import java.util.HashMap;
import java.util.Map;
import java.util.List;


@Path("/users")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class UserResource {
    
    private final AuthService authService = AuthService.getInstance();
    @POST
    @Path("/register")
    public Response registerUser(User user) {
        if (user.getUsername() == null || user.getPassword() == null || 
            user.getNom() == null || user.getPrenom() == null || 
            user.getMatricule() == null) {
            return Response
                .status(Response.Status.BAD_REQUEST)
                .entity("Tous les champs sont obligatoires")
                .build();
        }
        
        boolean registered = authService.registerUser(user);
        if (registered) {
            return Response
                .status(Response.Status.CREATED)
                .entity("inscription reussie")
                .build();
        } else {
            return Response
                .status(Response.Status.CONFLICT)
                .entity("Un utilisateur existe déjà avec cet username")
                .build();
        }
    }

    @POST
    @Path("/login")
    public Response login(Map<String, String> credentials) {
        if (credentials == null || !credentials.containsKey("username") || !credentials.containsKey("password")) {
            return Response
                .status(Response.Status.BAD_REQUEST)
                .entity("username et mot de passe requis")
                .build();
        }

        User user = authService.authenticateUser(credentials.get("username"), credentials.get("password"));
        if (user != null) {
            Map<String, Object> response = new HashMap<>();
            response.put("message", "Connexion réussie");
            response.put("role", user.getRole());
            response.put("nom", user.getNom());
            response.put("prenom", user.getPrenom());
            return Response.ok(response).build();
        } else {
            return Response
                .status(Response.Status.UNAUTHORIZED)
                .entity("Username ou mot de passe incorrect")
                .build();
        }
    }

 
    @GET
    @Path("/librarians")
    public Response getAllLibrarians() {
        List<User> librarians = authService.getAllLibrarians();
        return Response.ok(librarians).build();
    }

    @POST
    @Path("/librarians")
    public Response addLibrarian(User librarian) {
        if (librarian.getUsername() == null || librarian.getPassword() == null || 
            librarian.getNom() == null || librarian.getPrenom() == null) {
            return Response
                .status(Response.Status.BAD_REQUEST)
                .entity("Tous les champs sont obligatoires")
                .build();
        }

        boolean added = authService.addLibrarian(librarian);
        if (added) {
            return Response
                .status(Response.Status.CREATED)
                .entity("Bibliothécaire ajouté avec succès")
                .build();
        } else {
            return Response
                .status(Response.Status.CONFLICT)
                .entity("Un utilisateur existe déjà avec cet username")
                .build();
        }
    }


    @PUT
    @Path("/librarians/{username}")
    public Response updateLibrarian(@PathParam("username") String username, User librarian) {
        if (librarian.getUsername() == null || librarian.getPassword() == null || 
            librarian.getNom() == null || librarian.getPrenom() == null) {
            return Response
                .status(Response.Status.BAD_REQUEST)
                .entity("Tous les champs sont obligatoires")
                .build();
        }

        boolean updated = authService.updateLibrarian(username, librarian);
        if (updated) {
            return Response.ok("Bibliothécaire mis à jour avec succès").build();
        } else {
            return Response
                .status(Response.Status.NOT_FOUND)
                .entity("Bibliothécaire non trouvé")
                .build();
        }
    }

    @DELETE
    @Path("/librarians/{username}")
    public Response deleteLibrarian(@PathParam("username") String username) {
        boolean deleted = authService.deleteLibrarian(username);
        if (deleted) {
            return Response.ok("Bibliothécaire supprimé avec succès").build();
        } else {
            return Response
                .status(Response.Status.NOT_FOUND)
                .entity("Bibliothécaire non trouvé")
                .build();
        }
    }


    @GET
    public Response getAllUsers() {
        List<User> users = authService.getAllUsers();
        return Response.ok(users).build();
    }

    @PUT
    @Path("/{username}")
    public Response updateUser(@PathParam("username") String username, User user) {
        if (user.getUsername() == null || user.getPassword() == null || 
            user.getNom() == null || user.getPrenom() == null) {
            return Response
                .status(Response.Status.BAD_REQUEST)
                .entity("Tous les champs sont obligatoires")
                .build();
        }

        boolean updated = authService.updateUser(username, user);
        if (updated) {
            return Response.ok("Utilisateur mis à jour avec succès").build();
        } else {
            return Response
                .status(Response.Status.NOT_FOUND)
                .entity("Utilisateur non trouvé")
                .build();
        }
    }
} 