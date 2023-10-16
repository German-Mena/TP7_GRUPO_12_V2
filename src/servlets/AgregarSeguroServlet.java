package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.SeguroDao;
import daoImpl.SeguroDaoImpl;
import entidad.Seguro;
import entidad.TipoSeguro;

/**
 * Servlet implementation class AgregarSeguroServlet
 */
@WebServlet("/AgregarSeguroServlet")
public class AgregarSeguroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AgregarSeguroServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("opt")!=null) {
			SeguroDao segDao = new SeguroDaoImpl();
			ArrayList<Seguro> sgList = segDao.listar();
			
			int max=0;
			for(Seguro s: sgList) {
				if (max<s.getIdSeguro()) {
					max=s.getIdSeguro();
				}
			}
			max=max+1;
			
			request.setAttribute("id", max);
			
			RequestDispatcher rd = request.getRequestDispatcher("/AgregarSeguro.jsp");
			rd.forward(request, response);			
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(request.getParameter("btnaceptar")!=null)
		{
			Seguro s= new Seguro();
			TipoSeguro ts=new TipoSeguro();
			s.setCostoAsegurado(Double.parseDouble(request.getParameter("txtcostomaximo").toString()));
			s.setCostoContratacion(Integer.parseInt(request.getParameter("txtcostocontratacion").toString()));
			s.setDescripcion(request.getParameter("txtdescripcion").toString());
			s.setIdSeguro(Integer.parseInt(request.getParameter("idUsuario").toString()));
			//ts.setIdTipoSeguro(Integer.parseInt(request.getParameter("idSeguro").toString()));
			ts.setIdTipoSeguro(1);
			s.setTipoSeguro(ts);
			
			SeguroDao segDao = new SeguroDaoImpl();
			boolean a=segDao.insertar(s);
			
			request.setAttribute("Agregado", a);
			
			RequestDispatcher rd = request.getRequestDispatcher("/AgregarSeguro.jsp");
			rd.forward(request, response);

		}
		
	}

}
