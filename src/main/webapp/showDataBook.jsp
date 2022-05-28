
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Title</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%
    Statement stmt = null;
    ResultSet rs=null;
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
        // 3.通过Connection对象获取Statement对象
        stmt =conn.createStatement();

// 4.使用Statement执行SQL语句。
        String sql = "select * from book";
        rs = stmt.executeQuery(sql);
// 5. 操作ResultSet结果集
        System.out.print("id name price bookCount author");
        System.out.println("\n");
        while (rs.next()) {
            int id = rs.getInt("id"); // 通过列名获取指定字段的值
            String name = rs.getString("name");
            Double price = rs.getDouble("price");
            int bookcount = rs.getInt("bookCount");
            String author = rs.getString("author");
          System.out.println(id + " "+" " + name + " " +" " + price + " "+ " " + bookcount
                    + " " +" " + author+"\n");

        }
    }catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    finally{
// 6.回收数据库资源
        if(rs!=null) {
            try {
                rs.close();
            } catch(SQLException e) {
                e.printStackTrace();
            }
            rs = null;
        }

        if(stmt!=null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            stmt = null;
        }

        if(conn!=null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
            conn = null;
        }
    }
%>
</body>
</html>
