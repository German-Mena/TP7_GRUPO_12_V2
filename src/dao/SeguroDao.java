package dao;

import java.util.ArrayList;

import entidad.Seguro;

public interface SeguroDao {
	public boolean insertar(Seguro seg);
	public ArrayList<Seguro> filtrar(int id);
	public ArrayList<Seguro> listar();
}
