package persistence;

import java.sql.SQLException;
import java.util.List;

public interface Dao<T> {

	public String insert(T t) throws SQLException;
	public String update(T t) throws SQLException;
	public String delete(T t) throws SQLException;
	public T findOne(T t) throws SQLException;
	public List<T> findAll() throws SQLException;
	
}
