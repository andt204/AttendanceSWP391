package controller;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import configs.headerInfor;
import dal.AttendanceDAO;
import dal.DepartmentDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import models.AttendanceDepartmentDTO;
import models.Department;

/**
 *
 * @author ThuyVy
 */
@WebServlet(urlPatterns = {"/AttendanceReport"})
public class AttendanceReportController extends HttpServlet {

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
            out.println("<title>Servlet AttendanceReportController</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AttendanceReportController at " + request.getContextPath() + "</h1>");
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
        String search = request.getParameter("search");
        DepartmentDAO d = new DepartmentDAO();
        ArrayList<Department> departmentList = d.getAllDepartments("");
        String departmentName = request.getParameter("departmentName");
        
        Date now = new Date();
        Date fromDate = now;
        Date toDate = now;
        // Xử lý fromDate và toDate
        String fromDateStr = request.getParameter("fromDate");
        String toDateStr = request.getParameter("toDate");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        try {
            if (fromDateStr != null && !fromDateStr.isEmpty()) {
                fromDate = dateFormat.parse(fromDateStr);
            }
            if (toDateStr != null && !toDateStr.isEmpty()) {
                toDate = dateFormat.parse(toDateStr);
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        // Gọi phương thức DAO để lấy danh sách AttendanceReport
        AttendanceDAO attendanceDAO = new AttendanceDAO();
        ArrayList<AttendanceDepartmentDTO> attendanceList = attendanceDAO.getAllAttendance(search == null ? "" : search,departmentName ,fromDate==null?null:fromDate, toDate==null?null:toDate);
        request.setAttribute("listDep", departmentList);
        // Lưu danh sách vào request attribute để truyền tới jsp
        request.setAttribute("list", attendanceList);
        // Chuyển hướng đến trang jsp để hiển thị danh sách
        request.getRequestDispatcher("AttendanceReport.jsp").forward(request, response);
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
