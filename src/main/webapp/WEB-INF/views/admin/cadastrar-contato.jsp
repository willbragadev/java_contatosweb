<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Criar novo contato</title>
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<style>
label.error { color: #49534f; }
input.error { border: #49534f; }
select.error { border: #49534f; }
textarea.error { border: #49534f; }
</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/admin/components/navbar.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/admin/components/messages.jsp"></jsp:include>
	
	 <div class="container mt-5">
        <h2>Novo contato</h2>
        <h4 class="text-success text-center">${mensagem}</h4>
        <form id="formCadastro" action="cadastrar-contato-post" method="post">
            <div class="mb-3">
                <label for="nome" class="form-label">Nome:</label>
                <input type="text" class="form-control" id="nome" name="nome" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label for="telefone" class="form-label">Telefone:</label>
                <input type="tel" class="form-control" id="telefone" name="telefone">
            </div>
            <div class="mb-3">
                <label for="tipo" class="form-label">Tipo Contato:</label>
                <select class="form-select" id="tipo" name="tipo">
                    <option value="1">Família</option>
                    <option value="2">Amigos</option>
                    <option value="3">Trabalho</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Criar contato</button>
            <a class="btn btn-outline-info" href="/admin/java_contatosweb/dashboard" role="button">Voltar para tela inicial</a>
        </form>
    </div>
    <script src="../resources/js/jquery-3.7.0.min.js"></script>
    <script>
    $(document).ready(function(){
    	    	
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
    	            maxlength: 20,
    	            number: true
    	        },
    	        "tipo": {
    	            required: true
    	        }
    	    }
    	});
    })
    </script>	
	
	<script src="../resources/js/bootstrap.bundle.min.js"></script>
	<script src="../resources/js/jquery-3.7.0.min.js"></script>
	<script src="../resources/js/jquery.validate.min.js"></script>
	<script src="../resources/js/additional-methods.min.js"></script>
	<script src="../resources/js/messages_pt_BR.min.js"></script>

</body>
</html>