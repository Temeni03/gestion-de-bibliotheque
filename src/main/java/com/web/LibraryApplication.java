package com.web;

import jakarta.ws.rs.ApplicationPath;
import jakarta.ws.rs.core.Application;
import java.util.HashSet;
import java.util.Set;

/**
 * Configuration de l'application JAX-RS
 */
@ApplicationPath("/api")
public class LibraryApplication extends Application {
    @Override
    public Set<Class<?>> getClasses() {
        Set<Class<?>> classes = new HashSet<>();
        classes.add(UserResource.class);
        classes.add(BookResource.class);
        classes.add(RoleFilter.class);
        return classes;
    }
} 