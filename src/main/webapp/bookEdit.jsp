<%--
	if (session.getAttribute("hasLogined")==null||!(Boolean) session.getAttribute("hasLogined")){//没有登陆
		response.sendRedirect("login.jsp");
		return;
	}
--%>
<%@ page import="com.oraclewdp.ddbookmarket.model.Book" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>书籍编辑</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="bower_components/bootstrap/dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.custom-file-label::after {
	content: "浏览"
}
</style>
</head>
<body>
<!-- 响应式设计  -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-body">
						<form method="post" autocomplete="off" action="doBookEdit" enctype="multipart/form-data">
							<%
								Book book= (Book) request.getAttribute("book");
							%>
							<input type="hidden" name="id" value="<%=book.getId()%>">
							<div class="form-group row">
								<label for="inputBid" class="col-sm-2 col-form-label text-right">大类</label>
								<div class="col-sm-10">
								<select name="bid" class="form-control" id="inputBid">
								<option value="-1">---请选择大类---</option>
								</select>
								</div>
							</div>
							<div class="form-group row">
								<label for="inputSid" class="col-sm-2 col-form-label text-right">小类</label>
								<div class="col-sm-10">
								<select name="sid" class="form-control" id="inputSid">
								</select>
								</div>
							</div>
							<div class="form-group row">
								<label for="inputName" class="col-sm-2 col-form-label text-right">书名</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputName" placeholder="书名" name="name"  value="<%=book.getName()%>"/>
								</div>
							</div>
							<div class="form-group row">
								<label for="inputPrice" class="col-sm-2 col-form-label text-right">价格</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputPrice" placeholder="价格" name="price" value="<%=book.getPrice()%>">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputAuthor" class="col-sm-2 col-form-label text-right">作者</label>
								<div class="col-sm-10">
									<input type="passAuthor" class="form-control" id="inputAuthor" placeholder="作者" name="author"value="<%=book.getAuthor()%>">
								</div>
							</div>

							<div class="form-group row">
								<label for="inputCbs" class="col-sm-2 col-form-label text-right">出版社</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputCbs" placeholder="出版社" name="cbs" value="<%=book.getCbs()%>">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputCbDate" class="col-sm-2 col-form-label text-right">出版日期</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="inputCbDate" placeholder="出版日期" name="cbDate" readonly="readonly" value="<%=book.getCbDate()%>">
								</div>
							</div>
							<div class="form-group row">
								<label for="inputDescri" class="col-sm-2 col-form-label text-right">简介</label>
								<div class="col-sm-10">
									<textarea class="form-control" id="inputDescri" placeholder="出版社" name="descri" ><%=book.getDescri()%></textarea>
								</div>
							</div>
							<div class="form-group row">

								<label for="inputPhoto" class="col-sm-2 col-form-label text-right">图片</label>
								<div class="col-sm-10">
									<div class="custom-file">
										<input type="file" class="custom-file-input" id="inputPhoto" aria-describedby="inputGroupFileAddon04" name="photo">
										<label class="custom-file-label" for="inputPhoto">请选择文件</label>
									</div>
									<img src="upload/<%=book.getPhoto()%>">
								</div>
							</div>
							<div class="form-group row">
								<div class="col-sm-2"></div>
								<div class="col-sm-10">
									<button type="submit" class="btn btn-primary">修改</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="bower_components/jquery/dist/jquery.js"></script>
	<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript" src="bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript" src="bower_components/bootstrap-datepicker/dist/locales/bootstrap-datepicker.zh-CN.min.js"></script>
	<script type="text/javascript">
		/*var xhr=new XMLHttpRequest();
		xhr.open("GET","findAllBigType");
		xhr.send();
		xhr.onreadystatechange=function(){
			if (xhr.readyState==4) {
				if (xhr.status==200) {
					//console.dir(xhr.responseText);
				eval(xhr.responseText);
				}
			}
		}*/

		function fillSel(types){
			for (var i = 0; i < types.length; i++) {
				var op=new Option(types[i].name,types[i].id);
				document.getElementById("inputBid").appendChild(op);
			}
          $("#inputBid").val('<%=request.getAttribute("bid")%>');
            $("#inputBid").trigger("change");
		}
		function fillSmallSel(types){
			document.getElementById("inputSid").innerHTML="";
			for (var i = 0; i < types.length; i++) {
				var op=new Option(types[i].name,types[i].id);
				document.getElementById("inputSid").appendChild(op);
			}
            $("#inputSid").val('<%=book.getSid()%>');
		}
		/*var script=document.createElement("script");
		script.src="findAllBigType";
		document.body.appendChild(script);*/
		console.dir($);
		$.ajax({
			url:"findAllBigType",
			dataType:"jsonp",
			jsonpCallback:"fillSel"
		});
		$("#inputBid").change(function(){
			$.ajax({
				url:"findAllSmallType",
				dataType:"jsonp",
				data:"bid="+$(this).val(),
				jsonpCallback:"fillSmallSel"
			});
		});
		$('#inputCbDate').datepicker({
			language : 'zh-CN',
			format : 'yyyy-mm-dd',
			autoclose : true,
			defaultViewDate : {
				year : new Date().getFullYear() - 18
			}
		});
	</script>
	<!--  <script type="text/javascript" src="findAllBigType"></script>-->
</body>
</html>