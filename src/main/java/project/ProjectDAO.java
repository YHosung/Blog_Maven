package project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProjectDAO {
    private final String JDBC_DRIVER = "org.h2.Driver";
    private final String JDBC_URL = "jdbc:h2:tcp://localhost/~/jwbookdb";

    public Connection open() throws SQLException, ClassNotFoundException {
        Class.forName(JDBC_DRIVER);
        return DriverManager.getConnection(JDBC_URL, "jwbook", "1234");
    }

    public void addProject(Project p) throws SQLException, ClassNotFoundException {
        String sql = "INSERT INTO project (title, img, date, content) VALUES (?, ?, CURRENT_TIMESTAMP(), ?)";
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, p.getTitle());
            pstmt.setString(2, p.getImg());
            pstmt.setString(3, p.getContent());
            pstmt.executeUpdate();
        }
    }

    public List<Project> getAll() throws SQLException, ClassNotFoundException {
        String sql = "SELECT aid, title, PARSEDATETIME(LEFT(date, 19), 'yyyy-MM-dd HH:mm:ss') AS cdate FROM project";
        List<Project> projectList = new ArrayList<>();
        
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {
            while (rs.next()) {
                Project p = new Project();
                p.setAid(rs.getInt("aid"));
                p.setTitle(rs.getString("title"));
                p.setDate(rs.getString("cdate"));
                projectList.add(p);
            }
        }
        return projectList;
    }

    public Project getProject(int aid) throws SQLException, ClassNotFoundException {
        String sql = "SELECT aid, title, img, PARSEDATETIME(LEFT(date, 19), 'yyyy-MM-dd HH:mm:ss') AS cdate, content FROM project WHERE aid = ?";
        Project p = new Project();

        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, aid);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    p.setAid(rs.getInt("aid"));
                    p.setTitle(rs.getString("title"));
                    p.setImg(rs.getString("img"));
                    p.setDate(rs.getString("cdate"));
                    p.setContent(rs.getString("content"));
                }
            }
        }
        return p;
    }

    public void edtProject(Project p) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE project SET title = ?, img = ?, content = ? WHERE aid = ?";
        
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, p.getTitle());
            pstmt.setString(2, p.getImg());
            pstmt.setString(3, p.getContent());
            pstmt.setInt(4, p.getAid());
            pstmt.executeUpdate();
        }
    }
    
    public void delProject(int aid) throws SQLException,ClassNotFoundException{
    	
    	String sql="delete from project where aid=?";
    	try(Connection conn= open();
    		PreparedStatement pstmt=conn.prepareStatement(sql)){
    		pstmt.setInt(1, aid);
    		pstmt.executeUpdate();
    	}
    	
    }
    public void updateProject(Project p) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE project SET title = ?, img = ?, content = ?, date = CURRENT_TIMESTAMP() WHERE aid = ?";
        
        try (Connection conn = open();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, p.getTitle());
            pstmt.setString(2, p.getImg());
            pstmt.setString(3, p.getContent());
            pstmt.setInt(4, p.getAid());
            pstmt.executeUpdate();
        }
    }
}
