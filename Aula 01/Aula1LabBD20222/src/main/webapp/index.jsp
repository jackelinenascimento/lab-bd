<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Aula Servlet</title>
</head>
<body>
	<H1 align="center">Produtos</H1>
	<br />
	<div align="center">
		<form action="produto" method="post">
			<table>
				<thead>
				</thead>
				<tbody>
					<tr>
						<td>#ID</td>
						<td><input type="number" min="0" step="1" placeholder="#ID" id="id" name="id">
					</tr>
					<tr>
						<td>Nome</td>
						<td><input type="text" placeholder="Nome" id="nome" name="nome">
					</tr>
					<tr>
						<td>Preço</td>
						<td><input type="number" min="0" step="0.01" placeholder="Preço" 
								id="preco" name="preco">
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit" 
							id="enviar" name="enviar" value="Inserir">
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit" 
							id="enviar" name="enviar" value="Buscar">
					</tr>
					<tr>
						<td colspan="2" align="center"><input type="submit" 
							id="enviar" name="enviar" value="Listar">
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<br />
	<br />
	<div align="center">
		<c:if test="${not empty saida }">
			<H1><c:out value="${saida }"></c:out></H1>
		</c:if>
	</div>
	<div align="center">
		<c:if test="${not empty erro }">
			<H2><c:out value="${erro }"></c:out></H2>
		</c:if>
	</div>
	<div align="center">
		<c:if test="${not empty produto }">
			<p><c:out value="${produto }"></c:out></p>
		</c:if>
	</div>
	<div align="center">
		<c:if test="${not empty produtos }">
			<table border="1">
				<thead>
					<tr>
						<td>#ID</td>
						<td>Nome</td>
						<td>Preço</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${produtos }" var="produto">
						<tr>
							<td><c:out value="${produto.id }"></c:out></td>
							<td><c:out value="${produto.nome }"></c:out></td>
							<td><c:out value="${produto.preco }"></c:out></td>
						</tr>									
					</c:forEach>
				</tbody>
			</table>
		</c:if>
	</div>
</body>
</html>







