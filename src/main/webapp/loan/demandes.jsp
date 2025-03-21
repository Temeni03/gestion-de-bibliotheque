<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Demandes des Emprunts</title>
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
		.manage-btn {
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
		    margin-top: 25px;
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
		input[type="password"],
		select {
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
		.status-requested-style {
			background: #d5d500;
		    padding: 2px 6px;
		    border-radius: 15px;
		    text-align: center;
		    color: #fff;
		}
		.status-approved-style {
			background: #0fce66;
		    padding: 2px 6px;
		    border-radius: 15px;
		    text-align: center;
		    color: #fff;
		}
		.status-rejected-style {
			background: #e15858;
		    padding: 2px 6px;
		    border-radius: 15px;
		    text-align: center;
		    color: #fff;
		}
		.status-returned-style {
			background: #999999;
		    padding: 2px 6px;
		    border-radius: 15px;
		    text-align: center;
		    color: #fff;
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
                <li><a href="${pageContext.request.contextPath}/loan/demandes.jsp" id="demandes-link" class="active">Demandes</a></li>
                <li><a href="${pageContext.request.contextPath}/loan/history.jsp">Historiques</a></li>
                <li><a href="${pageContext.request.contextPath}/users/librarians.jsp" id="librarians-link">Bibliothécaires</a></li>
                <li><a href="${pageContext.request.contextPath}/auth/logout.jsp">Déconnexion</a></li>
            </ul>
            <label for="menu-btn" class="btn menu-btn"><i class="fas fa-bars"></i></label>
        </div>
    </nav>

    <div class="container">
        <h2>Demandes des Emprunts</h2>
        <a class="add-librarian-btn" href="#request-loan-modal">Demander un Emprunt</a>
        <ul class="responsive-table" id="responsive-table">
            <li class="table-header">
                <div class="col col-1">Etudiant</div>
                <div class="col col-2">Date de demande</div>
                <div class="col col-3">Date de l'emprunt </div>
                 <div class="col col-4">Date de retour</div>
                <div class="col col-5">Statut</div>
                <div class="col col-6"></div>
            </li>
        </ul>
    </div>

    <!-- Request Loan Modal -->
    <div id="request-loan-modal" class="modal">
        <div class="modal__content">
            <div class="register-container">
                <h1>Demander un Emprunt</h1>
                <form id="request-loan-form" method="post">
                    <div class="form-group">
                    	<label for="status">Choisir un livre:</label>
                       <select id="books-select">
                       </select>
                    </div>
                    <button type="submit">Demander</button>
                </form>
            </div>
            <a href="#" class="modal__close">&times;</a>
        </div>
    </div>

    <!-- Approve/Reject/Return Modal -->
    <div id="manage-loan-modal" class="modal">
        <div class="modal__content">
            <div class="register-container">
                <h1>Gérer la Demande</h1>
                <form id="manage-loan-form" method="post">
                    <div class="form-group">
                        <label for="loanId">ID de la Demande:</label>
                        <input type="text" id="loanId" name="loanId" readonly>
                    </div>
                    <div class="form-group">
                        <label for="status">Statut:</label>
                        <select id="status" name="status">
                            <option value="APPROVED">Approuver</option>
                            <option value="REJECTED">Rejeter</option>
                            <option value="RETURNED">Retourné</option>
                        </select>
                    </div>
                    <button type="submit">Mettre à jour</button>
                </form>
            </div>
            <a href="#" class="modal__close">×</a>
        </div>
    </div>


	<script >
		function formatDateFromArray(dateArray) {
			if (!dateArray)
				return "--";
		    const [year, month, day] = dateArray;
		    
	
		    return day + "-" + month + "-" + year; 
		}
		
		function formatStatus(status) {
			if (status === 'REQUESTED')
				return {message: 'DEMANDÉ', className: 'status-requested-style'};
			else if (status === 'APPROVED')
				return { message: 'APPROUVÉE', className: 'status-approved-style'};
			else if (status === 'REJECTED') 
				return {message: 'REJETÉ', className: 'status-rejected-style'};
			else if(status === 'RETURNED')
				return {message: 'RETOURNÉ', className: 'status-returned-style'};
			else 
				return {message: 'NA', className: ''}
		}
	
	</script>
    <script>
        const username = localStorage.getItem('username');
        const role = localStorage.getItem('role');
        
        const librariansLink = document.getElementById("librarians-link");
        
        if (role != 'ADMIN') {
			librariansLink.style.display = 'none';
        }
        
        if (!username) {
            window.location.href = "${pageContext.request.contextPath}/auth/login.jsp";
        } else {
            const table = document.getElementById('responsive-table');

            
            const fetchLoans = () => {
                let url, method, headers;
                if (role === 'STUDENT') {
                    url = "${pageContext.request.contextPath}/api/loans/user/" + username;
                    headers = {
                        "Content-Type": "application/json",
                        "Authorization": "Basic " + username + ":" + localStorage.getItem('password')
                    };
                } else if (role === 'LIBRARIAN' || role === 'ADMIN') {
                    url = "${pageContext.request.contextPath}/api/loans";
                    headers = {
                        "Content-Type": "application/json",
                        "Authorization": "Basic " + username + ":" + localStorage.getItem('password')
                    };
                }

                fetch(url, {
                    method: "GET",
                    headers: headers,
                })
                .then((response) => response.json())
                .then((data) => {
                    if (data.length > 0) {
                        for (let item of data) {
							console.log(item);
                            let { id, bookId, userId, requestDate, loanDate, returnDate, status } = item;
                            let listItem = document.createElement("li");
                            let userIdDiv = document.createElement('div');
                            let requestDateDiv = document.createElement('div');
                            let loanDateDiv = document.createElement('div');
                            let returnDateDiv = document.createElement('div')
                            let statusDiv = document.createElement('div');
                            let actionsDiv = document.createElement('div');
                            let manageBtn = document.createElement('a');
                            let {message, className } = formatStatus(status);
                            
                            console.log({message, className})

                            listItem.classList.add('table-row');
                            userIdDiv.classList.add('col', 'col-1');
                            userIdDiv.textContent = userId;
                            requestDateDiv.classList.add('col', 'col-2');
                            requestDateDiv.textContent = formatDateFromArray(requestDate);
                            statusDiv.classList.add('col', 'col-3');
                            loanDateDiv.textContent = formatDateFromArray(loanDate);
                            statusDiv.classList.add('col', 'col-4');
                            returnDateDiv.textContent = formatDateFromArray(returnDate);
                            statusDiv.classList.add('col', 'col-5', className);
                            statusDiv.textContent = message;
                            actionsDiv.classList.add('col', 'col-6');
                            manageBtn.classList.add('manage-loan-btn');

                            if (role === 'LIBRARIAN' || role === 'ADMIN') {
                                manageBtn.href = '#manage-loan-modal';
                                manageBtn.classList.add("manage-btn");
                                manageBtn.textContent = 'Gérer';
                                manageBtn.dataset.id = id;
                                manageBtn.dataset.status = status;
                                actionsDiv.append(manageBtn);
                            }

                            listItem.append( userIdDiv, requestDateDiv,loanDateDiv,returnDateDiv, statusDiv, actionsDiv);
                            table.append(listItem);
                        }

                        document.querySelectorAll('.manage-loan-btn').forEach(btn => {
                            btn.addEventListener('click', function(e) {
                                document.getElementById('loanId').value = this.dataset.id;
                                document.getElementById('status').value = this.dataset.status;
                            });
                        });
                    } else {
                        let emptyDiv = document.createElement('div');
                        emptyDiv.classList.add('text-center');
                        emptyDiv.textContent = "Aucune demande d'emprunt trouvée";
                        table.append(emptyDiv);
                    }
                })
                .catch((error) => {
                    console.error("Error:", error);
                });
            };
            
            const booksSelect = document.getElementById("books-select");
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
                        let { id, titre } = item;
                        let option = document.createElement("option");
                        option.setAttribute('value', id);
                        option.textContent = titre;
                        option.classList.add('col', 'col-1');
                        booksSelect.append(option);
                    }
                 
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

            fetchLoans();
            // Request Loan Form
            const requestLoanForm = document.getElementById("request-loan-form");
            requestLoanForm.addEventListener("submit", (e) => {
                e.preventDefault();
                const bookId = document.getElementById("books-select").value;

                fetch("${pageContext.request.contextPath}/api/loans/request", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                        "Authorization": "Basic " + username + ":" + localStorage.getItem('password')
                    },
                    body: JSON.stringify({ userId: username, bookId }),
                })
                .then((response) => {
                    if (response.ok) {
						alert("Votre demande a été envoyée. Veuillez attendre qu'elle soit approuvée ")
                        window.location.href = "${pageContext.request.contextPath}/loan/demandes.jsp";
                    } else {
                        alert("Erreur lors de la demande d'emprunt");
                    }
                })
                .catch((error) => {
                    console.error("Error:", error);
                });
            });

            // Manage Loan Form
            const manageLoanForm = document.getElementById("manage-loan-form");
            manageLoanForm.addEventListener("submit", (e) => {
                e.preventDefault();
                const loanId = document.getElementById("loanId").value;
                const status = document.getElementById("status").value;

                let url, method;
                if (status === 'APPROVED') {
                    url = "${pageContext.request.contextPath}/api/loans/" + loanId + "/approve";
                    method = "PUT";
                } else if (status === 'REJECTED') {
                    url = "${pageContext.request.contextPath}/api/loans/" + loanId + "/reject";
                    method = "PUT";
                } else if (status === 'RETURNED') {
                    url = "${pageContext.request.contextPath}/api/loans/" + loanId + "/return";
                    method = "PUT";
                }

                fetch(url, {
                    method: method,
                    headers: {
                        "Content-Type": "application/json",
                        "Authorization": "Basic " + username + ":" + localStorage.getItem('password')
                    },
                })
                .then((response) => {
                    if (response.ok) {
                        window.location.href = "${pageContext.request.contextPath}/loan/demandes.jsp";
                    } else {
                        alert("Erreur lors de la mise à jour du statut");
                    }
                })
                .catch((error) => {
                    console.error("Error:", error);
                });
            });
        }
        
        const loadBooksOptions = () => {
			const booksSelect = document.getElementById("books-select");
			
			fetch("http://localhost:8080/gestion-de-bibliotheque/api/books", {
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
                        let option = document.createElement("option");
                        option.setAttribute('value', id);
                        option.textContent = titre;
                        option.classList.add('col', 'col-1');

                        deleteBtn.dataset.id = id;

                        actionsDiv.append(editBtn, deleteBtn);
                        listItem.append(titreDiv, auteurDiv, isbnDiv, anneeDiv, exemplairesTotalDiv, exemplairesDisponiblesDiv, actionsDiv);
                        table.append(listItem);
                    }
                 
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
    </script>
</body>
</html>