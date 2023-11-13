<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">

</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/components/navbar.jsp"></jsp:include>


	<div class="container mt-5">
		<h2>Editar contato</h2>
		<form id="formEdicao" action="editar-contato-post" method="post">
			<div class="mb-3">

				
				 <label for="nome"	class="form-label">Nome:</label> <input type="text"
					class="form-control" id="nome" name="nome" value="${nome}" />
			</div>
			<div class="mb-3">
				<label for="email" class="form-label">Email:</label> <input
					type="email" class="form-control" id="email" name="email"
					value="${email}" />
			</div>
			<div class="mb-3">
				<label for="telefone" class="form-label">Telefone:</label> <input
					type="tel" class="form-control" id="telefone" name="telefone"
					value="${telefone}" />
			</div>
			<div class="mb-3">
				<label for="tipo" class="form-label">Tipo Contato:</label> <select
					class="form-select" id="tipo" name="tipo">
					<option value="">Escolha uma opção</option>
					<option value="1" ${tipo == 1 ? "selected" : ""}>FAMILIA</option>
					<option value="2" ${tipo == 2 ? "selected" : ""}>AMIGOS</option>
					<option value="3" ${tipo == 3 ? "selected" : ""}>TRABALHO</option>
				</select>
			</div>
			
			<input type="hidden" name="id" value="${id}" />
			
			<button type="submit" class="btn btn-primary">Salvar contato</button>
			<a href="/java_contatosweb/admin/consultar-contato"
				class="btn btn-sm btn-outline-primary">Ir para consulta</a>
		</form>
	</div>



	<script src="../resources/js/bootstrap.bundle.min.js"></script>
	<script src="../resources/js/jquery-3.7.0.min.js"></script>
	<script src="../resources/js/jquery.validate.min.js"></script>
	<script src="../resources/js/additional-methods.min.js"></script>
	<script src="../resources/js/messages_pt_BR.min.js"></script>
	<script src="../resources/js/jquery.dataTables.min.js"></script>
</body>
</html>