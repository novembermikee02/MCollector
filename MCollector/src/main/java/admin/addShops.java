package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class addShops
 */
@WebServlet("/addshop")
public class addShops extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);

		String sname = request.getParameter("shopname");
		String saddress = request.getParameter("shopaddress");
		Timestamp timestamp = new Timestamp(new Date().getTime());
		String status = "Active";
		RequestDispatcher dispatcher = null;
		Connection con = null;

		try {

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mcollectordb", "root", "Neel0225@@");
			PreparedStatement pst = con.prepareStatement(
					"insert into shops(shop_name,shop_address,creation_on,modified_on,status) values(?,?,?,?,?)");
			pst.setString(1, sname);
			pst.setString(2, saddress);
			pst.setTimestamp(3, timestamp);
			pst.setTimestamp(4, timestamp);
			pst.setString(5, status);

			int rowCount = pst.executeUpdate();

			if (rowCount > 0) {
				dispatcher = request.getRequestDispatcher("viewShops.jsp");
			} else {

			}
			dispatcher.forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
	}

}
