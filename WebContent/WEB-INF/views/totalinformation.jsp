<%@page import="com.trinee.spring.model.StudentRegistration"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/cs/totalinformation.css" rel="stylesheet">
<title>Insert title here</title>
</head>
<%StudentRegistration studentdetails=(StudentRegistration)session.getAttribute("printstatment");%>
<body>
<%@ include file="/WEB-INF/views/header.jsp"%>
<div class="space"></div>


   
     
         <div class="container">

     <div class="row">
      <div class="col-lg-5 col-xs-5 col-sm-5">
      <table class="table">
      <tbody>
          <tr>
             <td class="text-center">
              <p> <span> <b>NAME: </b></span></p>
               
      
             </td>
             <td>
              <p><%=studentdetails.getStudentname() %></p>
             </td>
          </tr>
          
          <tr>
          
            <td class="text-center"> <p> <span> <b>ID NUMBER:</b> </span></p> </td>
            
            <td> 90R1A0001</td>
            
          </tr>
          
          <tr>
            <td class="text-center"> <p> <span> <b>JOINING DATE:</b>  </p> </td>
            <td>  02/02/12016</td>
          </tr>
      
      </tbody>
      
      </table>

    
   

   

</div>
 
<div class="col-lg-5 col-xs-5 col-sm-5">

<table class="table">
 <tbody>
   <tr>
   
   <td class="text-center"> <span><b>EMAIL ID:</b></span></td>
   <td><%=studentdetails.getStudentemail() %></td>
   </tr>
   
   <tr>
     <td class="text-center"> <span><b>MOBILE NUMBER:</b></span></td>
     <td><%=studentdetails.getStudentmobile() %></td>
   </tr>
 </tbody>


</table>



</div>

<div class="col-lg-2 col-xs-2 col-sm-2">

<div class="pick">
<img class="image" src="${pageContext.request.contextPath}/imagess/<%=studentdetails.getEnquiry_id()%>.jpg"/>
</div>

</div>
</div>
    

         
          <hr class="hr">

        

             <table class="table">
    <thead>
      <tr>
        <th class="text-center">Receipt Number</th>
        <th class="text-center">Total Amount</th>
        <th class="text-center">Paid Amount</th>
        <th class="text-center">Remaining  Amount</th>
      </tr>
    </thead>
    <tbody>
      <tr class="success">
        <td class="text-center">A-1</td>
        <td class="text-center"><%=studentdetails.getCourse_cost() %></td>
        <td class="text-center"><%=studentdetails.getCourse_cost_paid() %></td>
        <td class="text-center"><%=studentdetails.getCourse_cost_balance() %></td>
      </tr>
     
    
    </tbody>
 </table>
 
      <p ><span class="Signature"><b>Signature:</b></span></p>


 <a href="#" class='btn btn-default pull-right' onclick="printpage();"> print</a>
        
         </div>
      </div>


	
<script type="text/javascript">

function printpage()
{
	window.print();
	}
</script>



</body>
</html>