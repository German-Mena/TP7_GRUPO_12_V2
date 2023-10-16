package dao;

import java.util.ArrayList;

import entidad.TipoSeguro;

public interface TipoSeguroDao {
	public int buscarID(String parametro);
	public ArrayList<TipoSeguro> listar();
}
