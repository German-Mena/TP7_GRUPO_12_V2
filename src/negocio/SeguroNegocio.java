package negocio;

import java.util.ArrayList;

import entidad.Seguro;

public interface SeguroNegocio {
	public boolean insertar(Seguro seguro);
	public ArrayList<Seguro> listar();
}