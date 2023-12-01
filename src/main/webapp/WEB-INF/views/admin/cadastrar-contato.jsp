<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Criar novo contato</title>
<link rel="icon" type="image/x-icon" href="../resources/images/favicon.png">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<style>
label.error { color: #d9534f; }
input.error { border: 2px solid #d9534f; }
.asterisco { color: red; }
.placeholder{color: 999999;}
.placeholder-option {
    color: #999999; /* Define a cor do texto do placeholder como #999999 */
}

body {
    background-color: #F7F7F7;    
} 

</style>
    <script src="../resources/js/jquery-3.7.0.min.js"></script>
    
    <!-- Carregamento do jQuery Mask Plugin -->
    <script src="../resources/js/jquery.maskedinput.js" type="text/javascript"></script>
</head>
<body>

	<jsp:include page="/WEB-INF/views/admin/components/navbar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/admin/components/messages.jsp"></jsp:include>

	<div class="container mt-5">
		<h2>Novo contato</h2>
		<h4 class="text-success text-center">${mensagem}</h4>
		<form id="formCadastro" action="cadastrar-contato-post" method="post">
		
		<div class="row mb-2">
			
			<div class="col-md-6">
				<label for="nome" class="form-label">Nome: <span class="asterisco">*</span></label> <input
					type="text" class="form-control" id="nome" name="nome">
			</div>
			
			<div class="col mb-3">
				<label for="nome" class="form-label"> Sobrenome:</label> <input
					type="text" class="form-control" id="sobrenome" name="sobrenome">
			</div>
		
		</div>
		
		<div class="row mb-2">
			
			<div class="col-md-6">
				<label for="email" class="form-label">Email: <span class="asterisco">*</span></label> <input
					type="email" class="form-control" id="email" name="email">
			</div>
			
			<div class="col mb-3">
				<label for="telefone" class="form-label">Telefone: <span class="asterisco">*</span> </label> <input
					type="tel" class="form-control" id="telefone" name="telefone">
			</div>
			
		</div>
			
		<div class="row mb-2">
			
			<div class="col mb-3">
				<label for="data" class="form-label"> Data Aniversário:</label> <input
					type="date" class="form-control" id="aniversario" name="aniversario">
			</div>
			
			<div class="col mb-3">
				<label for="tipo" class="form-label" >Tipo Contato: <span class="asterisco">*</span> </label> <select class="form-select" id="tipo" name="tipo">
					<option selected disabled hidden class="placeholder-option">Selecione uma opção</option>
					<option value="1">Família</option>
					<option value="2">Amigos</option>
					<option value="3">Trabalho</option>
					<option value="4">Acadêmico</option>
					<option value="5">Outros</option>
				</select>
			</div>	
			
		</div>			
			
			<div class="mb-3">
				<label for="endereco" class="form-label"> Endereço:</label> <input
					type="text" class="form-control" id="endereco" name="endereco">
			</div>			
			
			<h6 class="text-danger">* Campos obrigatórios</h6>


			<button type="submit" class="btn btn-primary">Criar contato</button>
			<a class="btn btn-outline-info"
				href="/java_contatosweb/admin/dashboard" role="button">Voltar
				para tela inicial</a>
		</form>
	</div>

<script src="../resources/js/jquery.validate.min.js"></script>
<script src="../resources/js/additional-methods.min.js"></script>
<script src="../resources/js/messages_pt_BR.min.js"></script>
<script src="../resources/js/bootstrap.bundle.min.js"></script>
	

<script>
    $(document).ready(function() {
        $("#telefone").mask("(99) 99999-9999");

        $("#formCadastro").validate({
            rules: {
                "nome": {
                    required: true,
                    minlength: 3,
                    maxlength: 100
                },
                "email": {
                    required: true,
                    minlength: 5,
                    maxlength: 200,
                    email: true
                },
                "telefone": {
                    required: true,
                    minlength: 7,
                    maxlength: 20
                     },
                "tipo": {
                    required: true
                }
            }
        });
    });
</script>
	<script>
	$("#tabela").DataTable({
	    language: {
	        url: '../resources/js/dataTables.pt-BR.json',
	        "infoEmpty": "Nada foi encontrado, que pena!",
	        "zeroRecords": "Nenhum registro correspondente encontrado"
	    }
	});
	</script>





</body>
</html>