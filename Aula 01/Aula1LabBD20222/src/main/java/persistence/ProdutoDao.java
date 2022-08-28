package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Produto;

public class ProdutoDao implements Dao<Produto>{
	
	Connection c;
	
	public ProdutoDao() throws ClassNotFoundException, SQLException {
		GenericDao gDao = new GenericDao();
		c = gDao.getConnection();
	}

	@Override
	public String insert(Produto produto) throws SQLException {
		String sql = "INSERT INTO produto VALUES (?,?,?)";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setInt(1, produto.getId());
		ps.setString(2, produto.getNome());
		ps.setFloat(3, produto.getPreco());
		ps.execute();
		ps.close();
		
		return "Produto inserido com sucesso";
	}

	@Override
	public String update(Produto produto) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String delete(Produto produto) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Produto findOne(Produto produto) throws SQLException {
		String sql = "SELECT id, nome, preco FROM produto WHERE id = ?";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setInt(1, produto.getId());
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			produto.setId(rs.getInt("id"));
			produto.setNome(rs.getString("nome"));
			produto.setPreco(rs.getFloat("preco"));
		}
		rs.close();
		ps.close();
		return produto;
	}

	@Override
	public List<Produto> findAll() throws SQLException {
		List<Produto> produtos = new ArrayList<Produto>();
		String sql = "SELECT id, nome, preco FROM produto";
		PreparedStatement ps = c.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			Produto produto = new Produto();
			produto.setId(rs.getInt("id"));
			produto.setNome(rs.getString("nome"));
			produto.setPreco(rs.getFloat("preco"));
			
			produtos.add(produto);
		}
		rs.close();
		ps.close();
		return produtos;
	}

}
