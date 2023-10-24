<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<style>
label.error { color: #d9534f; }
input.error { border: 2px solid #d9534f; }
</style>
</head>
<body>



    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        Login
                    </div>
                    <div class="card-body">
                    
                    <h1 class="text-center">Sistema de contatos Web</h1>
                    
                    <h4 class="text-danger text-center">${mensagem_erro}</h4>
                    
                        <form id="formLogin" action="login-post" method="post">
                            <div class="mb-3">
                                <label for="email" class="form-label">Email de Acesso</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Seu email">
                            </div>
                            <div class="mb-3">
                                <label for="senha" class="form-label">Senha</label>
                                <input type="password" class="form-control" id="senha" name="senha" placeholder="Sua senha">
                            </div>
                            <button type="submit" class="btn btn-primary">Entrar</button>
                        </form>
                    </div>
                    <div class="card-footer">
                        <a href="/java_contatosweb/criar-usuario" class="btn btn-outline-primary">Não possui conta?</a>
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

<script>
$(document).ready(function() {
	$("#formLogin").validate({
		rules: {
			"email": {
				required: true,
				email: true,
			},
			"senha": {
				required: true,
				pattern: /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/
			}
		},
		messages: {
			"senha": {
				pattern: "A senha deve ter pelo menos 8 caracteres e conter letras, números e pelo menos 1 caractere especial."
			}
		}
	});
});
</script>

</body>
</html>