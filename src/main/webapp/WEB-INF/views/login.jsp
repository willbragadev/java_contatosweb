<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link rel="icon" type="image/x-icon" href="./resources/images/favicon.png">

<style>
label.error {
	color: #d9534f;
}

input.error {
	border: 2px solid #d9534f;
}

body {
	background: linear-gradient(45deg, #449CD7, #642AD3);
	height: 100vh;	
	margin: 0; 
	display: flex;
	justify-content: center;
	align-items: center;
	color: white; 
	font-size: 16px;
}

.btn-login {
	background-color: #449cd7;
	color: white;
}

.btn-login:hover {
	background-color: #5951d4;
	color: #ffffff;
}

.btn-criar {
	border-color: #449cd7;
	border-width: 2px;
	color: #449cd7;
}

.btn-criar:hover {
	border-color: #5951d4;
	border-width: 2px;
	color: #5951d4;
}

.input-group {
	position: relative;
}

.input-group button {
	position: absolute;
	right: 0;
	top: 0;
	height: 100%;
	z-index: 2;
	border: none;
	border-radius: 0 3px 3px 0;
}

.input-group input {
	padding-right: 35px;
	
}
</style>
</head>
<body>



	<div class="container">
		<div class="row justify-content-center mt-1">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body row">
						<!-- Coluna da imagem -->
						<div class="col-md-6 border-end">
							<img src="./resources/images/imagem-login.png" alt="Contate seus amigos com Will Contact!"
								class="img-fluid p-0">
						</div>
						<!-- Coluna dos campos de login -->
						<div class="col-md-6 mt-3 mb-3">
							<img src="./resources/images/will-contact-logo-azul.png"
								alt="Sua Imagem" style="max-width: 50%;" class="mx-auto d-block">
							<h4 class="text-danger text-center">${mensagem_erro}</h4>
							<form id="formLogin" action="login-post" method="post">
								<div class="mt-4">
									<div class="mb-3">
										<label for="email" class="form-label mb-1"> <i
											class="fa-regular fa-user"></i> Email de Acesso
										</label> <input type="email" class="form-control" id="email"
											name="email" placeholder="Seu email">
									</div>
									<div class="mb-3">
										<label for="senha" class="form-label mb-1"> <i
											class="fa-solid fa-unlock-keyhole"></i> Senha
										</label>
										<div class="input-group">
											<input type="password" class="form-control" id="senha"
												name="senha" placeholder="Sua senha"
												aria-describedby="togglePassword">
											<button class="btn btn-outline-secondary" type="button"
												id="togglePassword">
												<i class="fa-regular fa-eye"></i>
											</button>
										</div>
									</div>

									<div class="d-flex justify-content-center">
										<button type="submit" class="btn btn-login flex-grow-1 mx-2">ENTRAR</button>
										<a href="/java_contatosweb/criar-usuario"
											class="btn btn-criar flex-grow-1 mx-2">CRIAR CONTA</a>
									</div>
								</div>
							</form>
						</div>


					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/jquery-3.7.0.min.js"></script>
	<script src="resources/js/jquery.validate.min.js"></script>
	<script src="resources/js/additional-methods.min.js"></script>
	<script src="resources/js/messages_pt_BR.min.js"></script>
	<script src="https://kit.fontawesome.com/0940795078.js"></script>

	<script>
		$(document).ready(
				function() {
					$("#togglePassword").on(
							'click',
							function() {
								var senhaField = $("#senha");
								var senhaFieldType = senhaField.attr('type');
								if (senhaFieldType === 'password') {
									senhaField.attr('type', 'text');
									$("#togglePassword i")
											.removeClass('fa-eye').addClass(
													'fa-eye-slash');
								} else {
									senhaField.attr('type', 'password');
									$("#togglePassword i").removeClass(
											'fa-eye-slash').addClass('fa-eye');
								}
							});
				});
	</script>


	<script>
		$(document)
				.ready(
						function() {
							$("#formLogin")
									.validate(
											{
												rules : {
													"email" : {
														required : true,
														email : true,
													},
													"senha" : {
														required : true,
														pattern : /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/
													}
												},
												messages : {
													"senha" : {
														pattern : "A senha deve ter pelo menos 8 caracteres e conter letras, números e pelo menos 1 caractere especial."
													}
												}
											});
						});
	</script>

</body>
</html>