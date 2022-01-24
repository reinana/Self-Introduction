package com.sample;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ReplyServlet
 */
@WebServlet("/reply")
public class ReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		/* main.jspからformで送られてきたidを受け取る */		
		int id = Integer.parseInt(request.getParameter("id"));	
		
		
		HttpSession session = request.getSession();	
		
		List<Message> list = (List<Message>)session.getAttribute("list");
		if(list == null) {
			list = new ArrayList<>();
		}
		
		Message replyMessage = null;
		
		for(Message m: list) {
			if (m.getId() == id) replyMessage = m;
		}
		
		session.setAttribute("replyMessage", replyMessage);
		request.setAttribute("id", id);
		
		RequestDispatcher rd = request.getRequestDispatcher("/reply.jsp");
		rd.forward(request, response);
		
		return;
	
	
	
	}

}
