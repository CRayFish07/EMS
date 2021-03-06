<%@ page language="java" import="model.Customer" import="java.util.*" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>客户管理</title>
	<script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="css/plug.css"/>
	<link rel="stylesheet" type="text/css" href="css/style.css"/>
	<link rel="stylesheet" type="text/css" href="css/customers.css"/>
</head>
<body>
<div class="none">
</div>
<div class="header">
	<img class="img1" src="images/group23.jpg"></img>
	<div class="buttons">
		<ul>
			<li>
				<a class="aa" href="login.jsp" onmouseenter="aenter(this)" onmouseleave="aleave(this)">登录</a>
			</li>
			<li>
				<a class="aa" href="customers.jsp" onmouseenter="aenter(this)" onmouseleave="aleave(this)">客户管理</a>
			</li>
			<li>
				<a class="aa" href="report.jsp" onmouseenter="aenter(this)" onmouseleave="aleave(this)">报修管理</a>
			</li>
			<li>
				<a class="aa" href="repair.jsp" onmouseenter="aenter(this)" onmouseleave="aleave(this)">维修管理</a>
			</li>
			<li>
				<a class="aa" href="sparepart.jsp" onmouseenter="aenter(this)" onmouseleave="aleave(this)">备件管理</a>
			</li>
		</ul>
	</div>
</div>


<%
String customerID = "";
String identificationID = "";
String deliverTime = "";
String customerNature = "";
String fixedPhone = "";
String unitName = "";
String mobilePhone = "";
String contacts = "";
String email = "";
String postCode = "";
String address = "";
String customerNatureString = "";
Customer customer = (Customer)session.getAttribute("customer"); 
if(customer != null)
{
	customerID = customer.getCustomerID();
	identificationID = customer.getIdentificationID();
	deliverTime = customer.getDeliverTime();
	customerNature = customer.getCustomerNature();
	fixedPhone = customer.getFixedPhone();
	unitName = customer.getUnitName();
	mobilePhone = customer.getMobilePhone();
	contacts = customer.getContacts();
	email = customer.getEmail();
	postCode = customer.getPostCode();
	address = customer.getAddress();
	
	if(customerNature.equals("1"))
		customerNatureString = "家庭用户";
	else if(customerNature.equals("2"))
		customerNatureString = "单位用户";
	else if(customerNature.equals("3"))
		customerNatureString = "代理商";
	else if(customerNature.equals("4"))
		customerNatureString = "签约用户";
	else
		customerNatureString = " ";
}
%>



<div class = "info" style="height:auto">
	<form id="myform">
		<div class = "contant">
		    <div class ="tips">
			<p style="margin-top:6px;padding:0;"> *客户编号:</p>
			</div>
		<input type="text" placeholder="客户编号" id="customerID" readonly="true" value="<%=customerID %>"><br>
	    </div>

		<div class = "contant">
			<div class ="tips">
			*身份证:
			</div>
			<input type="text" placeholder="身份证" id="identificationID" value="<%=identificationID %>"><br>
		</div>
		
		<div class = "contant">
			<div class ="tips">
			单位名称:
			</div>
			<input type="text" placeholder="单位名称 " id="unitName" value="<%=unitName %>"><br>
		</div>

		<div class = "contant">
			<div class ="tips">
			移动电话:
			</div>
			<input type="text" placeholder="电话" id="mobilePhone" value="<%=mobilePhone %>"><br>
		</div>
		
		<div class = "contant">
			<div class ="tips">
			座机:
			</div>
			<input type="text" placeholder="座机" id="fixedPhone" value="<%=fixedPhone %>"><br>
		</div>	

		<div class = "contant">
			<div class ="tips">
			地址:
			</div>
			<input type="text" placeholder="地址" id="address" value="<%=address %>"><br>
		</div>
		
		<div class = "contant">
			<div class ="tips">
			邮编:
			</div>
			<input type="text" placeholder="邮编" id="postCode" value="<%=postCode %>"><br>
		</div>

		<div class = "contant">
			<div class ="tips">
			E-mail:
			</div>
			<input type="text" placeholder="E-mail" id="email" value="<%=email %>"><br>
		</div>
		
		<div class = "contant">
			<div class ="tips">
			联系人:
			</div>
			<input type="text" placeholder="联系人" id="contacts" value="<%=contacts %>"><br>
		</div>

		<div class = "contant">
			<div class ="tips">
			客户送机时间:
			</div>
			<input type="text" placeholder="客户送机时间" id="deliverTime" value="<%=deliverTime %>"><br>
		</div>

		<div class = "contant">
			<div class ="tips">
			客户性质:
			</div>
			<select id="customerNature">
				<option value ="<%=customerNature %>"><%=customerNatureString %></option>
				<option value ="1">家庭用户</option>
				<option value ="2">单位用户</option>
  				<option value="3">代理商</option>
 				<option value="4">签约用户</option>
			</select>
			<br>
		</div>

	    <div class = "contant">
			<div class ="tips">
			</div>
		<button onclick="isnull()" class = "bt" type="submit">提交</button>
	    </div>

	</form>
</div>


<div class="none"></div>
</body>
</html>

<script>

function isnull() {
	event.preventDefault();
	if(document.getElementById('identificationID').value == '')
    	alert("身份证不能为空！");
    else if(document.getElementById('customerID').value == '')
    	alert("客户编号不能为空！");
    else
    {
	    $.post("/EMS/ChangeCustomer",
		{
			CustomerID:$("#customerID").val(),
			IdentificationID:$("#identificationID").val(),
			DeliverTime:$("#deliverTime").val(),
			CustomerNature:$("#customerNature").val(),
			FixedPhone:$("#fixedPhone").val(),
			UnitName:$("#unitName").val(),
			MobilePhone:$("#mobilePhone").val(),
			Contacts:$("#contacts").val(),
			Email:$("#email").val(),
			PostCode:$("#postCode").val(),
			Address:$("#address").val()
		},
		function(data,status){
	      	location.href="customers.jsp";
	    });	
    }
}
function enter(x) {
    x.style.opacity = "0.5";
}
function leave(x) {
   	x.style.opacity = "1";
}
function aenter(x) {
    x.style.color = "white";
}
function aleave(x) {
   	x.style.color = "rgb(129,129,129)";
}
</script>