
import dal.AccountDAO;
import dal.AttendanceDAO;
import dal.DashboardDAO;
import java.util.List;
import models.AttendanceReport;
import models.Employee;

public class test {

    public static void main(String[] args) {
        AttendanceDAO a = new AttendanceDAO();
        AttendanceReport ar = new AttendanceReport();
        ar = a.getAttendanceReportById(1);
        System.out.println(ar);
    }
}
