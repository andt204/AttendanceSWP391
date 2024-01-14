/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.Date;

/**
 *
 * @author NCM
 */
public class Employees {
    private int empId;
    private String empName;
    private String empNumber;
    private String empAddress;
    private String empEmail;
    private boolean empGender;
    private String empImage;
    private Date empBirthdate;
    private Date empHiredate;
    private int empIduser;

    public Employees(int empId, String empName, String empNumber, String empAddress, String empEmail, boolean empGender, String empImage, Date empBirthdate, Date empHiredate, int empIduser) {
        this.empId = empId;
        this.empName = empName;
        this.empNumber = empNumber;
        this.empAddress = empAddress;
        this.empEmail = empEmail;
        this.empGender = empGender;
        this.empImage = empImage;
        this.empBirthdate = empBirthdate;
        this.empHiredate = empHiredate;
        this.empIduser = empIduser;
    }

    public int getEmpId() {
        return empId;
    }

    public void setEmpId(int empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getEmpNumber() {
        return empNumber;
    }

    public void setEmpNumber(String empNumber) {
        this.empNumber = empNumber;
    }

    public String getEmpAddress() {
        return empAddress;
    }

    public void setEmpAddress(String empAddress) {
        this.empAddress = empAddress;
    }

    public String getEmpEmail() {
        return empEmail;
    }

    public void setEmpEmail(String empEmail) {
        this.empEmail = empEmail;
    }

    public boolean isEmpGender() {
        return empGender;
    }

    public void setEmpGender(boolean empGender) {
        this.empGender = empGender;
    }

    public String getEmpImage() {
        return empImage;
    }

    public void setEmpImage(String empImage) {
        this.empImage = empImage;
    }

    public Date getEmpBirthdate() {
        return empBirthdate;
    }

    public void setEmpBirthdate(Date empBirthdate) {
        this.empBirthdate = empBirthdate;
    }

    public Date getEmpHiredate() {
        return empHiredate;
    }

    public void setEmpHiredate(Date empHiredate) {
        this.empHiredate = empHiredate;
    }

    public int getEmpIduser() {
        return empIduser;
    }

    public void setEmpIduser(int empIduser) {
        this.empIduser = empIduser;
    }
    
    
}
