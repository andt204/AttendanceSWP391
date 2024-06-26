/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import configs.headerInfor;
import dal.FeedbackDAO;
import dal.SalaryDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import models.AccountDTO;
import models.EmployeeSalary;
import models.Feedback;

/**
 *
 * @author Dan
 */
@WebServlet(name="FeedbackController", urlPatterns={"/Feedback"})
public class FeedbackController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Feedback</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Feedback at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        headerInfor.setSessionAttributes(request);
         HttpSession session = request.getSession();
        AccountDTO acc = (AccountDTO) session.getAttribute("account");
        request.setAttribute("userID", acc.getUserID());
      
        String search = request.getParameter("search");
        request.setAttribute("search", search);
        String username  = acc.getUserName();
        SalaryDAO sdao = new SalaryDAO();
         EmployeeSalary employeeSalary = new EmployeeSalary();
         FeedbackDAO feedbackDAO = new FeedbackDAO();
        try {
             List<Feedback> list = feedbackDAO.getAllFeedbacks(search == null ? "" : search, acc.getUserID());
            employeeSalary = sdao.getEmployeeSalaryByUsername(username);
              request.setAttribute("lists", list);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FeedbackController.class.getName()).log(Level.SEVERE, null, ex);
        }
      
            request.setAttribute("employeeSalary", employeeSalary);
       request.getRequestDispatcher("EmployeeFeedback.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
