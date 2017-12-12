<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

    <style type="text/css">
     #myNavbar{
  min-height: 90px;
}
.navcllpse{
    padding-top: 32px;
    color: black;
    font-family: Garamond;
    font-size: 1.5em;
}
    </style>
</head>
<body>
  
  <nav id="myNavbar" class="navbar navbar-default  navbar-fixed-top" role="navigation">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbarCollapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">
              <img src="${pageContext.request.contextPath}/images/logo15.png" width=300px; height=70px;></a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse pull-right navcllpse" id="navbarCollapse">
            <ul class="nav navbar-nav">
               <li ><a href="#" >View  Walkins</a></li>
                 <li class="dropdown">
                        <a href="registeredandnonregistered" >Track Registration</a>
                       <!--  <ul class="dropdown-menu">data-toggle="dropdown" class="dropdown-toggle"
                            <li><a href="#">Register</a></li>
                            <li><a href="#">Non-Register</a></li>
                            
                        </ul> -->
                    </li>
                <li><a href="#" >Payment</a></li> 
            </ul>
        </div>
    </div>
</nav>
    
    

</body>
</html>