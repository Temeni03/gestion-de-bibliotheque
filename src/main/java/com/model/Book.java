package com.model;

import java.io.Serializable;

/**
 * Classe représentant un livre dans le catalogue
 */
public class Book implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
    private String titre;
    private String auteur;
    private String isbn;
    private int anneePublication;
    private int exemplairesDisponibles;
    private int exemplairesTotal;

    // Constructeurs
    public Book() {
        // Générer un ID par défaut pour les nouvelles instances
        this.id = "BOOK-" + System.currentTimeMillis();
    }

    public Book(String titre, String auteur, String isbn, int anneePublication, int exemplairesTotal) {
        this();  // Appeler le constructeur par défaut pour générer l'ID
        this.titre = titre;
        this.auteur = auteur;
        this.isbn = isbn;
        this.anneePublication = anneePublication;
        this.exemplairesTotal = exemplairesTotal;
        this.exemplairesDisponibles = exemplairesTotal;
    }

    // Getters et Setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public String getTitre() { return titre; }
    public void setTitre(String titre) { this.titre = titre; }

    public String getAuteur() { return auteur; }
    public void setAuteur(String auteur) { this.auteur = auteur; }

    public String getIsbn() { return isbn; }
    public void setIsbn(String isbn) { this.isbn = isbn; }

    public int getAnneePublication() { return anneePublication; }
    public void setAnneePublication(int anneePublication) { this.anneePublication = anneePublication; }

    public int getExemplairesDisponibles() { return exemplairesDisponibles; }
    public void setExemplairesDisponibles(int exemplairesDisponibles) { this.exemplairesDisponibles = exemplairesDisponibles; }

    public int getExemplairesTotal() { return exemplairesTotal; }
    public void setExemplairesTotal(int exemplairesTotal) { this.exemplairesTotal = exemplairesTotal; }
} 