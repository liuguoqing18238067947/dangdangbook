<%
	if (session.getAttribute("hasLogined")==null||!(Boolean) session.getAttribute("hasLogined")){//没有登陆
		response.sendRedirect("login.jsp");
		return;
	}
%>
<%@page import="com.oraclewdp.ddbookmarket.model.Book"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
	<meta charset="utf-8">
	<title>书籍列表</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" type="text/css" href="bower_components/fontawesome/web-fonts-with-css/css/fontawesome-all.css">
	<link rel="stylesheet" type="text/css" id="themeLink" />
	<script type="text/javascript" src="bower_components/jquery/dist/jquery.js"></script>
	<script type="text/javascript" src="bower_components/jquery.cookie/jquery.cookie.js"></script>
	<script type="text/javascript">
        if ($.cookie("bootstrapTheme")) {
            $("#themeLink").attr("href","bower_components/bootswatch/dist/"+ $.cookie("bootstrapTheme") + "/bootstrap.css");
            $("#themeSel").val($.cookie("bootstrapTheme"));
        } else {
            $("#themeLink").attr("href","bower_components/bootswatch/dist/cerulean/bootstrap.css");
        }
	</script>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">

				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="navbar-toggler-icon"></span>
				</button>
				<a class="navbar-brand" href="#"> <img src="img/0.jpg" style="height: 40px" />
				</a>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="navbar-nav">
						<li class="nav-item active"><a class="nav-link" href="#">链接 <span class="sr-only">(current)</span></a></li>
						<li class="nav-item"><a class="nav-link" href="#">链接</a></li>
						<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown">下拉菜单</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
								<a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a> <a class="dropdown-item" href="#">Something else
								here</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="#">Separated link</a>
							</div></li>
					</ul>
					<form class="form-inline">
						<input class="form-control mr-sm-2" type="text" />
						<button class="btn btn-primary my-2 my-sm-0" type="submit">搜索</button>
					</form>
					<ul class="navbar-nav ml-md-auto">
						<li class="nav-item active"><a class="nav-link" href="#"> <select id="themeSel">
							<option>cerulean</option>
							<option>darkly</option>
							<option>lumen</option>
							<option>simplex</option>
						</select>
						</a></li>
						<li class="nav-item dropdown "><a class="nav-link fa fa-power-off fa-2x"  href="exit.jsp" id="navbarDropdownMenuLink">

						</a>

							</div></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<div class="card border-success">
				<div class="card-header">
					<form class="form-inline"action="bookList" method="post"id="frm">

						<input type="text" class="form-control mb-2 mr-sm-2" id="inputName" placeholder="书名" name="name" value="<%=request.getParameter("name")==null?"":request.getParameter("name")==null?"":request.getParameter("name")%>">
						<div class="input-group mb-2 mr-sm-2">
							<div class="col-sm-10">
								<select class="form-control" id="inputBid"  name="bid">
									<option value="-1">--选择--</option>
								</select>
							</div>
						</div>
						<div class="input-group mb-2 mr-sm-2">
							<div class="col-sm-10">
								<select class="form-control" id="inputSid" placeholder="小类名" name="sid">

								</select>
							</div>
						</div>
						<button type="submit" class="btn btn-primary mb-2">查询</button>
					</form>
				</div>
				<div class="card-body">
					<table class="table table-bordered table-sm table-hover">
						<thead>
						<tr>
							<th>#</th>
							<th>书名</th>
							<th>价格</th>
							<th>作者</th>
							<th>出版社</th>
							<th>出版日期</th>
							<th style="max-width: 200px;">简介</th>
							<th>小类</th>
							<th>图片</th>
							<th>操作</th>
						</tr>
						</thead>
						<tbody>
						<%
							List<Book> ls = (List<Book>) request.getAttribute("ls");
							if(ls!=null){
								for (Book book : ls) {
						%>
						<tr>
							<td><%=book.getId()%></td>
							<td><%=book.getName()%></td>
							<td><%=book.getPrice()%></td>
							<td><%=book.getAuthor()%></td>
							<td><%=book.getCbs()%></td>
							<td><%=book.getCbDate()%></td>
							<td style="max-width: 200px"><%=book.getDescri()%></td>
							<td><%=book.getSid()%></td>
							<td><img style="size: 50%" src="upload/<%=book.getPhoto()%>" /></td>
							<td>
								<a href="#modal-container-737579" data-toggle="modal" onclick="window.delId='<%=book.getId()%>'" class="fa fa-trash fa-2x" title="删除"></a>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a class="fa fa-edit fa-2x" title="修改" href="toBookEdit?id=<%=book.getId()%>"></a>
							</td>

						</tr>
						<%
							}
						}else{
						%>
						<tr><td colspan="10">无数据</td></tr>
						<%
							}
						%>
						</tbody>
					</table>
				</div>
				<div class="card-footer">
					<nav>
						<ul class="pagination" style="matgin-bootom: 0px;">
							<%
								int totalPage = (Integer) request.getAttribute("totalPage");
								int currentPage = (Integer) request.getAttribute("currentPage");
								if (currentPage == 1) {
							%>
							<li class="page-item disabled"><a class="page-link" href="#">上一页</a></li>
							<%
							} else {
							%>
							<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=currentPage - 1%>">上一页</a></li>
							<%
								}
							%>

							<%
								if (totalPage <= 5) {
									for (int i = 1; i <= totalPage; i++) {
							%>
							<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=i%>"><%=i%></a></li>
							<%
								}
							} else if (currentPage <= 3) {
							%>
							<li class="page-item"><a class="page-link" href="bookList?currentPage=1">1</a></li>
							<li class="page-item"><a class="page-link" href="bookList?currentPage=2">2</a></li>
							<li class="page-item"><a class="page-link" href="bookList?currentPage=3">3</a></li>
							<li class="page-item"><a class="page-link" href="bookList?currentPage=4">4</a></li>
							<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage%>">...<%=totalPage%></a></li>
							<%
							} else if (currentPage <= totalPage - 3) {
							%>
							<li class="page-item"><a class="page-link" href="bookList?currentPage=1">1...</a></li>
							<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=currentPage - 1%>"><%=currentPage - 1%></a></li>
							<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=currentPage%>"><%=currentPage%></a></li>
							<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=currentPage + 1%>"><%=currentPage + 1%></a></li>
							<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage%>">...<%=totalPage%></a></li>
							<%
							} else {
							%>
							<li class="page-item"><a class="page-link" href="bookList?currentPage=1">1...</a></li>
							<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage - 3%>"><%=totalPage - 3%></a></li>
							<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage - 2%>"><%=totalPage - 2%></a></li>
							<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage - 1%>"><%=totalPage - 1%></a></li>
							<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=totalPage%>"><%=totalPage%></a></li>
							<%
								}
							%>
							<%
								if (currentPage == totalPage) {
							%>
							<li class="page-item disabled"><a class="page-link" href="#">下一页</a></li>
							<%
							} else {
							%>
							<li class="page-item"><a class="page-link" href="bookList?currentPage=<%=currentPage + 1%>">下一页</a></li>
							<%
								}
							%>
						</ul>
					</nav>
				</div>
			</div>
			<p class="text-center">
				先人版权所有 仿冒必究@<a class="btn" href="mailto:222222222@qqwwww">22222222222222222 »</a>
			</p>
		</div>
	</div>
</div>
<div class="modal fade " id="modal-container-737579" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="myModalLabel">
					删除确认
				</h5>
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				你真的要删除该条记录？
			</div>
			<div class="modal-footer">

				<button type="button" class="btn btn-primary" onclick="exeDel(event)">
					确认
				</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">
					取消
				</button>
			</div>
		</div>

	</div>

</div>
<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
<script type="text/javascript">
    $(function() {
        $("#themeSel").change(
            function(evt) {
                //console.dir(evt.target);
                /*var op evt.target.options[evt.target.selectedTndex];
                console.dir(op.value);
                $("#themeLink").attr("href","bower_components/bootswatch/dist/"+op.value+"/bootstrap.css")*/
                $("#themeLink").attr("href","bower_components/bootswatch/dist/"+ $(evt.target).val()+ "/bootstrap.css");
                $.cookie("bootstrapTheme", $(evt.target).val(), {
                    expires : 30
                });
            });
        $('a[href="bookList?currentPage=<%=currentPage%>"]').parent("li").addClass("active");

    });
    function fillSel(types){
        for (var i = 0; i < types.length; i++) {
            var op=new Option(types[i].name,types[i].id);
            document.getElementById("inputBid").appendChild(op);
        }
        $("#inputBid").val('<%=request.getAttribute("bid")%>');
        $("#inputBid").trigger("change");
    }
    function fillSmallSel(types){
        document.getElementById("inputSid").innerHTML='<option value="-1">--请选择--</option>';
        for (var i = 0; i < types.length; i++) {
            var op=new Option(types[i].name,types[i].id);
            document.getElementById("inputSid").appendChild(op);
        }
        $("#inputSid").val('<%=request.getAttribute("sid")%>');
    }
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
    $('a[class="page-link"][href^="bookList?currentPage="]').click(function(){
        $(this).attr("href",$(this).attr("href")+"&"+$("#searchFrm").serialize());
    });
    function exeDel(event){
        window.location.href="bookDel?id="+window.delId;
    }
</script>
</body>
</html>