<%@page import="entidad.TipoSeguro"%>
<%@page import="java.util.ArrayList"%>
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
	<a href="servlet?parametro=1">Agregar seguro</a>
	<a href="ListarSeguro.jsp">Listar seguros</a>
	
	<form action="get" action="servlet">
	
		<h2>Agregar Seguros</h2>
		<table>
		<tr><th>Id seguro </th>
		<th><%int nuevoid=0;
				if(request.getAttribute("valorid")!=null){
					nuevoid=(int)request.getAttribute("valorid");%>
					<%= nuevoid %>
				<%}%>
		</th></tr>
		
		<tr> <th>Descripcion</th> <th><input type="text" name="txtdescripcion"></th></tr>
		
		<tr> <th>Tipo de seguro</th>
		<th><select name="Seguro de casas">
			<%if(request.getAttribute("valorTipo")!=null){
					ArrayList<TipoSeguro> lista= new ArrayList<TipoSeguro>();
					lista=(ArrayList<TipoSeguro>) request.getAttribute("valorTipo");
					for(TipoSeguro tpseguro: lista){%>
						<br><option value="<%tpseguro.getIdTipoSeguro();%>"><%=tpseguro.getDescripcion()%></option> </br>
					<%}
				}%>
		</th></tr>
		<tr> <th>Costo de contratacion</th> <th><input type="text" name="txtcostocontratacion"></th></tr>
		<tr> <th>Costo maximo asegurado</th> <th><input type="text" name="txtcostomaximo"></th></tr>
		<tr> <th></th> <th><input type="submit" name="btnaceptar" value="Aceptar"></th></tr>
		</table> 
	</form>
</body>
</html>