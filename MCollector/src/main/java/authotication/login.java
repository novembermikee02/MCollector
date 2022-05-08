package authotication;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.Session;

/**
 * Servlet implementation class login
 */
@WebServlet(name = "Login", urlPatterns = { "/login" })
public class login extends HttpServlet {
	@SuppressWarnings("null")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uEmail = request.getParameter("email");
		String uPass = request.getParameter("password");

		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;
		ResultSet rs;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mcollectordb", "root",
					"Neel0225@@");
			PreparedStatement pst = con.prepareStatement("select * from user where email = ? and password = ?");
			pst.setString(1, uEmail);
			pst.setString(2, uPass);

			rs = pst.executeQuery();

			if (rs.next()) {

				if (rs.getString("role").equals("Admin")) {
					session.setAttribute("u_id", rs.getString(1));
					session.setAttribute("name", rs.getString("name"));
					session.setAttribute("role", rs.getString("role"));
					session.setAttribute("email", rs.getString("email"));
					dispatcher = request.getRequestDispatcher("index.jsp");

				} else {
					session.setAttribute("u_id", rs.getString(1));
					session.setAttribute("name", rs.getString("name"));
					session.setAttribute("role", rs.getString("role"));
					session.setAttribute("email", rs.getString("email"));
					dispatcher = request.getRequestDispatcher("index.jsp");
				}

			} else {
				dispatcher = request.getRequestDispatcher("login.jsp");
				System.out.println("Please Enter Correct Username and Password");
			}

			dispatcher.forward(request, response);

			System.out.println(rs.next());
			System.out.println(rs.getString("name"));
			System.out.println(rs.getString("role"));
			System.out.println(rs.getString("email"));
			System.out.println(rs.getString("password"));

//			String pName = rs.getString("role");
//			if (rs.next() == true) {
//				System.out.println("Product: " + rs.getString("name"));
//				PrintWriter out1 = response.getWriter();
//				out1.print("login success");
//			} else {
//				System.out.println("Product: " + rs.getString("name"));
//				PrintWriter out2 = response.getWriter();
//				out2.print("login failed");
//			}
//			if (pName == "Admin") {
//				System.out.println("true second if Product: " + rs.getString("name"));
//				PrintWriter out1 = response.getWriter();
//				out1.print("true second if  login success");
//			} else {
//				System.out.println(" true second if  Product: " + rs.getString("name"));
//				PrintWriter out2 = response.getWriter();
//				out2.print(" true second if  login failed");
//			}

//			if (rs.next()) {
////				session.setAttribute("name", rs.getString("name"));
////				dispatcher = request.getRequestDispatcher("index.jsp");
//
////				PrintWriter out = response.getWriter();
////				out.print("Role of user" + rs.getString(3));
//
//				PrintWriter out1 = response.getWriter();
//				out1.print("login success");
//
//				System.out.println(rs.getString("email"));
//			} else {
////				request.setAttribute("status", "failed");
////				dispatcher = request.getRequestDispatcher("login.jsp");
//				PrintWriter out2 = response.getWriter();
//				out2.print("login failed");
//			}
//			dispatcher.forward(request, response);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

}
