package board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;
import board.model.BoardEntity;

@WebServlet("/write")
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		String title = request.getParameter("title");
		String jsp = "/WEB-INF/jsp/write.jsp";
		request.getRequestDispatcher(jsp).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String ctnt = request.getParameter("ctnt");
		
		System.out.println("title : "+title);
		System.out.println("title : "+ctnt);
		
		BoardEntity vo = new BoardEntity();
		vo.setTitle(title);
		vo.setCtnt(ctnt);
		BoardDAO.insBoard(vo);
		
		response.sendRedirect("/list");
	}

}