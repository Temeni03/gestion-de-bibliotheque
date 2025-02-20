package com.service;

import com.model.User;
import java.util.Map;
import java.util.List;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;


public class AuthService {
    private static AuthService instance;
    
    private final Map<String, User> users = new ConcurrentHashMap<>();
    
    private AuthService() {
        User admin = new User();
        admin.setUsername("admin");
        admin.setPassword("admin");
        admin.setNom("Admin");
        admin.setPrenom("System");
        admin.setRole("ADMIN");
        users.put(admin.getUsername(), admin);
    }
    
    public static AuthService getInstance() {
        if (instance == null) {
            instance = new AuthService();
        }
        return instance;
    }
    
    public User authenticateUser(String username, String password) {
        User user = users.get(username);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }
    
 
    public boolean registerUser(User user) {
        if (users.containsKey(user.getUsername())) {
            return false;
        }
        user.setRole("STUDENT");
        users.put(user.getUsername(), user);
        return true;
    }
  
    public List<User> getAllLibrarians() {
        return users.values().stream()
            .filter(user -> "LIBRARIAN".equals(user.getRole()))
            .collect(Collectors.toList());
    }
    
   
    public boolean addLibrarian(User librarian) {
        if (users.containsKey(librarian.getUsername())) {
            return false;
        }
        librarian.setRole("LIBRARIAN");
        users.put(librarian.getUsername(), librarian);
        return true;
    }
    
    public boolean updateLibrarian(String username, User librarian) {
        User existingLibrarian = users.get(username);
        if (existingLibrarian == null || !"LIBRARIAN".equals(existingLibrarian.getRole())) {
            return false;
        }
        librarian.setRole("LIBRARIAN");
        users.put(username, librarian);
        return true;
    }
    

    public boolean deleteLibrarian(String username) {
        User librarian = users.get(username);
        if (librarian == null || !"LIBRARIAN".equals(librarian.getRole())) {
            return false;
        }
        users.remove(username);
        return true;
    }
    

    public List<User> getAllUsers() {
        return new ArrayList<>(users.values());
    }

    public boolean updateUser(String username, User user) {
        if (!users.containsKey(username)) {
            return false;
        }
        User existingUser = users.get(username);
        user.setRole(existingUser.getRole()); 
        users.put(username, user);
        return true;
    }
} 