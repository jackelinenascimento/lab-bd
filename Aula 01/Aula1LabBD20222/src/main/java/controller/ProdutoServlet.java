package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Produto;
import persistence.ProdutoDao;

@WebServlet("/produto")
public class ProdutoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProdutoServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("Encontrou o servlet");
		Produto produto = new Produto();
		String botao = request.getParameter("enviar");
		String saida = "";
		String erro = "";
		List<Produto> produtos = new ArrayList<Produto>();
		
		try {
			if (botao.equalsIgnoreCase("inserir")) {
				produto.setId(Integer.parseInt(request.getParameter("id")));
				produto.setNome(request.getParameter("nome"));
				produto.setPreco(Float.parseFloat(request.getParameter("preco")));
				
				ProdutoDao pDao = new ProdutoDao();
				saida = pDao.insert(produto);
				produto = null;
			}
			if (botao.equalsIgnoreCase("buscar")) {
				produto.setId(Integer.parseInt(request.getParameter("id")));
				
				ProdutoDao pDao = new ProdutoDao();
				produto = pDao.findOne(produto);
			}
			if (botao.equalsIgnoreCase("listar")) {
				ProdutoDao pDao = new ProdutoDao();
				produtos = pDao.findAll();
				produto = null;
			}
		} catch (ClassNotFoundException | SQLException e) {
			produto = null;
			erro = e.getMessage();
		} finally {
			request.setAttribute("saida", saida);
			request.setAttribute("erro", erro);
			request.setAttribute("produto", produto);
			request.setAttribute("produtos", produtos);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
		}
		
	}

}








