package com.service;

import com.model.Loan;
import com.model.Book;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.stream.Collectors;

public class LoanService {
    private static LoanService instance;
    private final Map<String, Loan> loans = new ConcurrentHashMap<>();
    private final BookService bookService = BookService.getInstance();
    
    private LoanService() {}
    
    public static LoanService getInstance() {
        if (instance == null) {
            instance = new LoanService();
        }
        return instance;
    }
    

    public Loan requestLoan(String userId, String bookId) {
        Book book = bookService.getBookById(bookId);
        if (book == null || book.getExemplairesDisponibles() <= 0) {
            return null;
        }
        
        Loan loan = new Loan();
        loan.setUserId(userId);
        loan.setBookId(bookId);
        loans.put(loan.getId(), loan);
        return loan;
    }
    
  
    public boolean approveLoan(String loanId) {
        Loan loan = loans.get(loanId);
        if (loan == null || !"REQUESTED".equals(loan.getStatus())) {
            return false;
        }
        
        Book book = bookService.getBookById(loan.getBookId());
        if (book == null || book.getExemplairesDisponibles() <= 0) {
            return false;
        }
        
        loan.setStatus("APPROVED");
        loan.setLoanDate(LocalDateTime.now());
        book.setExemplairesDisponibles(book.getExemplairesDisponibles() - 1);
        bookService.updateBook(book.getId(), book);
        return true;
    }
    
  
    public boolean rejectLoan(String loanId) {
        Loan loan = loans.get(loanId);
        if (loan == null || !"REQUESTED".equals(loan.getStatus())) {
            return false;
        }
        
        loan.setStatus("REJECTED");
        return true;
    }
    
   
    public boolean returnBook(String loanId) {
        Loan loan = loans.get(loanId);
        if (loan == null || !"APPROVED".equals(loan.getStatus())) {
            return false;
        }
        
        Book book = bookService.getBookById(loan.getBookId());
        if (book == null) {
            return false;
        }
        
        loan.setStatus("RETURNED");
        loan.setReturnDate(LocalDateTime.now());
        book.setExemplairesDisponibles(book.getExemplairesDisponibles() + 1);
        bookService.updateBook(book.getId(), book);
        return true;
    }
    
 
    public List<Loan> getAllLoans() {
        return new ArrayList<>(loans.values());
    }
    
  
    public List<Loan> getUserLoans(String userId) {
        return loans.values().stream()
            .filter(loan -> loan.getUserId().equals(userId))
            .collect(Collectors.toList());
    }
    
    public List<Loan> getPendingLoans() {
        return loans.values().stream()
            .filter(loan -> "REQUESTED".equals(loan.getStatus()))
            .collect(Collectors.toList());
    }
    public List<Loan> getLoansHistory() {
        return loans.values().stream()
            .filter(loan -> "RETURNED".equals(loan.getStatus()) || "REJECTED".equals(loan.getStatus()))
            .collect(Collectors.toList());
    }
    
    public List<Loan> getApprovedLoans() {
    	return loans.values().stream()
                .filter(loan -> "APPROVED".equals(loan.getStatus()))
                .collect(Collectors.toList());
    }
    
    public Loan getLoanById(String loanId) {
        return loans.get(loanId);
    }
} 