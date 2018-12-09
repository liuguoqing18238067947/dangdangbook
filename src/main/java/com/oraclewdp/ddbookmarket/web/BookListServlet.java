package com.oraclewdp.ddbookmarket.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oraclewdp.ddbookmarket.biz.BookBiz;
import com.oraclewdp.ddbookmarket.biz.impl.BookBizImpl;
import com.oraclewdp.ddbookmarket.model.Book;
import com.oraclewdp.ddbookmarket.util.PageConstant;

@WebServlet("/bookList")
public class BookListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public BookListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//1
		String strCurrentPage=request.getParameter("currentPage");
		if (strCurrentPage==null) {
			strCurrentPage="1";
		}
		int currentPage=Integer.parseInt(strCurrentPage);
		String name=request.getParameter("name");
		String strsid=request.getParameter("sid")==null?"-1":request.getParameter("sid");
		int sid=Integer.parseInt(strsid);
		String strBid=request.getParameter("bid")==null?"-1":request.getParameter("bid");
		int bid=Integer.parseInt(strBid);
		//2
		BookBiz bookBiz=new BookBizImpl();
		List<Book> ls=bookBiz.findAll(currentPage,name,sid);
		int totalRow=bookBiz.totalRow( name,sid);
		int totalPage=totalRow%PageConstant.PAGE_SIZE==0?totalRow/PageConstant.PAGE_SIZE:totalRow/PageConstant.PAGE_SIZE+1;
		//3
		request.setAttribute("currentPage",currentPage );
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("ls", ls);
		request.setAttribute("bid", bid);
		request.setAttribute("sid", sid);
		request.setAttribute("name", name);
		request.getRequestDispatcher("bookList.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
