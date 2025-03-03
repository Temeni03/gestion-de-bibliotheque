package com.web;

import jakarta.ws.rs.ApplicationPath;
import jakarta.ws.rs.core.Application;
import java.util.HashSet;
import java.util.Set;

import com.config.JAXRSConfiguration;

@ApplicationPath("/api")
public class LibraryApplication extends Application {
    @Override
    public Set<Class<?>> getClasses() {
        Set<Class<?>> classes = new HashSet<>();
        classes.add(UserResource.class);
        classes.add(BookResource.class);
        classes.add(LoanResource.class);
        classes.add(RoleFilter.class);
        classes.add(JAXRSConfiguration.class);
        return classes;
    }
} 