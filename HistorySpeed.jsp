<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>历史查询页面</title>
<link href="http://v3.bootcss.com/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- <link href="../bootstrap/css/registe.css" rel="stylesheet">   -->
<script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://v3.bootcss.com/dist/js/bootstrap.min.js"></script>
<!-- 内部样式 -->
<style type="text/css">
.div1{
	margin-left:150px;
	margin-right:150px;
	
}
</style>
</head>
<body>
<!-- 导航部分 -->
<jsp:include   page="header.jsp" flush="true"/>

  <!-- 中间部分 查询 -->
<h3 style="margin-left:150px;">Welcome : <%=session.getAttribute("loginname")%><br><br></h3>
	    <form action="../HistorySpeed" name="historySpeed_form" method="post" >
			<div class="div1">
				<span style=" font-family: '微软雅黑'">用户名： </span>  <br /><br />
				<input type="text" class="form-control" id="user" name="username" value="<%=session.getAttribute("loginname")%>" /><br>
				
				<span style=" font-family: '微软雅黑'">查询日期(格式：20200317代表2020/03/17)：</span> <br /><br />
				<input type="text" class="form-control" id="date" name="date" placeholder="请输入需要查询的日期 "/><br>	
							
				<button type="button" class="btn btn-info" onClick="sub()">查询</button><hr>
				
				<table class="table table-hover" id="tb1">
					 <tr>
				  	<td>用户</td>
				  	<td>日期</td>
				  	<td>速度</td>
				  	<td>状态</td>
				  	</tr>
				</table>
				
				
			</div>
		</form>
</body>
<script type="text/javascript">
function sub(){					//点击发送ajax和后台获取speed、更改table列表显示speed的function
	var username = document.getElementById('user').value;
	var date = document.getElementById('date').value;
	var list = new Array();
	console.log("ready to send ajax with data:"+username+"  date :"+date);
	$.ajax({
		type:"post",
		url:"${pageContext.request.contextPath }/HistorySpeed",
		data:{"username":username,"date":date}, 
		success: function (data, Status) {
	        console.log("data is:" + data);
	        list = data.split("#");
	        //$("input").eq(3).val(list);
	        var tb1=document.getElementById("tb1");
	    	if(tb1.lastChild){								//在table的最后一个子节点
	    		  for(var i=0;i<list.length-1;i++){			//以ajax返回的数组长度遍历所有速度条数
	    			  var myNode1=makeNode("td",username);	//创建一个新的dom元素
		    		  var myNode2=makeNode("td",date);
		    		  var myNode3=makeNode("td",list[i]);
		     		  var myNode4 =makeNode("td","正常");			//添加了速度对应的车速是否超速的状态
		     		  var myNode5 =makeNode("td","超速");
		     		  
		    		  var trNode=document.createElement("tr");	//建立table的一个新行
		    		  trNode.appendChild(myNode1);				//新行添加节点
		    		  trNode.appendChild(myNode2);
		    		  trNode.appendChild(myNode3);
		    		  if(list[i]>400){			   //该处的比较值需要用list数组中的值进行比较，原来用myNode3进行比较无法正常显示，因为var变量类型问题			
		    			  trNode.appendChild(myNode5);	
		    		  }else{
		    			  trNode.appendChild(myNode4);	
		    		  }
		    		  tb1.lastChild.appendChild(trNode);		//将新行追加在table的最后一行
	    		  }
	    		   
	        }//end of if
	      }//end of ajax's success
	});//end of all ajax
}

function makeNode(node,text){							//创建一个新的dom元素
	   var newNode=document.createElement(node);
	   var newText=document.createTextNode(text);
	   newNode.appendChild(newText);
	   
	   return newNode;
}


</script>

</html>