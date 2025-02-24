package com.model;

import java.time.LocalDateTime;

public class Loan {
    private String id;
    private String bookId;
    private String userId;
    private LocalDateTime requestDate;
    private LocalDateTime loanDate;
    private LocalDateTime returnDate;
    private String status; // REQUESTED, APPROVED, REJECTED, RETURNED
    
    public Loan() {
        this.requestDate = LocalDateTime.now();
        this.status = "REQUESTED";
        // Generate a unique ID using timestamp
        this.id = String.valueOf(System.currentTimeMillis());
    }
    
    // Getters and Setters
    public String getId() {
        return id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    
    public String getBookId() {
        return bookId;
    }
    
    public void setBookId(String bookId) {
        this.bookId = bookId;
    }
    
    public String getUserId() {
        return userId;
    }
    
    public void setUserId(String userId) {
        this.userId = userId;
    }
    
    public LocalDateTime getRequestDate() {
        return requestDate;
    }
    
    public void setRequestDate(LocalDateTime requestDate) {
        this.requestDate = requestDate;
    }
    
    public LocalDateTime getLoanDate() {
        return loanDate;
    }
    
    public void setLoanDate(LocalDateTime loanDate) {
        this.loanDate = loanDate;
    }
    
    public LocalDateTime getReturnDate() {
        return returnDate;
    }
    
    public void setReturnDate(LocalDateTime returnDate) {
        this.returnDate = returnDate;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
} 