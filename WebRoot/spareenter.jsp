<%@ page language="java" import="model.*"  import ="model.Part" import="java.util.*" contentType="text/html" pageEncoding="GBK"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="wclassth=device-wclassth, initial-scale=1.0">
	<title>������</title>
	<script src="js/jquery-2.1.1.min.js" type="text/javascript"></script>
	<script src="js/layer.js" type="text/javascript"></script>
	<link rel="stylesheet" type="text/css" href="css/layer.css"/>
	<link rel="stylesheet" type="text/css" href="css/plug.css"/>
	<link rel="stylesheet" type="text/css" href="css/style.css"/>
	<link rel="stylesheet" type="text/css" href="css/repair.css"/>
	<link rel="stylesheet" type="text/css" href="css/sparepart.css"/>
</head>
<body>
<div class="none">
</div>
<div class="header">
	<img class="img1" src="images/group23.jpg"></img>
	<div class="buttons">
		<ul>
			<li>
				<a class="aa" href="login.jsp" onmouseenter="aenter(this)" onmouseleave="aleave(this)">��¼</a>
			</li>
			<li>
				<a class="aa" href="customers.jsp" onmouseenter="aenter(this)" onmouseleave="aleave(this)">�ͻ�����</a>
			</li>
			<li>
				<a class="aa" href="report.jsp" onmouseenter="aenter(this)" onmouseleave="aleave(this)">���޹���</a>
			</li>
			<li>
				<a class="aa" href="repair.jsp" onmouseenter="aenter(this)" onmouseleave="aleave(this)">ά�޹���</a>
			</li>
			<li>
				<a class="aa" href="sparepart.jsp" onmouseenter="aenter(this)" onmouseleave="aleave(this)">��������</a>
			</li>
		</ul>
	</div>
</div>
<div class="none">
</div>

<div class="container">
	<div class="centerpart">
		<div class="outenterbuttons">
			<div class="partname" style="color:red">
				��������
			</div>
			<div class="parttype" style="color:red">
				�����ͺ�
			</div>
			<div class="partprice" style="color:red">
				�����۸�
			</div>
			<div class="remainpart" style="color:red">
				ʣ�౸��
			</div>
			<div class="entertime" style="color:red">
				���ʱ��
			</div>
			<div class="dangerousnumber" style="color:red">
				��������
			</div>
			<div class="status" style="color:red">
				���״̬
			</div>
		</div>
<!-- 		<div class="outenterbuttons">
			<div class="partname">
				����1
			</div>
			<div class="parttype">
				A��
			</div>
			<div class="partprice">
				1Ԫ
			</div>
			<div class="remainpart">
				ʣ��1��
			</div>
			<div class="entertime">
				2016.6.28
			</div>
			<div class="dangerousnumber">
				2��
			</div>
			<div class="status">
				����
			</div>
			<div class="enterbutton">
				<button class = "allot" type="submit" onclick="bbb()">����</button>
			</div>
		</div>	 -->
	</div>
</div>

<%
int i;
int state;
int num;
String stState;
ArrayList<Part> list = (ArrayList<Part>)session.getAttribute("partList"); 
if(list != null)
{
	for(i = 0;i < list.size(); i++)
	{
		state = list.get(i).getWarnNum();
		num = list.get(i).getNum();
		if(num > state)
			stState = "����";
		else if(num == state)
			stState = "�ٽ�";
		else if(num < state)
			stState = "����";
		else if(num == 0)
			stState = "ȱ��";
		else
			stState = "";
			
			out.print(	"<div class=\"container\">"
							+"<div class=\"centerpart\" id=\""+list.get(i).getPartName()+"\">"
							+"<div class=\"outenterbuttons\" id=\""+list.get(i).getType()+"\">"			
							+"<div class=\"partname\">"+list.get(i).getPartName()+"</div>"
							+"<div class=\"parttype\">"+list.get(i).getType()+"</div>"
							+"<div class=\"partprice\">" + list.get(i).getPrice() + "</div>"
							+"<div class=\"remainpart\">" + list.get(i).getNum() + "</div>"
							+"<div class=\"entertime\">" + list.get(i).getDate() + "</div>"
							+"<div class=\"dangerousnumber\">" + list.get(i).getWarnNum() + "</div>"
			   			    +"<div class=\"status\">" + stState + "</div>"
							+"<button class = \"allot\" type=\"submit\" onclick=\"change(this)\">����</button>"	
						+"</div>"	
						+"</div>"
						+"</div>");
	}
}
%>
	<div class="footer">
		<div class="none">
		</div>
		<div class="none">
		</div>
	</div>


</body>
</html>

<script>

function change(obj) {
	event.preventDefault();
	var pid = $(obj).parent().attr("id");
	var ppid = $(obj).parent().parent().attr("id");
	var x = prompt('���������õľ�����Ŀ��', 0);
    $.post("/EMS/ChangeWarn",
	{
		PartName:ppid,
		PartType:pid,
		WarnNum:x
	},
	function(data,status){
      	location.reload();
    });	
}

function bbb() {
	prompt('���������õľ�����Ŀ��', 0);
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