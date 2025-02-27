<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gestion des livres</title>
    <style>
		@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');
		*{
		  margin: 0;
		  padding: 0;
		  box-sizing: border-box;
		  font-family: 'Poppins', sans-serif;
		}
		nav{
		  position: fixed;
		  z-index: 99;
		  width: 100%;
		  
		  background: linear-gradient(to right, #1e90ff, #0fccce);
		}
		nav .wrapper{
		  position: relative;
		  max-width: 1300px;
		  padding: 0px 30px;
		  height: 70px;
		  line-height: 70px;
		  margin: auto;
		  display: flex;
		  align-items: center;
		  justify-content: space-between;
		}
		.wrapper .logo a{
		  color: #f2f2f2;
		  font-size: 30px;
		  font-weight: 600;
		  text-decoration: none;
		}
		.wrapper .nav-links{
		  display: inline-flex;
		}
		.nav-links li{
		  list-style: none;
		}
		.nav-links li a{
		  color: #ddd;
		  text-decoration: none;
		  font-size: 18px;
		  font-weight: 500;
		  padding: 9px 15px;
		  border-radius: 5px;
		  transition: all 0.3s ease;
		}
		.nav-links li a.active {
			color: #f2f2f2;
		}
		.nav-links li a:hover{
		  color: #f2f2f2;
		}
		.nav-links .mobile-item{
		  display: none;
		}
		.nav-links .drop-menu{
		  position: absolute;
		  background: #242526;
		  width: 180px;
		  line-height: 45px;
		  top: 85px;
		  opacity: 0;
		  visibility: hidden;
		  box-shadow: 0 6px 10px rgba(0,0,0,0.15);
		}
		.nav-links li:hover .drop-menu,
		.nav-links li:hover .mega-box{
		  transition: all 0.3s ease;
		  top: 70px;
		  opacity: 1;
		  visibility: visible;
		}
		.drop-menu li a{
		  width: 100%;
		  display: block;
		  padding: 0 0 0 15px;
		  font-weight: 400;
		  border-radius: 0px;
		}
		.mega-box{
		  position: absolute;
		  left: 0;
		  width: 100%;
		  padding: 0 30px;
		  top: 85px;
		  opacity: 0;
		  visibility: hidden;
		}
		.mega-box .content{
		  background: #242526;
		  padding: 25px 20px;
		  display: flex;
		  width: 100%;
		  justify-content: space-between;
		  box-shadow: 0 6px 10px rgba(0,0,0,0.15);
		}
		.mega-box .content .row{
		  width: calc(25% - 30px);
		  line-height: 45px;
		}
		.content .row img{
		  width: 100%;
		  height: 100%;
		  object-fit: cover;
		}
		.content .row header{
		  color: #f2f2f2;
		  font-size: 20px;
		  font-weight: 500;
		}
		.content .row .mega-links{
		  margin-left: -40px;
		  border-left: 1px solid rgba(255,255,255,0.09);
		}
		.row .mega-links li{
		  padding: 0 20px;
		}
		.row .mega-links li a{
		  padding: 0px;
		  padding: 0 20px;
		  color: #d9d9d9;
		  font-size: 17px;
		  display: block;
		}
		.row .mega-links li a:hover{
		  color: #f2f2f2;
		}
		.wrapper .btn{
		  color: #fff;
		  font-size: 20px;
		  cursor: pointer;
		  display: none;
		}
		.wrapper .btn.close-btn{
		  position: absolute;
		  right: 30px;
		  top: 10px;
		}
		
		@media screen and (max-width: 970px) {
		  .wrapper .btn{
		    display: block;
		  }
		  .wrapper .nav-links{
		    position: fixed;
		    height: 100vh;
		    width: 100%;
		    max-width: 350px;
		    top: 0;
		    left: -100%;
		    background: #242526;
		    display: block;
		    padding: 50px 10px;
		    line-height: 50px;
		    overflow-y: auto;
		    box-shadow: 0px 15px 15px rgba(0,0,0,0.18);
		    transition: all 0.3s ease;
		  }
		  /* custom scroll bar */
		  ::-webkit-scrollbar {
		    width: 10px;
		  }
		  ::-webkit-scrollbar-track {
		    background: #242526;
		  }
		  ::-webkit-scrollbar-thumb {
		    background: #3A3B3C;
		  }
		  #menu-btn:checked ~ .nav-links{
		    left: 0%;
		  }
		  #menu-btn:checked ~ .btn.menu-btn{
		    display: none;
		  }
		  #close-btn:checked ~ .btn.menu-btn{
		    display: block;
		  }
		  .nav-links li{
		    margin: 15px 10px;
		  }
		  .nav-links .drop-menu{
		    position: static;
		    opacity: 1;
		    top: 65px;
		    visibility: visible;
		    padding-left: 20px;
		    width: 100%;
		    max-height: 0px;
		    overflow: hidden;
		    box-shadow: none;
		    transition: all 0.3s ease;
		  }
		  #showDrop:checked ~ .drop-menu,
		  #showMega:checked ~ .mega-box{
		    max-height: 100%;
		  }
		  .nav-links .desktop-item{
		    display: none;
		  }
		  .nav-links .mobile-item{
		    display: block;
		    color: #f2f2f2;
		    font-size: 20px;
		    font-weight: 500;
		    padding-left: 20px;
		    cursor: pointer;
		    border-radius: 5px;
		    transition: all 0.3s ease;
		  }
		  .nav-links .mobile-item:hover{
		    background: #3A3B3C;
		  }
		  .drop-menu li{
		    margin: 0;
		  }
		  .drop-menu li a{
		    border-radius: 5px;
		    font-size: 18px;
		  }
		  .mega-box{
		    position: static;
		    top: 65px;
		    opacity: 1;
		    visibility: visible;
		    padding: 0 20px;
		    max-height: 0px;
		    overflow: hidden;
		    transition: all 0.3s ease;
		  }
		  .mega-box .content{
		    box-shadow: none;
		    flex-direction: column;
		    padding: 20px 20px 0 20px;
		  }
		  .mega-box .content .row{
		    width: 100%;
		    margin-bottom: 15px;
		    border-top: 1px solid rgba(255,255,255,0.08);
		  }
		  .mega-box .content .row:nth-child(1),
		  .mega-box .content .row:nth-child(2){
		    border-top: 0px;
		  }
		  .content .row .mega-links{
		    border-left: 0px;
		    padding-left: 15px;
		  }
		  .row .mega-links li{
		    margin: 0;
		  }
		  .content .row header{
		    font-size: 19px;
		  }
		}
		nav input{
		  display: none;
		}
		
		.container {
		  max-width: 1100px;
		  margin-left: auto;
		  margin-right: auto;
		  padding-left: 10px;
		  padding-right: 10px;
		  padding-top: 100px;
		  position: relative;
		}
		.add-librarian-btn {
		    padding: 5px 10px;
		    border: none;
		    background: #1e90ff;
		    border-radius: 7px;
		    color: white;
		    font-size: 16px;
		    cursor: pointer;
		    margin-bottom: 15px;
		    position: absolute;
		    right: 10px;
		    top: 88px;
		    text-decoration: none;
		}
		.edit-librarian-btn {
		    padding: 5px 10px;
		    border: none;
		    background: #1e90ff;
		    border-radius: 7px;
		    color: white;
		    font-size: 16px;
		    cursor: pointer;
		    margin-bottom: 15px;
		    text-decoration: none;
		}
		.delete-librarian-btn {
			padding: 5px 10px;
		    border: none;
		    background: #d02d2c;
		    border-radius: 7px;
		    color: white;
		    font-size: 16px;
		    cursor: pointer;
		    margin-bottom: 15px;
		    margin-left: 5px;
		    text-decoration: none;
		}
		.delete-form {
			display: flex;
			flex-direction: column;
			align-items: center;
			gap: 8px;
		}
		.delete-group-buttons {
			display: flex;
		    justify-content: space-between;
		    width: 100%;
		}
		.delete-button {
			max-width: 100px;
   			background: #1e90ff;
		}
		.delete-button-cancel {
		    background: transparent;
		    color: #333;
		    border: 1px solid #333;
		    max-width: 100px;
		}
		.delete-button-cancel:hover {
			color: white
		}
		.responsive-table {
		  li {
		    border-radius: 3px;
		    padding: 25px 30px;
		    display: flex;
		    justify-content: space-between;
		    margin-bottom: 25px;
		  }
		  .table-header {
		    background-color: #e7e7e7;
		    font-size: 14px;
		    text-transform: uppercase;
		    letter-spacing: 0.03em;
		    font-weight: bold;
		  }
		  .table-row {
		    background-color: #ffffff;
		    box-shadow: 0px 0px 9px 0px rgba(0,0,0,0.1);
		  }
		  .col-1 {
		    flex-basis: 15%;
		  }
		  .col-2 {
		    flex-basis: 20%;
		  }
		  .col-3 {
		    flex-basis: 15%;
		  }
		  .col-4 {
		    flex-basis: 10%;
		  }
		  .col-5 {
		    flex-basis: 10%;
		  }
		  .col-6 {
		    flex-basis: 15%;
		  }
		  .col-7 {
		    flex-basis: 15%;
		  }
		  .text-center {
		  	text-align: center;
		  }
		  
		  @media all and (max-width: 767px) {
		    .table-header {
		      display: none;
		    }
		    .table-row{
		      
		    }
		    li {
		      display: block;
		    }
		    .col {
		      
		      flex-basis: 100%;
		      
		    }
		    .col {
		      display: flex;
		      padding: 10px 0;
		      &:before {
		        color: #6C7A89;
		        padding-right: 10px;
		        content: attr(data-label);
		        flex-basis: 50%;
		        text-align: right;
		      }
		    }
		  }
		}
		.modal {
		  visibility: hidden;
		  opacity: 0;
		  position: absolute;
		  top: 0;
		  right: 0;
		  bottom: 0;
		  left: 0;
		  display: flex;
		  align-items: center;
		  justify-content: center;
		  background: rgba(77, 77, 77, .7);
		  transition: all .4s;
		}
		
		.modal:target {
		  visibility: visible;
		  opacity: 1;
		}
		
		.modal__content {
		  position: relative;
		  max-width: 90%;
		  background: #fff;
		  background-color: white;
		  padding: 20px;
		  border-radius: 10px;
		  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		  width: 500px;
		}
		
		.modal__footer {
		  text-align: right;
		  a {
		    color: #585858;
		  }
		  i {
		    color: #d02d2c;
		  }
		}
		.modal__close {
		  position: absolute;
		  top: 10px;
		  right: 10px;
		  color: #585858;
		  text-decoration: none;
		}
		.register-container {

		}
		
		h1 {
		    background: linear-gradient(to right, #1e90ff, #0fccce);
		    color: white;
		    text-align: center;
		    padding: 15px 0;
		    border-radius: 5px 5px 0 0;
		    margin: -20px -20px 20px -20px;
		    font-size: 18px;
		}
		
		.form-group {
		    margin-bottom: 15px;
		}
		
		label {
		    display: block;
		    margin-bottom: 5px;
		    color: #333; 
		    font-size: 14px;
		}
		
		input[type="text"],
		input[type="number"],
		input[type="password"] {
		    width: 100%;
		    padding: 8px;
		    border: 1px solid #ddd;
		    border-radius: 4px;
		    font-size: 14px;
		    box-sizing: border-box;
		}
		button {
		    width: 100%;
		    padding: 10px;
		    background: linear-gradient(to right, #1e90ff, #0fccce);
		    border: none;
		    border-radius: 25px;
		    color: white;
		    font-size: 16px;
		    cursor: pointer;
		    margin-bottom: 15px;
		}
		
		button:hover {
		    background: linear-gradient(to right, #1e90ff, #0fccce)
		}
		
		p {
		    text-align: center;
		    font-size: 12px;
		    color: #666;
		}
		
		p a {
		    color: #1e90ff; 
		    text-decoration: none;
		}
		
		p a:hover {
		    text-decoration: underline;
		}
		button a {
		    color: #fff;
		    text-decoration: none;
		}
		.hidden {
			visibility: hidden;
		}
	
	</style>
</head>
<body>
    <nav>
        <div class="wrapper">
            <div class="logo"><a href="${pageContext.request.contextPath}/index.jsp">SGBU</a></div>
            <input type="radio" name="slider" id="menu-btn">
            <input type="radio" name="slider" id="close-btn">
            <ul class="nav-links">
                <label for="close-btn" class="btn close-btn"><i class="fas fa-times"></i></label>
                <li><a href="${pageContext.request.contextPath}/books/catalog.jsp" class='active'>Livres</a></li>
                <li><a href="${pageContext.request.contextPath}/loan/demandes.jsp" id="demandes-link">Demandes</a></li>
                <li><a href="${pageContext.request.contextPath}/loan/history.jsp">Historiques</a></li>
                <li><a href="${pageContext.request.contextPath}/users/librarians.jsp" id="librarians-link">Bibliothécaires</a></li>
                <li><a href="${pageContext.request.contextPath}/auth/logout.jsp">Déconnexion</a></li>
            </ul>
            <label for="menu-btn" class="btn menu-btn"><i class="fas fa-bars"></i></label>
        </div>
    </nav>

    <div class="container">
        <h2>Liste des livres</h2>
        <a class="add-librarian-btn" href="#add-book-modal" id="add-book-btn">Ajouter</a>
        <ul class="responsive-table" id="responsive-table">
            <li class="table-header">
                <div class="col col-1">Titre</div>
                <div class="col col-2">Auteur</div>
                <div class="col col-3">ISBN</div>
                <div class="col col-4">Année</div>
                <div class="col col-5">Exemplaires Totales</div>
                <div class="col col-6">Exemplaires Disponibles</div>
                <div class="col col-7"></div>
            </li>
        </ul>
    </div>

    <div id="add-book-modal" class="modal">
        <div class="modal__content">
            <div class="register-container">
                <h1>Nouveau Livre</h1>
                <form id="add-book-form" method="post">
                    <div class="form-group">
                        <label for="titre">Titre:</label>
                        <input type="text" id="titre" name="titre" required>
                    </div>
                    <div class="form-group">
                        <label for="auteur">Auteur:</label>
                        <input type="text" id="auteur" name="auteur" required>
                    </div>
                    <div class="form-group">
                        <label for="isbn">ISBN:</label>
                        <input type="text" id="isbn" name="isbn" required>
                    </div>
                    <div class="form-group">
                        <label for="anneePublication">Année de Publication:</label>
                        <input type="number" id="anneePublication" name="anneePublication" required>
                    </div>
                    <div class="form-group">
                        <label for="exemplairesTotal">Nombre d'exemplaires:</label>
                        <input type="number" id="exemplairesTotal" name="exemplairesTotal" required>
                    </div>
                    <button type="submit">Ajouter le livre</button>
                </form>
            </div>
            <a href="#" class="modal__close">×</a>
        </div>
    </div>

    <div id="edit-book-modal" class="modal">
        <div class="modal__content">
            <div class="register-container">
                <h1>Modifier Livre</h1>
                <form id="edit-book-form" method="post">
                    <div class="form-group">
                        <label for="edit-titre">Titre:</label>
                        <input type="text" id="edit-titre" name="titre" required>
                    </div>
                    <div class="form-group">
                        <label for="edit-auteur">Auteur:</label>
                        <input type="text" id="edit-auteur" name="auteur" required>
                    </div>
                    <div class="form-group">
                        <label for="edit-isbn">ISBN:</label>
                        <input type="text" id="edit-isbn" name="isbn" required>
                    </div>
                    <div class="form-group">
                        <label for="edit-anneePublication">Année de Publication:</label>
                        <input type="number" id="edit-anneePublication" name="anneePublication" required>
                    </div>
                    <div class="form-group">
                        <label for="edit-exemplairesTotal">Nombre d'exemplaires total:</label>
                        <input type="number" id="edit-exemplairesTotal" name="exemplairesTotal" required>
                    </div>
                    <button type="submit">Mettre à jour</button>
                </form>
            </div>
            <a href="#" class="modal__close">×</a>
        </div>
    </div>

    <div id="delete-book-modal" class="modal">
        <div class="modal__content">
            <div class="register-container">
                <h1>Supprimer un livre</h1>
                <form id="delete-book-form" class="delete-form" method="post">
                    <div class="form-group">
                        <div>Êtes-vous sûr de vouloir supprimer ce livre ?</div>
                    </div>
                    <div class="delete-group-buttons">
	                    <button type="button" id="cancel-delete-btn" class="delete-button-cancel">Non</button>
	                    <button type="submit" class="delete-button">Oui</button>
                    </div>
                </form>
            </div>
            <a href="#" class="modal__close">×</a>
        </div>
    </div>

    <script>
        const username = localStorage.getItem('username');
        const role = localStorage.getItem('role');
        
        const addBookBtn = document.getElementById('add-book-btn');
        const librariansLink = document.getElementById("librarians-link");
        
        if (role != 'ADMIN') {
			librariansLink.style.display = 'none';
			addBookBtn.style.display = 'none';
        }
        
        if (!username) {
            window.location.href = "${pageContext.request.contextPath}/auth/login.jsp";
        } else {
            const table = document.getElementById('responsive-table');
            fetch("${pageContext.request.contextPath}/api/books", {
                method: "GET",
                headers: {
                    "Content-Type": "application/json"
                },
            })
            .then((response) => response.json())
            .then((data) => {
                if (data.length > 0) {
                    for (let item of data) {
                        let { id, titre, auteur, isbn, anneePublication, exemplairesTotal, exemplairesDisponibles } = item;
                        let listItem = document.createElement("li");
                        let titreDiv = document.createElement('div');
                        let auteurDiv = document.createElement('div');
                        let isbnDiv = document.createElement('div');
                        let anneeDiv = document.createElement('div');
                        let exemplairesTotalDiv = document.createElement('div');
                        let exemplairesDisponiblesDiv = document.createElement('div');
                        let actionsDiv = document.createElement('div');
                        let editBtn = document.createElement('a');
                        let deleteBtn = document.createElement('a');

                        listItem.classList.add('table-row');
                        titreDiv.classList.add('col', 'col-1');
                        titreDiv.textContent = titre;
                        auteurDiv.classList.add('col', 'col-2');
                        auteurDiv.textContent = auteur;
                        isbnDiv.classList.add('col', 'col-3');
                        isbnDiv.textContent = isbn;
                        anneeDiv.classList.add('col', 'col-4');
                        anneeDiv.textContent = anneePublication;
                        exemplairesTotalDiv.classList.add('col', 'col-5');
                        exemplairesTotalDiv.textContent = exemplairesTotal;
                        exemplairesDisponiblesDiv.classList.add('col', 'col-6');
                        exemplairesDisponiblesDiv.textContent = exemplairesDisponibles;
                        actionsDiv.classList.add('col', 'col-7');
                        editBtn.classList.add('edit-librarian-btn');
                        deleteBtn.classList.add('delete-librarian-btn');

                        editBtn.href = '#edit-book-modal';
                        editBtn.textContent = 'Modifier';
                        deleteBtn.href = '#delete-book-modal';
                        deleteBtn.textContent = 'Supprimer';

                        editBtn.dataset.id = id;
                        editBtn.dataset.titre = titre;
                        editBtn.dataset.auteur = auteur;
                        editBtn.dataset.isbn = isbn;
                        editBtn.dataset.anneePublication = anneePublication;
                        editBtn.dataset.exemplairesTotal = exemplairesTotal;
                        editBtn.dataset.exemplairesDisponibles = exemplairesDisponibles;

                        deleteBtn.dataset.id = id;

                        actionsDiv.append(editBtn, deleteBtn);
                        listItem.append(titreDiv, auteurDiv, isbnDiv, anneeDiv, exemplairesTotalDiv, exemplairesDisponiblesDiv, actionsDiv);
                        table.append(listItem);
                    }

                    document.querySelectorAll('.edit-librarian-btn').forEach(btn => {
                        btn.addEventListener('click', function(e) {
                            document.getElementById('edit-titre').value = this.dataset.titre;
                            document.getElementById('edit-auteur').value = this.dataset.auteur;
                            document.getElementById('edit-isbn').value = this.dataset.isbn;
                            document.getElementById('edit-anneePublication').value = this.dataset.anneePublication;
                            document.getElementById('edit-exemplairesTotal').value = this.dataset.exemplairesTotal;
                            this.dataset.originalId = this.dataset.id;
                        });
                    });

                    document.querySelectorAll('.delete-librarian-btn').forEach(btn => {
                        btn.addEventListener('click', function(e) {
                            const bookId = this.dataset.id;
                            document.getElementById('delete-book-form').dataset.id = bookId;
                        });
                    });
                } else {
                    let emptyDiv = document.createElement('div');
                    emptyDiv.classList.add('text-center');
                    emptyDiv.textContent = "Il n'y a pas encore de livres";
                    table.append(emptyDiv);
                }
            })
            .catch((error) => {
                console.error("Error:", error);
            });
        }

        const addBookForm = document.getElementById("add-book-form");
        addBookForm.addEventListener("submit", (e) => {
            e.preventDefault();
            const id = "BOOK-" + Date.now();
            const titre = document.getElementById("titre").value;
            const auteur = document.getElementById("auteur").value;
            const isbn = document.getElementById("isbn").value;
            const anneePublication = document.getElementById("anneePublication").value;
            const exemplairesTotal = document.getElementById("exemplairesTotal").value;

            fetch("${pageContext.request.contextPath}/api/books", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": "Basic " + username + ":" + localStorage.getItem('password'),
                },
                body: JSON.stringify({ id, titre, auteur, isbn, anneePublication, exemplairesTotal: Number(exemplairesTotal), exemplairesDisponibles: Number(exemplairesTotal) }),
            })
            .then((response) => {
                if (response.status === 201) {
                    window.location.href = "${pageContext.request.contextPath}/books/catalog.jsp"; 
                } else {
                    alert("Erreur lors de l'ajout du livre");
                }
                return response.json();
            })
            .catch((error) => {
                console.error("Error:", error);
            });
        });

        const editBookForm = document.getElementById("edit-book-form");
        editBookForm.addEventListener("submit", (e) => {
            e.preventDefault();
            const titre = document.getElementById("edit-titre").value;
            const auteur = document.getElementById("edit-auteur").value;
            const isbn = document.getElementById("edit-isbn").value;
            const anneePublication = document.getElementById("edit-anneePublication").value;
            const exemplairesTotal = document.getElementById("edit-exemplairesTotal").value;
            const originalId = document.querySelector('.edit-librarian-btn[href="#edit-book-modal"]:last-child').dataset.originalId;
            
            fetch("${pageContext.request.contextPath}/api/books/" + originalId, {
                method: "PUT",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": "Basic " + username + ":" + localStorage.getItem('password'),
                },
                body: JSON.stringify({id: originalId, titre, auteur, isbn, anneePublication, exemplairesTotal: Number(exemplairesTotal), exemplairesDisponibles: Number(exemplairesTotal) }),
            })
            .then((response) => {
                if (response.ok) {
                    window.location.href = "${pageContext.request.contextPath}/books/catalog.jsp"; 
                } else {
                    alert("Erreur lors de la mise à jour du livre");
                }
                return response.json();
            })
            .catch((error) => {
                console.error("Error:", error);
            });
        });

        const deleteBookForm = document.getElementById("delete-book-form");
        deleteBookForm.addEventListener("submit", (e) => {
            e.preventDefault();
            const bookId = deleteBookForm.dataset.id;

            fetch("${pageContext.request.contextPath}/api/books/" + bookId, {
                method: "DELETE",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": "Basic " + username + ":" + localStorage.getItem('password'),
                },
            })
            .then((response) => {
                if (response.ok) {
                    window.location.href = "${pageContext.request.contextPath}/books/catalog.jsp"; 
                } else {
                    alert("Erreur lors de la suppression du livre");
                }
            })
            .catch((error) => {
                console.error("Error:", error);
            });
        });

        document.getElementById('cancel-delete-btn').addEventListener('click', () => {
            window.location.href = "${pageContext.request.contextPath}/books/catalog.jsp";
        });
    </script>
</body>
</html>