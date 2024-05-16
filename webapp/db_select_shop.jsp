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
    <title>db_select_shop</title>
    <link rel="stylesheet" href="css/style.css?after">

</head>
<style>
    a:nth-child(3){
        text-decoration: underline;
    }
</style>
<body>
<section>
    <table class="table table-striped table-hover">
        <tr>
            <td>매장코드</td>
            <td>매장명</td>
            <td>매장별 판매액</td>
        </tr>

        <%

            try{
                conn = Util.getConnection();
                stmt = conn.createStatement();

                String sql=
                        "select b.scode, b.sname, to_char(sum(a.cost * c.amount),'999,999,999,999') cost "+
                                "from "+
                                "tbl_product_01 a, "+
                                "tbl_shop_01 b, "+
                                "tbl_salelist_01 c "+
                                "where b.scode = c.scode and c.pcode = a.pcode "+
                                "group by b.scode, b.sname "+
                                "order by 1";

                ResultSet rs = stmt.executeQuery(sql);

                while(rs.next()){
        %>

        <tr>
            <td><%=rs.getString("scode")%></td>
            <td><%=rs.getString("sname")%></td>
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