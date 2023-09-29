package helpers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import net.minidev.json.JSONObject;

public class DbHandler {

    private static String connectionUrl = "jdbc:sqlserver://localhost:14330;database=Pubs;user=sa;password=PaSSw0rd";

    public static void addNewJobWithName(String jobName){
        try(Connection connect = DriverManager.getConnection(connectionUrl)){
            connect.createStatement().execute("INSERT INTO [Pubs].[dbo].[jobs] (job_desc, min_lvl, max_lvl) VALUES ('"+jobName+"', 80, 120)");
        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    public static JSONObject getMinAndMaxLevelsForJob(String jobName){
        JSONObject json = new JSONObject();

        try(Connection connect = DriverManager.getConnection(connectionUrl)){
            ResultSet rs = connect.createStatement().executeQuery("SELECT * FROM [Pubs].[dbo].[jobs] where job_desc = '"+jobName+"'");
            rs.next();
            json.put("minLvl", rs.getString("min_lvl"));
            json.put("maxLvl", rs.getString("max_lvl"));
        } catch (SQLException e){
            e.printStackTrace();
        }
        return json;
    }

    public static void addNewStoreAndLocation(String storeName, String storeAddress, String city, String state, int zip){
        try(Connection connect = DriverManager.getConnection(connectionUrl)){
            connect.createStatement().execute("INSERT INTO [Pubs].[dbo].[stores] (stor_name, stor_address, city, state, zip) VALUES ('"+storeName+"', '"+storeAddress+"', '"+city+"', '"+state+"', '"+zip+"')");
        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    public static JSONObject getStoreAndLocation(String storeName) {
        JSONObject json = new JSONObject();

        try(Connection connect = DriverManager.getConnection(connectionUrl)){
            ResultSet rs = connect.createStatement().executeQuery("SELECT * FROM [Pubs].[dbo].[stores] where stor_name = '"+storeName+"'");
            rs.next();
            json.put("stor_name", rs.getString("stor_name"));
            json.put("stor_address", rs.getString("stor_address"));
            json.put("city", rs.getString("city"));
            json.put("state", rs.getString("state"));
            json.put("zip", rs.getInt("zip"));

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return json;
    }

    public static void addNewAuthor(int id, String authorFirstName, String authorLastName){
        try(Connection connect = DriverManager.getConnection(connectionUrl)){
            connect.createStatement().execute("INSERT INTO [Pubs].[dbo].[authors] (au_id, au_fname, au_lname) VALUES ('"+id+"', '"+authorFirstName+"', '"+authorLastName+"')");
        } catch (SQLException e){
            e.printStackTrace();
        }
    }

    public static JSONObject getFullNameFromAuthorId(String id) {
        JSONObject json = new JSONObject();

        try (Connection connect = DriverManager.getConnection(connectionUrl)){
            ResultSet rs = connect.createStatement().executeQuery("Select * From [Pubs].[dbo].[authors] where au_id = '"+id+"'");
            rs.next();
            json.put("au_id", rs.getString("au_id"));
            json.put("au_fname", rs.getString("au_fname"));
            json.put("au_lname", rs.getString("au_lname"));
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return json;
    }
    
    
}
