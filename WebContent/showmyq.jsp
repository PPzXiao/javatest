<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>    <title>所有问题页面</title>
<link rel="stylesheet" type="text/css" href="css/liebiao.css"> 
  </head>
    <body>
     <div id="particles-js">
    <div class=back>
  <div class="container">
 
	<div class="row clearfix">
		<div class="col-xs-12 column">
  <h1>${message}</h1>
  <table class="table" >
  	<thead>
  	  	<div class="alert alert-info" role="alert">	
  	<div class="page-header">
  	<h1>我的留言</h1>
  	</div>
  	</div>
  		<tr class="alert alert-info" role="alert">

  		    <th></th>
  		
	  		<th>问题</th>
	  		<th>问题内容</th>
	  		<th>留言时间</th>
	  	    <th>操作</th>
  		</tr>
  	</thead> 
     <c:forEach var="U" items="${myQuestion}" varStatus="userStatus"> 
        <form action="QuestionServlet" method="post"> 
      <tbody>
       <tr >
           <td><input type="hidden" style="border:0px" value="${U.getQID()}" name="QID"  ></td>
	
	       <td><input type="text" style="border:0px" value="${U.getQuestion()}" name="Question" readonly></td>
	       <td><input type="text" style="border:0px" value="${U.getText()}" name="Text" readonly></td>
	       <td><input type="text" style="border:0px" value="${U.getDate2()}" name="Date" readonly></td>
	       <td>
	       <div class="btn-group" role="group" aria-label="..." >
	        
	           
	         <a href="SearchallR?QID=${U.getQID()}" style="text-decoration:none" class="btn btn-info ">查看回复</a>
	       <a href="DeleteQServlet?QID=${U.getQID()}" style="text-decoration:none" class="btn btn-info" onclick="return fun2()">删除</a>
	       
	       </div>
	       </td>
	   </tr>
	   </tbody>
    </form>
    </c:forEach> 
   
    </table >
 
    <div style="text-align:center"  >
     <a href="SearchallQ?page=1" class="btn btn-info btn-lg" style="text-decoration:none">全部留言</a> 
      <a href="success.jsp" class="btn btn-info btn-lg" style="text-decoration:none">主菜单</a> 
     </div>
    </div>
       </div>
          </div>
          	</div>
          	        	</div>
          	
    <script src="js/particles.min.js"></script>
    <script src="js/app3.js"></script>
   	<script src="js/jquery.min.js"></script>
                <script>

function fun2(){
	alert("删除成功！")	
}
	
</script>
  </body>
</html>