<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

html,
body {
  background: #ccc;
  text-align: left;
  padding: 3%;
  font: 100%/1.5 Ubuntu, sans-serif;
}






}
.divmessage{

}

.result{

font-family: cursive;
   text-align: center;

}
</style>
<script type="text/javascript">

function asdffs() {
	setTimeout(function(){ window.location.href = "${pageContext.request.contextPath}/123"; }, 3000);
	
	
}
</script>
</head>
<body onload="asdffs();">
<div class="divmessage">
<p class="result"><%=session.getAttribute("outstudent")%></p>

</div>
</body>
</html>