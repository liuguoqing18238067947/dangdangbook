package com.oraclewdp.ddbookmarket.web;

import com.oraclewdp.ddbookmarket.biz.AdminBiz;
import com.oraclewdp.ddbookmarket.biz.impl.AdminBizImpl;
import com.oraclewdp.ddbookmarket.model.Admin;
import com.oraclewdp.ddbookmarket.util.MyBeanUtils;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.*;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
    public LoginServlet() {
        super();
      
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Admin admin=new Admin();
		MyBeanUtils.populate(admin, request.getParameterMap());
		String vcode=request.getParameter("vcode");
		String serverVcode= (String) request.getSession().getAttribute("validateCode");
		/*if (!serverVcode.equalsIgnoreCase(vcode)){
			request.setAttribute("msg","验证码错误");
			request.setAttribute("admin", admin);
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		ValidatorFactory validatorFactory= Validation.buildDefaultValidatorFactory();
		Validator validator=validatorFactory.getValidator();
		Set<ConstraintViolation<Admin>> validatResult=validator.validate(admin);
		Map<String,String> errors=new HashMap<>();
		if(validatResult.size()>0){
			for (ConstraintViolation<Admin> cv :validatResult){
				errors.put(cv.getPropertyPath().toString(),cv.getMessage());
			}
			request.setAttribute("errors",errors);
			request.setAttribute("admin", admin);
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}*/
		Map<String,String> errors=new HashMap<>();
		if (!serverVcode.equalsIgnoreCase(vcode)){
			errors.put("vcode","验证码错误");

		}
		ValidatorFactory validatorFactory= Validation.buildDefaultValidatorFactory();
		Validator validator=validatorFactory.getValidator();
		Set<ConstraintViolation<Admin>> validatResult=validator.validate(admin);

		if(validatResult.size()>0){
			for (ConstraintViolation<Admin> cv :validatResult){
				errors.put(cv.getPropertyPath().toString(),cv.getMessage());
			}
		}
		if(errors.size()>0){
			request.setAttribute("errors",errors);
			request.setAttribute("admin", admin);
			request.getRequestDispatcher("login.jsp").forward(request, response);
			return;
		}
		//到数据库对比
	AdminBiz adminBiz=new AdminBizImpl();
	boolean ret=adminBiz.findByNameAndPwd(admin);
	if (ret) {
		//再session范围记录下已经登陆成功
		request.getSession().setAttribute("hasLogined",true);
		request.getRequestDispatcher("main.jsp").forward(request, response);
		
	} else {
       request.setAttribute("admin", admin);
	   request.getRequestDispatcher("login.jsp").forward(request, response);
	}
	}

}
