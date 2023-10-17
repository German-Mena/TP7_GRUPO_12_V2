<%@page import="entidad.TipoSeguro"%>
<%@page import="java.util.ArrayList"%>
<%@page import="negocio.TipoSeguroNegocio"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="negocioImpl.TipoSeguroNegocioImpl"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<a href="Inicio.jsp">Inicio</a>
	<a href="AgregarSeguroServlet?opt=1">Agregar seguro</a>
	<a href="ListarSeguroServlet?list=1">Listar seguros</a>
	
	<%if(request.getAttribute("Agregado")!=null){%>
		<h2>Agregado con éxito</h2>
	<%}%>
	
	<%if(request.getAttribute("id")!=null){%>
		<form action="AgregarSeguroServlet" method="post">
		
			<h2>Agregar Seguros</h2>
			<table>
			<tr><th>Id seguro </th>
			<%int nuevoid=(int)request.getAttribute("id");%>
				<th><%= nuevoid %></th>
			<input type="hidden" name="idUsuario" value="<%=nuevoid%>">
			</th></tr>
			<tr> <th>Descripcion</th> <th><input type="text" name="txtdescripcion" required></th></tr>
			
			<tr> <th>Tipo de seguro</th>
			<th><select name="Seguro" id="Seguro">
				<%TipoSeguroNegocio tsNegocio=new TipoSeguroNegocioImpl();
						for(TipoSeguro tipo: tsNegocio.listar()){%>
						<option value="<%=tipo.getIdTipoSeguro()%>" ><%=tipo.getDescripcion()%></option>
						<%}%>
			</th></tr>
			<tr> <th>Costo de contratacion</th> <th><input type="number" name="txtcostocontratacion" min="1" required></th></tr>
			<tr> <th>Costo maximo asegurado</th> <th><input type="number" name="txtcostomaximo" min="1" required></th></tr>
			<tr> <th></th> <th><input type="submit" name="btnaceptar" value="Aceptar"></th></tr>
			</table> 
		</form>
	<%}%>
</body>
</html>