<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Consulta de contatos</title>
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="../resources/css/datatables.min.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/components/navbar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/admin/components/messages.jsp"></jsp:include>

	<div class="container mt-4 ">
		<div class="card ">
			<div class="card-body ">
				<h4>Consulta de contatos</h4>
				<hr />
				<form id="formConsulta" action="consultar-contato-post" method="post">
					<div class="row mb-2 col-md-6 ">
						<div class="col-md-3 ">
							<input type="text" id="nome" name="nome" class="form-control">
						</div>
						<div class="col-md-6 ">
							<input type="submit" value="Pesquisar contato"
								class="btn btn-success" />
						</div>
					</div>
					
				</form>
			<c:if test="${not empty listagem_contatos}">
				<div class="mt-3 table-responsive ">
					<table id="tabela" class="table">
						<thead>
							<tr>
								<th>Nome</th>
								<th>Email</th>
								<th>Telefone</th>
								<th>Tipo</th>
								<th>Operações</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${listagem_contatos}" var="contato">
							<tr>
								<td>${contato.nome}</td>
								<td>${contato.email}</td>
								<td>${contato.telefone}</td>
								<td>
								
								<c:if test="${contato.tipo == 1 }">
								FAMÍLIA								
								</c:if>
								<c:if test="${contato.tipo == 2 }">
								AMIGOS								
								</c:if>
								<c:if test="${contato.tipo == 3 }">
								TRABALHO								
								</c:if>
								
								</td>
								<td><a href="/java_contatosweb/admin/editar-contato?id=${contato.id}" class="btn btn-sm btn-outline-primary">Editar
								</a> <a href="/java_contatosweb/admin/apagar-contato?id=${contato.id}" onclick="return confirm('Deseja excluir esse contato?');" class="btn btn-sm btn-outline-danger">Apagar</a>
								</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				</c:if>
			</div>
		</div>
	</div>

	<script src="../resources/js/bootstrap.bundle.min.js"></script>
	<script src="../resources/js/jquery-3.7.0.min.js"></script>
	<script src="../resources/js/jquery.validate.min.js"></script>
	<script src="../resources/js/additional-methods.min.js"></script>
	<script src="../resources/js/messages_pt_BR.min.js"></script>
	<script src="../resources/js/datatables.min.js"></script>

	<script>
$(document).ready(function(){
	$("#formConsulta").validate({
	rules: {
		"nome": {
				required: true
				}
		}
	});
	$("#tabela").DataTable({
		language: {
					url: '../resources/js/dataTables.pt-BR.json'

				}
		});
	})
</script>

</body>
</html>