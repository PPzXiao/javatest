<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="css/success.css">
<link rel="stylesheet" href="css/paging.css">

      <title>登陆成功</title>
  </head>
  <body> 
  	<div class="top"> 
  		<div class="top-img-left" alt="" src="img/flower1.png"></div>
  		<div class="top-img-right" alt="" src="img/flower2.png"></div>
  		<div class="userinfo">
  			<span class="welcome">biu~${userInfo.getName()}</span>
  			<img class="headimg" alt="" src="img/headimg.png">
  			<div class="show">
  				<a href="Modify.jsp"><div>修改信息</div>
  				<a href="ModifyP.jsp"><div>修改密码</div>
  				<a href="login.jsp"><div>退出登录</div></a>
  			</div>
  		</div>
  		<div class="top-title">.o GoBang o.</div>
  		  	</div>
  <div class="middle">
  	<div class="middle-left">
  	<div class="ranktitle">我的战绩</div>
  <div class="rankblock">
  		<div class="user otheruser score">
		  	<div class="No1 notitle">日期</div>
		  	<div class="name1">
		  		胜负
		  	</div>	
		  	<div class="rank1">步数</div>
		  	<div class="rankname1">用时</div>
		  	<div class="point1">积分</div>
  		</div>
		<div class="ranking">
			<c:forEach items="${userScore}" var ="R" varStatus="status">
			<div class="user otheruser score">
					<div class="No1">${R.getGameDate()}</div>
				  	<div class="name1">
				  		${R.getWorL()}
				  	</div>	
				  	<div class="rank1">${R.getStep()}</div>
				  	<div class="rankname1">${R.getTime() }<span class="pts">s</span></div>
				  	<div class="point1">${R.getScore() }<span class="pts">pts</span></div>
				</div>
			</c:forEach>
		</div>
		</div>
		<div class="boxcontainer">
			<div class="box" id="box"></div>
		</div>	
  	</div>
  	<div class="middle-right">
  		<div class="start-btn"><a href="demo.jsp" style="text-decoration:none"><div class="btn-title">开始游戏</div></a></div>
  		<c:if test="${grant!=1}">
		<div class="start-btn"><a href="RankingServlet?page=1" style="text-decoration:none"><div class="btn-title">排行榜</div></a></div>
		</c:if>
		<c:if test="${grant!=1}">
		<div class="start-btn"><a href="ScoreServlet?page=1" style="text-decoration:none"><div class="btn-title">战绩</div></a></div>
		</c:if>
  		<c:if test="${grant!=1}">
		<div class="start-btn"><a href="Question.jsp" style="text-decoration:none"><div class="btn-title">留言</div></a></div>
		</c:if>
        <div class="start-btn"><a href="SearchallQ" style="text-decoration:none"><div class="btn-title">查看留言</div></a></div>
		<c:if test="${grant==1}">
		<div class="start-btn"><a href="Searchall"><div class="btn-title" style="text-decoration:none">所有用户</div></a></div>
		</c:if>
	</div>
  </div>
	<script src="js/success.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/paging.js"></script>
    <script>
    	var count1="<%=session.getAttribute("count1")%>"; 
        var pages = parseInt((parseInt(count1)+4)/5);
        var initpage="<%=session.getAttribute("initpage")%>";
        console.log(pages)
			$(".box").css("width",function(i,curr){
				console.log(curr);
				if(pages<5) return 700-50*(5-pages);
				else return 700;
			});
        $('#box').paging({
            initPageNo:initpage , // 初始页码
            totalPages: pages, //总页数
            totalCount: '合计' + count1 + '条数据', // 条目总数
            slideSpeed: 0, // 缓动速度。单位毫秒
            jump: true, //是否支持跳转
            callback: function(page) { // 回调函数
                console.log(page);
                var temp_form = document.createElement("form");
                temp_form.action = "ScoreServlet";
                //如需打开新窗口，form的target属性要设置为'_blank'
                temp_form.target = "_self";
                temp_form.method = "post";
                temp_form.style.display = "none";
                //添加参数
                    var opt = document.createElement("textarea");
                    opt.name = "page";
                    opt.value = page;
                    temp_form.appendChild(opt);
                document.body.appendChild(temp_form);
                //提交数据
                temp_form.submit();
            }
        })
    </script>
  </body>
</html>