<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>


<script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>


<%@ include file="../layout/header2.jsp" %>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

<br/><br/>
<div class="container">
<div class="row">
    <div class="col-md-12">
        <div class="card">
            <div class="card-body">
                <h1 class="card-title text-uppercase mb-0">카테고리 리스트</h1>
            </div>
            <div class="table-responsive">
                <table class="table no-wrap user-table mb-0">
                  <thead>
                    <tr>
                      <th scope="col" class="border-0 text-uppercase font-medium pl-4">#</th>
                      <th scope="col" class="border-0 text-uppercase font-medium"></th>
                      <th scope="col" class="border-0 text-uppercase font-medium">ID</th>
                      <th scope="col" class="border-0 text-uppercase font-medium">Name</th>
                      <th scope="col" class="border-0 text-uppercase font-medium"></th>
                      <th scope="col" class="border-0 text-uppercase font-medium"></th>
                      <th scope="col" class="border-0 text-uppercase font-medium">Manage</th>
                    </tr>
                  </thead>
                  <tbody>
                   <c:forEach var="category" items="${list}">
                    <tr>
                      <td class="pl-4">1</td>
                      <td>
                          <h5 class="font-medium mb-0"></h5>
                          
                      </td>
                      <td>
                          <span class="text-muted">${category.categoryId}</span><br>
                         
                      </td>
                      <td>
                          <span class="text-muted">${category.name}</span><br>
                         
                      </td>
                      <td>
                          <span class="text-muted"></span><br>
                         
                      </td>
                      <td>
                       
                      </td>
                      <td>
                        <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"><i class="fa fa-trash"></i> </button>
                        <button type="button" class="btn btn-outline-info btn-circle btn-lg btn-circle ml-2"><i class="fa fa-edit"></i> </button>           
					  <td>
                    </tr>
                     </c:forEach>
                  </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</div>





 <script type="text/javascript">


</script>
   
<%@ include file="../layout/footer.jsp" %>

</body>
</html>