<%@ page import="com.oraclewdp.ddbookmarket.model.Admin" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Set" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
<style type="text/css">
</style>
</head>
<body>
	<!-- 响应式设计  -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
							<%--
								Map<String,String> errors= (Map<String, String>) request.getAttribute("errors");
								if(errors!=null){
									Set<String> keySet=errors.keySet();
									for(String key : keySet){
									    out.print(key+"---->"+errors.get(key));
									}
								}
							--%>
						<form method="post" autocomplete="off" action="login" id="loginForm">
							<%
								Map<String,String> errors= (Map<String, String>) request.getAttribute("errors");
								Admin admin =(Admin) request.getAttribute("admin");
								if(admin !=null){
									%>
							<div class="form-group row">
								<label for="inputName" class="col-sm-2 col-form-label text-right">用户名</label>
								<div class="col-sm-10">
									<%
										if(errors!=null&&errors.get("name")!=null){
									%>
									<input type="text" class="form-control is-invalid" id="inputName" placeholder="用户名" name="name" value="<%=admin.getName()==null?"":admin.getName()%>">
									<div class="invalid-feedback">
										<%=errors.get("name")%>
									</div>
									<%
										}else{
										%>
									<input type="text" class="form-control" id="inputName" placeholder="用户名" name="name" value="<%=admin.getName()%>">
									<%
										}
									%>
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPwd" class="col-sm-2 col-form-label text-right">密码</label>
								<div class="col-sm-10">
									<%
									if (errors!=null&&errors.get("pwd")!=null){
									    %>
									<input type="password" class="form-control is-invalid" id="inputPwd" placeholder="密码" name="pwd">
									<div class="invalid-feedback">
										<%=errors.get("pwd")%>
									</div>
									<%
									}else{
									%>
									<input type="password" class="form-control" id="inputPwd" placeholder="密码" name="pwd">
									<%
									}
									%>
								</div>
							</div>
							<div class="form-group row">
								<label for="inputVcode" class="col-sm-2 col-form-label text-right">验证码</label>
								<div class="col-sm-5">
									<%
										if(errors!=null&&errors.get("vcode")!=null){
										    %>
									<input class="form-control is-invalid" id="inputVcode" placeholder="验证码" name="vcode">
									<div class="invalid-feedback">
										<%=errors.get("vcode")%>
									</div>
									<%
									}else{
									%>
									<input class="form-control " id="inputVcode" placeholder="验证码" name="vcode">
									<%
									}
									%>

								</div>
								<div class="col-5">
									<img src="vcode.png" id="vcodeImg" title="看不清点击换一张">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">登录</button>
								</div>
							</div>

							<%
								}else{


									 %>
							<div class="form-group row">
								<label for="inputName" class="col-sm-2 col-form-label text-right">用户名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputName" placeholder="用户名" name="name">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPwd" class="col-sm-2 col-form-label text-right">密码</label>
								<div class="col-sm-10">
									<input type="password" class="form-control" id="inputPwd" placeholder="密码" name="pwd">
								</div>
							</div>

							<div class="form-group row">
								<label for="inputVcode" class="col-sm-2 col-form-label text-right">验证码</label>
								<div class="col-sm-5">
									<input class="form-control" id="inputVcode" placeholder="验证码" name="vcode">

								</div>
								<div class="col-5">
									<img src="vcode.png" id="vcodeImg" title="看不清点击换一张">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">登录</button>
								</div>
							</div>
							<%} %>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript" src="bower_components/jquery/dist/jquery.slim.js"></script>
	<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript">
		$(function () {
			$("#vcodeImg").click(function () {
				$(this).attr("src","vcode.png?t="+Math.random());
            });
        });
	</script>
	<script type="text/javascript" src="bower_components/jquery-validation/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="bower_components/jquery-validation/src/localization/messages_zh.js"></script>
	<script type="text/javascript">
    $(function () {
        $("#loginForm").validate({
				rules:{
                	name: {
                    required: true,
                    maxlength: 45,
					minlength:3
                },
                pwd: {
                    required: true,
                    maxlength: 45,
                    minlength:3
                },
					vcode:{
                	    required:true
					}
            },
            messages:{

            },


            errorElement: "div",
            errorClass: "invalid-feedback",
            highlight: function(element, errorClass, validClass) {
                $(element).addClass("is-invalid").removeClass(validClass);
                // $(element.form).find("label[for=" + element.id + "]")
                //     .addClass(errorClass);
            },
            unhighlight: function(element, errorClass, validClass) {
                $(element).removeClass("is-invalid").addClass(validClass);
                // $(element.form).find("label[for=" + element.id + "]")
                //     .removeClass(errorClass);
            },
            validClass:"is-valid"
        });
    });
</script>
</body>
</html>