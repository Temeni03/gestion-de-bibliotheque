package com.web;

import com.service.AuthService;

import jakarta.ws.rs.container.ContainerRequestContext;
import jakarta.ws.rs.container.ContainerRequestFilter;
import jakarta.ws.rs.core.Response;
import jakarta.ws.rs.ext.Provider;
import com.model.User;


@Provider
public class RoleFilter implements ContainerRequestFilter {
    
    private final AuthService userService = AuthService.getInstance();
    
    @Override
    public void filter(ContainerRequestContext requestContext) {
        String path = requestContext.getUriInfo().getPath();
        String method = requestContext.getMethod();
        
        if (path.equals("users/register") || path.equals("users/login") || path.equals("users/register/") || path.equals("users/login/")) {
            return;
        }
        
        if (path.equals("books") && method.equals("GET")) {
            return;
        }
        
        String authHeader = requestContext.getHeaderString("Authorization");
        if (authHeader == null || authHeader.isEmpty()) {
            requestContext.abortWith(Response
                .status(Response.Status.UNAUTHORIZED)
                .entity("Authentification requise")
                .build());
            return;
        }
        
        String[] credentials = authHeader.split(" ")[1].split(":");
        if (credentials.length != 2) {
            requestContext.abortWith(Response
                .status(Response.Status.BAD_REQUEST)
                .entity("Format d'authentification invalide")
                .build());
            return;
        }
        
        User user = userService.authenticateUser(credentials[0], credentials[1]);
        if (user == null) {
            requestContext.abortWith(Response
                .status(Response.Status.UNAUTHORIZED)
                .entity("Identifiants invalides")
                .build());
            return;
        }
        
        boolean isAdmin = "ADMIN".equals(user.getRole());
        boolean isLibrarian = "LIBRARIAN".equals(user.getRole());
        
        if (path.startsWith("users/librarians")) {
            if (!isAdmin) {
                requestContext.abortWith(Response
                    .status(Response.Status.FORBIDDEN)
                    .entity("Accès réservé à l'administrateur")
                    .build());
                return;
            }
        }
        
        if (path.startsWith("books") && !method.equals("GET")) {
            if (!isAdmin && !isLibrarian) {
                requestContext.abortWith(Response
                    .status(Response.Status.FORBIDDEN)
                    .entity("Accès réservé à l'administrateur et aux bibliothécaires")
                    .build());
                return;
            }
        }
        
        if (path.equals("users") || path.startsWith("users/")) {
            if (!isAdmin && !isLibrarian) {
                requestContext.abortWith(Response
                    .status(Response.Status.FORBIDDEN)
                    .entity("Accès réservé à l'administrateur et aux bibliothécaires")
                    .build());
                return;
            }
        }
        
        if (path.startsWith("loans")) {
            if (path.equals("loans/request") && method.equals("POST")) {
                return;
            }
            
            if (path.startsWith("loans/user/")) {
                String userId = path.substring("loans/user/".length());
                if (!isAdmin && !isLibrarian && !user.getUsername().equals(userId)) {
                    requestContext.abortWith(Response
                        .status(Response.Status.FORBIDDEN)
                        .entity("Vous ne pouvez consulter que vos propres prêts")
                        .build());
                    return;
                }
                return;
            }
            
            if (!isAdmin && !isLibrarian) {
                requestContext.abortWith(Response
                    .status(Response.Status.FORBIDDEN)
                    .entity("Accès réservé à l'administrateur et aux bibliothécaires")
                    .build());
                return;
            }
        }
    }
} 