<%@ page import="java.sql.*" %>
<%@ page import="DBPKG.Util" %>

<%@ page language="java" contentType="text/html; UTF=8" pageEncoding="utf-8" %>

<%
    request.setCharacterEncoding("UTF-8");

    String saleno = request.getParameter("saleno");
    String pcode = request.getParameter("pcode");
    String saledate = request.getParameter("saledate");
    String scode = request.getParameter("scode");
    String amount = request.getParameter("amount");

    Connection conn = null;
    Statement stmt = null;

    try{
        conn = Util.getConnection();
        stmt = conn.createStatement();

        String sql =
                "INSERT INTO tbl_salelist_01 " +
                        "VALUES(" + saleno + ", " +
                        "'" + pcode + "', " +
                        "TO_DATE('" + saledate + "', 'YYYY-MM-DD'), " +
                        "'" + scode + "', " +
                        "'" + amount + "')";

        stmt.executeUpdate(sql);
%>
<jsp:include page="index.jsp"></jsp:include>

<%
    }catch (Exception e){
        e.printStackTrace();
    }
%>