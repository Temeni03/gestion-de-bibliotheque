package com.config;

import jakarta.ws.rs.ext.ContextResolver;
import jakarta.ws.rs.ext.Provider;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

@Provider
public class JAXRSConfiguration implements ContextResolver<ObjectMapper> {
    
    private final ObjectMapper objectMapper;
    
    public JAXRSConfiguration() {
        objectMapper = new ObjectMapper();
        objectMapper.registerModule(new JavaTimeModule());
    }
    
    @Override
    public ObjectMapper getContext(Class<?> type) {
        return objectMapper;
    }
} 