package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class viewShops
 */
@WebServlet("/viewshop")
public class viewShops extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);

//		Connection con = null;
//		Statement st = null;
//		ResultSet rs = null;
//		
//
//		try {
//			Class.forName("com.mysql.jdbc.Driver");
//			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mcollectordb", "root", "Neel0225@@");
//			st = con.createStatement();
//			String qry = "select * from shops";
//			rs = st.executeQuery(qry);
//
//			while (rs.next()) {
//				System.out.println("Sr" + rs.getString(1) + "Shop_name" + rs.getString(2));
//				PrintWriter out = response.getWriter();
//				out.print("Sr" + rs.getString(1) + "Shop_name" + rs.getString(2));
//			}
//		} catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}

		// Update Amount

		String u = (String) request.getParameter("uid");
		;
		Integer u_id = Integer.valueOf(u);

		String s_id = request.getParameter("shopid");

		Double stotalAmount = Double.parseDouble(request.getParameter("totalamount"));
		Timestamp timestamp = new Timestamp(new Date().getTime());
		String status = "Active";
		RequestDispatcher dispatcher = null;
		Connection con1 = null;

		try {

			Class.forName("com.mysql.jdbc.Driver");
			con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/mcollectordb", "root", "Neel0225@@");
			PreparedStatement pst1 = con1.prepareStatement(
					"insert into datadm(s_id,u_id,total_amount,creation_on,modified_on,status) values(?,?,?,?,?,?)");
			pst1.setString(1, s_id);
			pst1.setInt(2, u_id);
			pst1.setDouble(3, stotalAmount);
			pst1.setTimestamp(4, timestamp);
			pst1.setTimestamp(5, timestamp);
			pst1.setString(6, status);

			int rowCount1 = pst1.executeUpdate();

			if (rowCount1 > 0) {
				dispatcher = request.getRequestDispatcher("viewShops.jsp");
			} else {

			}
			dispatcher.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				con1.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}

	}

}
