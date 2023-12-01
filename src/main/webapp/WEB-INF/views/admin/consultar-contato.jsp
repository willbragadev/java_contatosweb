<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<link rel="icon" type="image/x-icon" href="../resources/images/favicon.png">
<link href="../resources/css/bootstrap.min.css" rel="stylesheet">
<link href="../resources/css/datatables.min.css" rel="stylesheet">
<style>
body {
    background-color: #F7F7F7;    
}
.table-hover thead {
    background-color: red;
    /* Outros estilos que você deseja aplicar ao cabeçalho */
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/admin/components/navbar.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/admin/components/messages.jsp"></jsp:include>
	
				<input type="hidden" name="id" value="${id}" />

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
							<input type="submit" value="Pesquisar contato" class="btn btn-success" />
						</div>
					</div>
					
				</form>
			<div class="mt-3 table-responsive ">
					<table id="tabela" class="table table-hover">
						<thead >
							<tr>
								<th> <i class="fa-regular fa-user"></i> Nome</th>
								<th> <i class="fa-regular fa-envelope"></i> Email</th>
								<th> <i class="fa-regular fa-comment"></i> Telefone</th>
								<th> <i class="fa-regular fa-address-card"></i> Tipo</th>
								<th> <i class="fa-regular fa-rectangle-list"></i> Operações</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${listagem_contatos}" var="contato">
							<tr>
								<td>${contato.nome} ${contato.sobrenome}</td>
								<td>${contato.email}</td>
								<td>${contato.telefone}</td>
								<td>
								
								<c:if test="${contato.tipo == 1 }">
								<span class="badge bg-success">FAMÍLIA</span>							
								</c:if>
								<c:if test="${contato.tipo == 2 }">
								<span class="badge bg-info">AMIGOS</span>								
								</c:if>
								<c:if test="${contato.tipo == 3 }">
								<span class="badge bg-danger">TRABALHO</span>									
								</c:if>
								<c:if test="${contato.tipo == 4 }">
								<span class="badge bg-warning">ACADÊMICO</span>								
								</c:if>								
								<c:if test="${contato.tipo == 5 }">
								<span class="badge bg-dark">OUTROS</span>								
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
			
			</div>
		</div>
	</div>

	<script src="../resources/js/bootstrap.bundle.min.js"></script>
	<script src="../resources/js/jquery-3.7.0.min.js"></script>
	<script src="../resources/js/jquery.validate.min.js"></script>
	<script src="../resources/js/additional-methods.min.js"></script>
	<script src="../resources/js/messages_pt_BR.min.js"></script>
	<script src="../resources/js/datatables.min.js"></script>
	<script src="https://kit.fontawesome.com/0940795078.js"></script>
	<script src="../resources/js/jquery.maskedinput.js" type="text/javascript"></script>


	<script>
    jQuery(function($){
        $("#telefone").mask("(99) 99999-9999");
    });
	</script>

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
			url: '../resources/js/dataTables.pt-BR.json',
                 "zeroRecords": "Poxa, você não tem nenhum contato ainda!"

				}
		});
	})
</script>



</body>
</html>