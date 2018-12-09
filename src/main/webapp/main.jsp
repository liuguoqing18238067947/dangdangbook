
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC>
<html>
<head>
<meta charset="utf-8">
<title>主页</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" id="themeLink"/>
<script type="text/javascript" src="bower_components/jquery/dist/jquery.slim.js"></script>
<script type="text/javascript" src="bower_components/jquery.cookie/jquery.cookie.js"></script>
<script type="text/javascript">

if ($.cookie("bootstrapTheme")) {
	$("#themeLink").attr("href","bower_components/bootswatch/dist/"+$.cookie("bootstrapTheme")+"/bootstrap.css");

}else{
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
				</button> <a class="navbar-brand" href="#">
				 <img src="img/0.jpg" style="height: 40px"/> 
				</a>
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="navbar-nav">
						<li class="nav-item active">
							 <a class="nav-link" href="#">链接 <span class="sr-only">(current)</span></a>
						</li>
						<li class="nav-item">
							 <a class="nav-link" href="#">链接</a>
						</li>
						<li class="nav-item dropdown">
							 <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown">下拉菜单</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
								 <a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a> <a class="dropdown-item" href="#">Something else here</a>
								<div class="dropdown-divider">
								</div> <a class="dropdown-item" href="#">Separated link</a>
							</div>
						</li>
					</ul>
					<form class="form-inline">
						<input class="form-control mr-sm-2" type="text" /> 
						<button class="btn btn-primary my-2 my-sm-0" type="submit">
							搜索
						</button>
					</form>
					<ul class="navbar-nav ml-md-auto">
						<li class="nav-item active">
							 <a class="nav-link" href="#">
							 <select id="themeSel">
                             <option>cerulean</option>
                              <option>darkly</option>
                               <option>lumen</option>
                                <option>simplex</option>
							 </select>
							 </a>
						</li>
						<li class="nav-item dropdown">
							 <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown">下拉菜单</a>
							<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
								 <a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a> <a class="dropdown-item" href="#">Something else here</a>
								<div class="dropdown-divider">
								</div> <a class="dropdown-item" href="#">Separated link</a>
							</div>
						</li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<div class="carousel slide" id="carousel-14940">
				<ol class="carousel-indicators">
					<li data-slide-to="0" data-target="#carousel-14940" class="active">
					</li>
					<li data-slide-to="1" data-target="#carousel-14940">
					</li>
					<li data-slide-to="2" data-target="#carousel-14940">
					</li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img class="d-block w-100" alt="Carousel Bootstrap First" src="img/12659935.jpg" style="height: 1200px"/>
						<div class="carousel-caption">
							<h4>
								第一个h
							</h4>
							<p>
								小小姐姐
							</p>
						</div>
					</div>
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Second" src= "img/12952576.jpg"style="height: 1200px"/>
						<div class="carousel-caption">
							<h4>
								第二个
							</h4>
							<p>
							大大姐姐
							</p>
						</div>
					</div>
					
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Second" src="img/16874178.jpg" style="height: 1500px"/>
						<div class="carousel-caption">
							<h4>
								第三个
							</h4>
							<p>
							小姐姐
							</p>
						</div>
					</div>
					
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Second" src="img/1caca56177645201-896ed5b4de20a04d-58bcd7f5489a92d2bd58f715962ec2cd.jpg"  style="height: 1200px"/>
						<div class="carousel-caption">
							<h4>
								第四个
							</h4>
							<p>
							八卦
							</p>
						</div>
					</div>
					
				</div> <a class="carousel-control-prev" href="#carousel-14940" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carousel-14940" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
			</div>
			
			<p class="text-center">
			先人版权所有 仿冒必究@<a class="btn" href="mailto:222222222@qqwwww">22222222222222222 »</a>
			</p>
			
		</div>
	</div>
</div>
	<script type="text/javascript" src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
	<script type="text/javascript">
     $(function () {
         $("#themeSel").val($.cookie("bootstrapTheme"));
		$("#themeSel").change(function(evt) {
			//console.dir(evt.target);
			/*var op evt.target.options[evt.target.selectedTndex];
			console.dir(op.value);
			$("#themeLink").attr("href","bower_components/bootswatch/dist/"+op.value+"/bootstrap.css")*/
			$("#themeLink").attr("href","bower_components/bootswatch/dist/"+$(evt.target).val()+"/bootstrap.css");
             $.cookie("bootstrapTheme",$(evt.target).val(),{ expires: 30});
			});
 
	});
</script>
</body>
</html>