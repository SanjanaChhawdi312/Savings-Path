/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
/**
 *
 * @author Dell
 */
public class registerController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String fname = request.getParameter("first_name");
            String lname = request.getParameter("last_name");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String job = request.getParameter("job");
            String email = request.getParameter("email");
            String pwd = request.getParameter("pwd");
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/userDB","users","user@admin");
            String sql = "INSERT INTO USERS.USERDATA VALUES (?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, fname);
            statement.setString(2, lname);
            statement.setString(3, gender);
            statement.setString(4, dob);
            statement.setString(5, job);
            statement.setString(6, email);
            statement.setString(7, pwd);
            out.println("<link rel=\"stylesheet\" href=\"register.css\" type=\"text/css\">");
            out.println("<body>");   
            out.println("<div class=\"wrapper\">");   
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                out.println("<label><center>Record inserted successfully</center></label>");
            } else {
                out.println("<label><center>Failed to insert record</center></label>");
            }
            out.println("</div>");   
            out.println("</body>");
            con.close();
        }
        catch(Exception ex){
            ex.printStackTrace();
        }
    }
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
