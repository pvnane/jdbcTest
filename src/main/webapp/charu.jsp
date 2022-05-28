<%--
  Created by IntelliJ IDEA.
  User: 14MF
  Date: 2022/5/1
  Time: 17:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    PreparedStatement preStmt = null;
    Connection conn=null;
    try{
// 1. 注册数据库的驱动
        Class.forName("com.mysql.jdbc.Driver");
// 2.通过DriverManager获取数据库连接
        String url = "jdbc:mysql://localhost:3306/booktest?useUnicode=true&characterEncoding=utf-8";
        String username = "root";
        String password = "1234";
        conn = DriverManager.getConnection (url, username,
                password);



// 4.使用Statement执行SQL语句。
        String sql = "INSERT INTO book(name,price,bookCount,author)"
                + "VALUES(?,?,?,?)";
// 创建执行SQL语句的PreparedStatement 对象
        preStmt = conn.prepareStatement(sql);
        preStmt.setString(1, "朝花夕拾2");
        preStmt.setDouble(2, 150.0);
        preStmt.setInt(3, 20);
        preStmt.setString(4, "鲁迅");
        preStmt.executeUpdate();
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } finally { // 释放资源
        if (preStmt != null) {
            try {
                preStmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            preStmt = null; }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            conn = null; } }
%>
</body>
</html>
