package negocioImpl;

import java.util.ArrayList;

import dao.SeguroDao;
import daoImpl.SeguroDaoImpl;
import entidad.Seguro;
import negocio.SeguroNegocio;

public class SeguroNegocioImpl implements SeguroNegocio {

	private SeguroDao sDao = new SeguroDaoImpl();
	@Override
	public boolean insertar(Seguro seguro) {
		if(seguro.getDescripcion().trim().length()>0 && seguro.getTipoSeguro() != null && 
				seguro.getCostoContratacion() > 0 && seguro.getCostoAsegurado() > 0)
		{
			return sDao.insertar(seguro);
		}
		return false;
	}

	@Override
	public ArrayList<Seguro> listar() {
		return sDao.listar();
	}

}
