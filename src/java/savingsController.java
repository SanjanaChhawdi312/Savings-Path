/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author Dell
 */
public class savingsController extends HttpServlet {

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
        
        String savingsId = generateRandomSavingsId();
        String email = (String) request.getSession().getAttribute("email");
        String amountParam = request.getParameter("amount");
        int amount = 0;  
        if (amountParam != null && !amountParam.isEmpty()) {
            amount = Integer.parseInt(amountParam);
        }
        String dateStr = request.getParameter("dt");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            try{
                java.sql.Date sqlDate = null;
                if (!dateStr.isEmpty()) {
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    java.util.Date utilDate = dateFormat.parse(dateStr);
                    sqlDate = new java.sql.Date(utilDate.getTime());
                    
                    System.out.println("email"+email+savingsId+amountParam+sqlDate);
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/userDB", "users", "user@admin");
                    String sql = "INSERT INTO USERS.SAVINGS (SAVING_ID, EMAIL, AMOUNT, DATE) VALUES (?, ?, ?, ?)";
                    try (PreparedStatement statement = con.prepareStatement(sql)) {
                        statement.setString(1, savingsId);
                        statement.setString(2, email);
                        statement.setInt(3, amount);
                        statement.setDate(4, sqlDate);

                        out.println("<div class=\"info\">");
                        int rowsInserted = statement.executeUpdate();
                        if (rowsInserted > 0) {
                            request.setAttribute("insertStatus", "success");
                        } else {
                            request.setAttribute("insertStatus", "failure");
                        }
                        out.println("</div>");
                        con.close();
                    }
                } else {
                    request.setAttribute("insertStatus", "failure");
                }
            } catch (ParseException ex) {
                request.setAttribute("insertStatus", "failure");
                ex.printStackTrace();
            } catch (Exception ex) {
                request.setAttribute("insertStatus", "failure");
                ex.printStackTrace();
            }

            RequestDispatcher rd = request.getRequestDispatcher("/savings.jsp");
            rd.forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    private String generateRandomSavingsId() {
        return UUID.randomUUID().toString().substring(0, 5);
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
