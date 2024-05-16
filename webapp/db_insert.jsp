<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>
<%@ page language="java" contentType="text/html; UTF=8" pageEncoding="utf-8" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>db_insert</title>
    <link rel="stylesheet" href="css/style.css?after">

</head>
<body>

<script type="text/javascript" src="reset.js"></script>

<section class="insert1">
    <%
        Connection conn = null;
        Statement stmt = null;
        String saleno = "";

        try{
            conn = Util.getConnection();
            stmt = conn.createStatement();
            String sql = "select max(saleno) + 1 saleno from tbl_salelist_01";

            ResultSet rs = stmt.executeQuery(sql);

            rs.next();
            saleno = rs.getString("saleno");
        }catch(Exception e){
            e.printStackTrace();
        }
    %>

    <form id="myForm" name="frm_insert" action="action.jsp" method="post" class="insert">
        <table class="table table-bordered transparent-table">
            <tr>
                <td class="border">판매번호</td>
                <td><input type="text" name="saleno" value="<%=saleno%>"></td>
            </tr>
            <tr>
                <td>상품코드</td>
                <td><input type="text" name="pcode" value="AA0"></td>
            </tr>
            <tr>
                <td>판매날짜</td>
                <td><input type="date" name="saledate" id="saledate"></td>
            </tr>
            <tr>
                <td>매장코드</td>
                <td><input type="text" name="scode" value="S00"></td>
            </tr>
            <tr>
                <td>판매수량</td>
                <td><input type="text" name="amount"></td>
            </tr>
            <tr>
                <td colspan="2" class="center">
                    <button class="btn btn-outline-primary" onclick="return insertCheck()">
                        등록
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send" viewBox="0 0 16 16">
                        <path d="M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576zm6.787-8.201L1.591 6.602l4.339 2.76z"/>
                    </svg>
                    </button>
                    <button class="btn btn-outline-danger" type="reset">
                        다시쓰기
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-clockwise" viewBox="0 0 16 16">
                            <path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2z"/>
                            <path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466"/>
                        </svg>
                    </button>
                </td>
            </tr>
        </table>
    </form>

</section>
<script src="reset.js"></script>
</body>
</html>