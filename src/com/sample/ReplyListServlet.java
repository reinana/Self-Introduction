package com.sample;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ReplyListServlet
 */
@WebServlet("/replylist")
public class ReplyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyListServlet() {
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
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();	
		
		List<Message> list = (List<Message>)session.getAttribute("list");
		
		List<Message> replyList = (List<Message>)session.getAttribute("replyList");
		if(replyList == null) {
			replyList = new ArrayList<>();
		}
		
		Integer replyid = (Integer)session.getAttribute("id");	
		if(replyid == null) {
			replyid = 0;
		}
				
		
		String message = request.getParameter("message");
		String name = request.getParameter("name");
		
		Message msg = new Message(replyid + 1, new Date(), name, message);
	
		replyList.add(msg);
		list.add(msg);		
		
		request.setAttribute("replyList", replyList);
		session.setAttribute("id", replyid + 1);
		session.setAttribute("list", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("/reply.jsp");
		rd.forward(request, response);
		
		return;
	}

}
