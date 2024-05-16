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
    <title>db_select_product</title>
    <link rel="stylesheet" href="css/style.css?after">

</head>
<style>
    a:nth-child(4){
        text-decoration: underline;
    }
</style>
<body>
<section>
    <table class="table table-striped table-hover">
        <tr>
            <td>상품코드</td>
            <td>상품명</td>
            <td>상품별 판매액</td>
        </tr>

        <%

            try{
                conn = Util.getConnection();
                stmt = conn.createStatement();

                String sql=
                        "select a.pcode, a.name, to_char(sum(a.cost * c.amount),'999,999,999,999') cost "+
                                "from tbl_product_01 a, "+
                                "tbl_shop_01 b, "+
                                "tbl_salelist_01 c "+
                                "where a.pcode = c.pcode and c.scode = b.scode "+
                                "group by a.pcode, a.name "+
                                "order by 1";

                ResultSet rs = stmt.executeQuery(sql);

                while(rs.next()){
        %>

        <tr>
            <td><%=rs.getString("pcode")%></td>
            <td><%=rs.getString("name")%></td>
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
</section>

</body>
</html>