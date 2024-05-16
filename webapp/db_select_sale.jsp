<%@ page language="java" contentType="text/html; UTF=8" pageEncoding="utf-8" %>

<%@ page import="DBPKG.Util" %>
<%@ page import="java.sql.*" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>db_select_sale</title>
    <link rel="stylesheet" href="css/style.css?after">
</head>
<style>
    a:nth-child(2){
        text-decoration: underline;
    }
</style>
<body>
    <table class="table table-striped table-hover">
        <tr>
            <td>비번호</td>
            <td>상품코드</td>
            <td>판매날짜</td>
            <td>매장코드</td>
            <td>상품명</td>
            <td>판매수량</td>
            <td>총판매액</td>
        </tr>

        <%

            try{
                conn = Util.getConnection();
                stmt = conn.createStatement();

                String sql=
                        "select c.saleno, c.pcode, c.saledate, c.scode, a.name, c.amount, to_char(a.cost * c.amount,'999,999,999,999') cost "+
                                "from "+
                                "tbl_product_01 a, "+
                                "tbl_shop_01 b, "+
                                "tbl_salelist_01 c "+
                                "where c.scode = b.scode and c.pcode = a.pcode";

                ResultSet rs = stmt.executeQuery(sql);

                while(rs.next()){
        %>

        <tr>
            <td><%=rs.getInt("saleno")%></td>
            <td><%=rs.getString("pcode")%></td>
            <td><%=rs.getDate("saledate")%></td>
            <td><%=rs.getString("scode")%></td>
            <td><%=rs.getString("name")%></td>
            <td><%=rs.getInt("amount")%></td>
            <td><%=rs.getString("cost")%></td>
        </tr>

        <%
            }
            }
            catch (Exception e){
                e.printStackTrace();
            }
        %>
    </table>

</body>
</html>