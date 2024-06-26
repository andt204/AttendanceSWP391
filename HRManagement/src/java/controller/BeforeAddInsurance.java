/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import configs.headerInfor;
import dal.EmployeeDAO;
import dal.InsuranceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import models.Employee;

/**
 *
 * @author andep
 */
@WebServlet(name = "BeforeAddInsurance", urlPatterns = {"/beforeAddInsurance"})
public class BeforeAddInsurance extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BeforeAddInsurance</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BeforeAddInsurance at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        headerInfor.setSessionAttributes(request);
        request.getRequestDispatcher("BeforeAddInsurance.jsp").forward(request, response);
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
        headerInfor.setSessionAttributes(request);
        try {
            int id = Integer.parseInt(request.getParameter("id"));

            EmployeeDAO dao = new EmployeeDAO();
            InsuranceDAO idao = new InsuranceDAO();

            Employee empoyee = dao.getEmployeeById(id);

            if (empoyee == null) {
                request.setAttribute("fail", "This employee does not exist within the company.");
                request.getRequestDispatcher("BeforeAddInsurance.jsp").forward(request, response);
            }

            if (idao.isInsuranceExist(id)) {
                request.setAttribute("fail", "This employee has insurance.");
                request.getRequestDispatcher("BeforeAddInsurance.jsp").forward(request, response);
            } else {
                response.sendRedirect("addInsurance?id=" + id);
            }
        } catch (NumberFormatException e) {
            // Handle NumberFormatException if the id parameter is not a valid integer
            e.printStackTrace(); // Print the stack trace for debugging
            request.setAttribute("fail", "Invalid employee ID format.");
            request.getRequestDispatcher("BeforeAddInsurance.jsp").forward(request, response);
        } catch (Exception e) {
            // Handle other exceptions
            e.printStackTrace(); // Print the stack trace for debugging
            request.setAttribute("fail", "An error occurred while processing your request.");
            request.getRequestDispatcher("BeforeAddInsurance.jsp").forward(request, response);
        }
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
