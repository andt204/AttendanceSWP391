
import dal.AccountDAO;
import dal.DashboardDAO;
import java.util.List;
import models.Employee;

public class test {

    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        String password = "andepzai";
        String username = "andepzai";
        int roleId = 2;
        dao.updateUser(1, username, password, roleId);
    }
}
