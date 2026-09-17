import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.CallableStatement;
import java.util.Scanner;

public class App {
public static void main(String[] args) {
String connectionUrl =
"jdbc:sqlserver://cxp-sql-03\\mxg724;"
+ "database=Library;"
+ "user=bookUser;"
+ "password=Database341;"
+ "encrypt=true;"
+ "trustServerCertificate=true;"
+ "loginTimeout=15;";
    try (Connection connection = DriverManager.getConnection(connectionUrl);
         Scanner scanner = new Scanner(System.in);){
        while (true) {
            System.out.println("Menu:");
            System.out.println("1. Insert New Book or Author");
            System.out.println("2. Update Book Status");
            System.out.println("3. Delete Author");
            System.out.println("4. Update Author Name");
            System.out.println("5. Check out book");
            System.out.println("6. Update Member Status");
            System.out.println("7. Exit");
            System.out.print("Enter your choice: ");
            int choice = scanner.nextInt();
            scanner.nextLine(); // Consume the newline character
            switch (choice) {
                case 1:
                    AddBook(connection, scanner);
                    break;
                case 2:
                    UpdateBook(connection, scanner);
                    break;
                case 3:
                    DeleteAuthor(connection, scanner);
                    break;
                 case 4:
                    UpdateName(connection, scanner);
                    break;
                case 5:
                    CheckOutBook(connection, scanner);
                    break;
                case 6:
                    UpdateMember(connection, scanner);
                    break;
                case 7:
                    System.out.println("Exiting...");
                    return;
                default:
                    System.out.println("Invalid choice. Please enter a valid option.");
            } 
            } }catch (SQLException e) {
        e.printStackTrace();
    }
 }
  private static void AddBook(Connection connection, Scanner scanner) throws SQLException {
    System.out.println("Performing Insert...");
    // Get user input for insertion
    System.out.print("Enter book name: ");
    String bookName = scanner.nextLine();
    System.out.print("Enter author name: ");
    String authorName = scanner.nextLine();
    System.out.print("Enter genre: ");
    String genre = scanner.nextLine();
    String sql = "{call dbo.InsertNewBookProcedure3(?,?,?)}";
try(CallableStatement callableStatement = connection.prepareCall(sql);){
    callableStatement.setString(1, bookName);
    callableStatement.setString(2, authorName);
    callableStatement.setString(3, genre);
    callableStatement.execute();
    ResultSet rs = callableStatement.getResultSet();
 
   if (rs != null) {
    System.out.println("Books written by " + authorName + ":");
    while (rs.next()) {
        String bookTitle = rs.getString("BookName");
        System.out.println(bookTitle);
    }
    rs.close();
}else {
    System.out.println("No books found for " + authorName);
}
} catch (SQLException e) {
   e.printStackTrace();
}
}
    
private static void UpdateBook(Connection connection, Scanner scanner) throws SQLException {
    System.out.println("Updating Book Status...");
    System.out.print("Enter Member ID: ");
    int memberID = scanner.nextInt();
    System.out.print("Enter Copies ID: ");
    int copiesID = scanner.nextInt();

    String sqlOut = "{call dbo.UpdateBookStatusToReturned(?,?)}";
    try (CallableStatement stmt = connection.prepareCall(sqlOut)) {
        stmt.setInt(1, memberID);
        stmt.setInt(2, copiesID);
        boolean hasResults = stmt.execute();
        if (!hasResults) {
            System.out.println("Book status updated to 'returned' successfully.");
            
        } else {
            System.out.println("Unexpected result set returned.");
        }
    }

}
private static void DeleteAuthor(Connection connection, Scanner scanner) throws SQLException {
    
    System.out.println("Deleting Author...");
    System.out.print("Enter Author Name to Delete: ");
    String authorToDelete = scanner.nextLine();

    String sqlDeleteAuthor = "{call dbo.RemoveAuthorAndBooks(?)}";
    try (CallableStatement callableStatement = connection.prepareCall(sqlDeleteAuthor)) {
        callableStatement.setString(1, authorToDelete);
        //boolean hasResults = 
        callableStatement.execute();
        ResultSet rs = callableStatement.getResultSet();
        if (rs != null) {
           System.out.println("Deleted Books written by " + authorToDelete + ":");
        while (rs.next()) {
        String bookTitle = rs.getString("name");
        System.out.println(bookTitle);
         }
         rs.close();
            }else {
                System.out.println("No books found for " + authorToDelete);
            }
     }

    }
     private static void UpdateName(Connection connection, Scanner scanner) throws SQLException {
        System.out.println("Updating Author Name...");
        System.out.print("Enter old author name: ");
        String oldAuthorName = scanner.nextLine();
        System.out.print("Enter new author name: ");
        String newAuthorName = scanner.nextLine();
        String sqlUp = "{call dbo.ReplaceAuthorName2(?,?)}";
     try (CallableStatement callableStatement = connection.prepareCall(sqlUp)) {
        callableStatement.setString(1, oldAuthorName);
        callableStatement.setString(2, newAuthorName);
        callableStatement.execute();
        System.out.println("Stored procedure executed successfully.");
        callableStatement.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
     }

private static void CheckOutBook(Connection connection, Scanner scanner) throws SQLException {
     System.out.println("Check a book...");
        System.out.print("what is your member ID ");
        Integer insertMemberID = scanner.nextInt();
        System.out.print("What is the book copies ID ");
        Integer insertBookCopiesID = scanner.nextInt();
        scanner.nextLine();
        System.out.print("Check out date ");
        String checkoutDate = scanner.nextLine();
        System.out.print("Return Date ");
        String returnedDate = scanner.nextLine();
        System.out.print("Check out Status ");
        String checkoutStatus = scanner.nextLine();
        String sqlCheck = "{call dbo.checkoutBook3(?, ?, ?, ?, ?)}";
        try(CallableStatement callableStatement = connection.prepareCall(sqlCheck)){
            callableStatement.setInt(1, insertMemberID);
            callableStatement.setInt(2, insertBookCopiesID);
            callableStatement.setDate(3, java.sql.Date.valueOf(checkoutDate));
            callableStatement.setDate(4, java.sql.Date.valueOf(returnedDate));
            callableStatement.setString(5, checkoutStatus);
            boolean hasResults = callableStatement.execute();
            if (!hasResults) {
                System.out.println("Book checked out successfully.");
            } else {
                System.out.println("Unexpected result set returned.");
            }
            callableStatement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
}


 private static void UpdateMember(Connection connection, Scanner scanner) throws SQLException {
     System.out.println("Update Status...");
        System.out.print("what is your member ID ");
        Integer insertMemID = scanner.nextInt();
        scanner.nextLine();
        System.out.print("Status Change:");
        String statusChange = scanner.nextLine();
        String sqlMember = "{call dbo.updateMembership(?, ?)}";
        try(CallableStatement callableStatement = connection.prepareCall(sqlMember)){
            callableStatement.setInt(1, insertMemID);
            callableStatement.setString(2, statusChange);
            boolean hasResults = callableStatement.execute();
            if (!hasResults) {
                System.out.println("Change was sucessful.");
            } else {
                System.out.println("Unexpected result set returned.");
            }
            callableStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
     

 }
}



