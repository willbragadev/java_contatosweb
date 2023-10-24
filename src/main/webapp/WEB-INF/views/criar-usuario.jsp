<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Criação de conta</title>

<style>
label.error { color: #d9534f; }
input.error { border: 2px solid #d9534f; }
</style>

<link href="resources/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

 <div class="container" style="min-height: 100vh;">
        <div class="row justify-content-center mt-5">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        Criar Conta
                    </div>
                    <div class="card-body">
                    
                    <h4 class="text-danger text-center">${mensagem_sucesso}</h4>
                    <h4 class="text-success text-center">${mensagem_erro}</h4>
                    
                        <form id="formCriarUsuario" method="post" action="/java_contatosweb/criar-usuario-post">
                            <div class="mb-3">
                                <label for="nome" class="form-label">Nome</label>
                                <input type="text" class="form-control" id="nome" name="nome" placeholder="Seu nome">
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">E-mail</label>
                                <input type="email" class="form-control" id="email" name="email" placeholder="Seu e-mail">
                            </div>
                            <div class="mb-3">
                                <label for="senha" class="form-label">Senha</label>
                                <input type="password" class="form-control" id="senha" name="senha" placeholder="Sua senha">
                            </div>
                            <div class="mb-3">
                                <label for="confirmarSenha" class="form-label">Confirmar Senha</label>
                                <input type="password" class="form-control" id="confirmarSenha" name="confirmarSenha" placeholder="Confirme sua senha">
                            </div>
                             
                            <button type="submit" class="btn btn-primary">Criar Conta</button>
                            <a class="btn btn-outline-info" href="/java_contatosweb/" role="button">Voltar para tela inicial</a>
                          
                        </form>
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
	$("#formCriarUsuario").validate({
		rules: {
			"nome": {
				required: true,
				minlength: 3,
				maxlength: 100
			},
			"email": {
				required: true,
				email: true,				
			},
			"senha": {
				required: true,
				pattern: /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/
			},
			"confirmarSenha": {
			required: true,
			equalTo: "#senha"
			}	
				},
			messages: {
				"senha": {
					pattern: "A senha deve ter até 8 caracteres. (letras, números e pelo menos 1 caractere especial.)"
				}
			}
	})
})
</script>
</body>
</html>