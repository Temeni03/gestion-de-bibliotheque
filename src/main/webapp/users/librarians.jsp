<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Gestion des bibliothécaires</title>
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
		  .nav-links li a{
		    padding: 0 20px;
		    display: block;
		    font-size: 20px;
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
		  max-width: 1000px;
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
		    flex-basis: 20%;
		  }
		  .col-2 {
		    flex-basis: 20%;
		  }
		  .col-3 {
		    flex-basis: 20%;
		  }
		  .col-4 {
		    flex-basis: 20%;
		  }
		  .col-5 {
		    flex-basis: 20%;
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
                <li><a href="${pageContext.request.contextPath}/books/catalog.jsp">Livres</a></li>
                <li><a href="${pageContext.request.contextPath}/loan/demandes.jsp">Demandes</a></li>
                <li><a href="${pageContext.request.contextPath}/users/librarians.jsp" class="active">Bibliothécaires</a></li>
                <li><a href="${pageContext.request.contextPath}/auth/logout.jsp">Déconnexion</a></li>
            </ul>
            <label for="menu-btn" class="btn menu-btn"><i class="fas fa-bars"></i></label>
        </div>
    </nav>

    <div class="container">
        <h2>Liste des bibliothécaires</h2>
        <a class="add-librarian-btn" href="#demo-modal">Ajouter</a>
        <ul class="responsive-table" id="responsive-table">
            <li class="table-header">
                <div class="col col-1">Username</div>
                <div class="col col-2">Nom</div>
                <div class="col col-3">Prenom</div>
                <div class="col col-4">Matricule</div>
                <div class="col col-5">Actions</div>
            </li>
        </ul>
    </div>

    <!-- Add Librarian Modal -->
    <div id="demo-modal" class="modal">
        <div class="modal__content">
            <div class="register-container">
                <h1>Nouveau Bibliothécaire</h1>
                <form id="register-form" method="post">
                    <div class="form-group">
                        <label for="username">Username:</label>
                        <input type="text" id="username" name="username" required>
                    </div>
                    <div class="form-group">
                        <label for="nom">Nom:</label>
                        <input type="text" id="nom" name="nom" required>
                    </div>
                    <div class="form-group">
                        <label for="prenom">Prenom:</label>
                        <input type="text" id="prenom" name="prenom" required>
                    </div>
                    <div class="form-group">
                        <label for="matricule">Matricule:</label>
                        <input type="text" id="matricule" name="matricule" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" id="password" name="password" required>
                    </div>
                    <button type="submit">Créer un compte</button>
                </form>
            </div>
            <a href="#" class="modal__close">&times;</a>
        </div>
    </div>

    <!-- Edit Librarian Modal -->
    <div id="edit-modal" class="modal">
        <div class="modal__content">
            <div class="register-container">
                <h1>Modifier Bibliothécaire</h1>
                <form id="edit-form" method="post">
                    <div class="form-group">
                        <label for="edit-username">Username:</label>
                        <input type="text" id="edit-username" name="username" readonly>
                    </div>
                    <div class="form-group">
                        <label for="edit-nom">Nom:</label>
                        <input type="text" id="edit-nom" name="nom" required>
                    </div>
                    <div class="form-group">
                        <label for="edit-prenom">Prenom:</label>
                        <input type="text" id="edit-prenom" name="prenom" required>
                    </div>
                    <div class="form-group">
                        <label for="edit-matricule">Matricule:</label>
                        <input type="text" id="edit-matricule" name="matricule" required>
                    </div>
                    <div class="form-group hidden">
                        <label for="edit-password">Nouveau Password (facultatif):</label>
                        <input type="password" id="edit-password" name="password">
                    </div>
                    <button type="submit">Mettre à jour</button>
                </form>
            </div>
            <a href="#" class="modal__close">×</a>
        </div>
    </div>

    <!-- Delete Librarian Modal -->
    <div id="delete-modal" class="modal">
        <div class="modal__content">
            <div class="register-container">
                <h1>Supprimer un bibliothécaire</h1>
                <form id="delete-form" class="delete-form" method="post">
                    <div class="form-group">
                        <div>Êtes-vous sûr de vouloir supprimer ce bibliothécaire ?</div>
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
        if (!username) {
            window.location.href = "${pageContext.request.contextPath}/auth/login.jsp";
        } else if (role !== 'ADMIN') {
			window.history.back();
		} else {
            const table = document.getElementById('responsive-table');
            fetch("${pageContext.request.contextPath}/api/users/librarians/", {
                method: "GET",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": "Basic admin:admin"
                },
            })
            .then((response) => response.json())
            .then((data) => {
                if (data.length > 0) {
                    for (let item of data) {
                        let { username, nom, prenom, matricule, password } = item;
                        let listItem = document.createElement("li");
                        let usernameDiv = document.createElement('div');
                        let nomDiv = document.createElement('div');
                        let prenomDiv = document.createElement('div');
                        let matriculeDiv = document.createElement('div');
                        let actionsDiv = document.createElement('div');
                        let editBtn = document.createElement('a');
                        let deleteBtn = document.createElement('a');

                        listItem.classList.add('table-row');
                        usernameDiv.classList.add('col', 'col-1');
                        usernameDiv.textContent = username;
                        nomDiv.classList.add('col', 'col-2');
                        nomDiv.textContent = nom;
                        prenomDiv.classList.add('col', 'col-3');
                        prenomDiv.textContent = prenom;
                        matriculeDiv.classList.add('col', 'col-4');
                        matriculeDiv.textContent = matricule;
                        actionsDiv.classList.add('col', 'col-5');
                        editBtn.classList.add('edit-librarian-btn');
                        deleteBtn.classList.add('delete-librarian-btn');

                        editBtn.href = '#edit-modal';
                        editBtn.textContent = 'Modifier';
                        deleteBtn.href = '#delete-modal';
                        deleteBtn.textContent = 'Supprimer';

                        editBtn.dataset.username = username;
                        editBtn.dataset.nom = nom;
                        editBtn.dataset.prenom = prenom;
                        editBtn.dataset.matricule = matricule;
                        editBtn.dataset.password = password;

                        deleteBtn.dataset.username = username;

                        actionsDiv.append(editBtn, deleteBtn);
                        listItem.append(usernameDiv, nomDiv, prenomDiv, matriculeDiv, actionsDiv);
                        table.append(listItem);
                    }

                    document.querySelectorAll('.edit-librarian-btn').forEach(btn => {
                        btn.addEventListener('click', function(e) {
                            document.getElementById('edit-username').value = this.dataset.username;
                            document.getElementById('edit-nom').value = this.dataset.nom;
                            document.getElementById('edit-prenom').value = this.dataset.prenom;
                            document.getElementById('edit-matricule').value = this.dataset.matricule;
                            document.getElementById('edit-password').value = this.dataset.password;
                        });
                    });

                    document.querySelectorAll('.delete-librarian-btn').forEach(btn => {
                        btn.addEventListener('click', function(e) {
                            const librarianUsername = this.dataset.username;
                            document.getElementById('delete-form').dataset.username = librarianUsername;
                        });
                    });
                } else {
                    let emptyDiv = document.createElement('div');
                    emptyDiv.classList.add('text-center');
                    emptyDiv.textContent = "Il n'y a pas encore des bibliothécaires";
                    table.append(emptyDiv);
                }
            })
            .catch((error) => {
                console.error("Error:", error);
            });
        }

        const registerForm = document.getElementById("register-form");
        registerForm.addEventListener("submit", (e) => {
            e.preventDefault();
            const username = document.getElementById("username").value;
            const nom = document.getElementById("nom").value;
            const prenom = document.getElementById("prenom").value;
            const matricule = document.getElementById("matricule").value;
            const password = document.getElementById("password").value;

            fetch("${pageContext.request.contextPath}/api/users/librarians/", {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": "Basic admin:admin"
                },
                body: JSON.stringify({ username, nom, prenom, matricule, password }),
            })
            .then((response) => {
                if (response.status == 409) {
                    alert("Un utilisateur existe déjà avec cet username");
                }
                if (response.status == 201) {
                    window.location.href = "${pageContext.request.contextPath}/users/librarians.jsp";
                }
                return response.json();
            })
            .catch((error) => {
                console.error("Error:", error);
            });
        });

        const editForm = document.getElementById("edit-form");
        editForm.addEventListener("submit", (e) => {
            e.preventDefault();
            const username = document.getElementById("edit-username").value;
            const nom = document.getElementById("edit-nom").value;
            const prenom = document.getElementById("edit-prenom").value;
            const matricule = document.getElementById("edit-matricule").value;
            const password = document.getElementById("edit-password").value;

            const updateData = { username, nom, prenom, matricule, password };
            const url = "${pageContext.request.contextPath}/api/users/librarians/" + username;

            fetch(url, {
                method: "PUT",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": "Basic admin:admin"
                },
                body: JSON.stringify(updateData),
            })
            .then((response) => {
                if (response.ok) {
                    window.location.href = "${pageContext.request.contextPath}/users/librarians.jsp";
                } else {
                    alert("Erreur lors de la mise à jour");
                }
                return response.json();
            })
            .catch((error) => {
                console.error("Error:", error);
            });
        });

        const deleteForm = document.getElementById("delete-form");
        deleteForm.addEventListener("submit", (e) => {
            e.preventDefault();
            const librarianUsername = deleteForm.dataset.username;

            fetch("${pageContext.request.contextPath}/api/users/librarians/" + librarianUsername, {
                method: "DELETE",
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": "Basic admin:admin"
                },
            })
            .then((response) => {
                if (response.ok) {
                    window.location.href = "${pageContext.request.contextPath}/users/librarians.jsp";
                } else {
                    alert("Erreur lors de la suppression");
                }
            })
            .catch((error) => {
                console.error("Error:", error);
            });
        });

        document.getElementById('cancel-delete-btn').addEventListener('click', () => {
            window.location.href = "${pageContext.request.contextPath}/users/librarians.jsp";
        });
    </script>
</body>
</html>