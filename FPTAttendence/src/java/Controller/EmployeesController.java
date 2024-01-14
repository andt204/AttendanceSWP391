/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import dal.Dao;
import Models.Dto;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author NCM
 */
public class EmployeesController extends HttpServlet {

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
            HttpSession session = request.getSession();
            Dto acc = (Dto) session.getAttribute("account");
            if (acc == null) {
                out.println("Access denied!");
            } else {
                request.getRequestDispatcher("HomeEmployees.jsp").forward(request, response);
            }
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
        String url = null;
        String button = request.getParameter("btAction");
        try {
            if (button == null) {

            } //Update thong tin nhan vien
            else if (button.equals("Update")) {

                int accid = Integer.parseInt(request.getParameter("empId"));
                String name = request.getParameter("empName");
                String Phone = request.getParameter("empNumber");
                String email = request.getParameter("empEmail");
                String address = request.getParameter("empAddress");
                int gender = Integer.parseInt(request.getParameter("empGender"));
                boolean genderCheck = false;
                if (gender == 1) {
                    genderCheck = true;
                } else {
                    genderCheck = false;
                }
                String birthdateString = request.getParameter("empBirthdate");

                Dao dao = new Dao();

                boolean checkUpdate = false;
                checkUpdate = dao.updateIn4Information(accid, name, Phone, email, address, genderCheck, birthdateString);
                String ms = "";
                if (checkUpdate == true) {
                    url = "profile";
                    ms = "Update Succes";
                    request.setAttribute("ms", ms);
                } else {
                    url = "profile";
                    ms = "Update Failed";
                    request.setAttribute("ms", ms);
                }

            } // sang tab thay doi thong tin nhan vien
            else if (button.equals("Update Information")) {
                url = "updateIn4mationUser.jsp";
            }
        } catch (Exception ex) {
            Logger.getLogger(EmployeesController.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }
}
/**
 * Returns a short description of the servlet.
 *
 * @return a String containing servlet description
 */
