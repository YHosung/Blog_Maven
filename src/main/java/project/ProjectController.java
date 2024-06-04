package project;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.io.IOException;
import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

/**
 * Servlet implementation class ProjectController
 */
@WebServlet("/project.nhn")
@MultipartConfig(maxFileSize = Long.MAX_VALUE, location = "c:/Temp/img")
public class ProjectController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ProjectDAO dao;
    private ServletContext ctx;

    private final String START_PAGE = "project/projectList.jsp";

    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        dao = new ProjectDAO();
        ctx = getServletContext();
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String action = request.getParameter("action");

        Method m;
        String view = null;

        if (action == null) action = "listProject";

        try {
            m = this.getClass().getMethod(action, HttpServletRequest.class);
            view = (String) m.invoke(this, request);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
            ctx.log("요청 action 없음!");
            request.setAttribute("error", "action 파라미터가 잘못 되었습니다!");
            view = START_PAGE;
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (view != null && view.startsWith("redirect:/")) {
            String rview = view.substring("redirect:/".length());
            response.sendRedirect(rview);
        } else {
            if (view == null) {
                view = START_PAGE;  // 기본 페이지 설정
            }
            request.getRequestDispatcher(view).forward(request, response);
        }
    }

    public String listProject(HttpServletRequest request) {
        List<Project> list;

        try {
            list = dao.getAll();
            request.setAttribute("projectlist", list);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            ctx.log("블로그 목록 생성 과정에서 문제 발생!");
            request.setAttribute("error", "블로그 목록이 정상적으로 처리되지 않았습니다.");
        }
        return "project/projectList.jsp";
    }

    public String addProject(HttpServletRequest request) {
        Project p = new Project();

        try {
            Part part = request.getPart("file");
            String fileName = getFilename(part);

            if (fileName != null && !fileName.isEmpty()) {
                part.write(fileName);
            }
            BeanUtils.populate(p, request.getParameterMap());
            p.setImg(fileName);
            dao.addProject(p);
        } catch (Exception e) {
            e.printStackTrace();
            ctx.log("블로그 추가 과정에서 문제 발생!!");
            request.setAttribute("error", "블로그가 정상적으로 등록되지 않았습니다.");
            return listProject(request);
        }
        return "redirect:/project.nhn?action=listProject";
    }

    private String getFilename(Part part) {
        String fileName = null;

        String header = part.getHeader("content-disposition");
        if (header != null) {
            for (String content : header.split(";")) {
                if (content.trim().startsWith("filename")) {
                    fileName = content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
                    break;
                }
            }
        }
        return fileName;
    }

    public String edtProject(HttpServletRequest request) {
        int aid = Integer.parseInt(request.getParameter("aid"));

        try {
            Project project = dao.getProject(aid);
            request.setAttribute("project", project);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            ctx.log("블로그 수정 과정에서 문제 발생!");
            request.setAttribute("error", "프로젝트를 불러오는데 실패했습니다.");
            return listProject(request);
        }
        return "project/projectEdit.jsp";
    }
    
    public String updateProject(HttpServletRequest request) {
        Project p = new Project();

        try {
            int aid = Integer.parseInt(request.getParameter("aid"));
            Part part = request.getPart("file");
            String fileName = getFilename(part);

            if (fileName != null && !fileName.isEmpty()) {
                part.write(fileName);
            }

            BeanUtils.populate(p, request.getParameterMap());
            p.setImg(fileName);
            p.setAid(aid); // 수정할 프로젝트의 ID 설정

            dao.updateProject(p);
        } catch (Exception e) {
            e.printStackTrace();
            ctx.log("블로그 업데이트 과정에서 문제 발생!!");
            request.setAttribute("error", "블로그가 정상적으로 업데이트되지 않았습니다.");
            return listProject(request);
        }
        return "redirect:/project.nhn?action=listProject";
    }
    
    public String getProject(HttpServletRequest request) {
    	
    	int aid=Integer.parseInt(request.getParameter("aid"));
    	
    	Project p;
    	try {
    		p=dao.getProject(aid);
    		request.setAttribute("project", p);
    	}catch(SQLException e) {
    		e.printStackTrace();
    		ctx.log("블로그를 가져오는 과정에서 문제 발생!!");
    		request.setAttribute("error","뉴스를 정상적으로 가져오지 못했습니다!!");
    	}catch (ClassNotFoundException ex) {
            ex.printStackTrace();
            ctx.log("클래스를 찾을 수 없습니다!!");
            request.setAttribute("error", "필요한 클래스를 찾을 수 없습니다!!");
        }

    	
    	return "project/projectView.jsp";
    }
    
    public String deleteProject(HttpServletRequest request) {
    	int aid=Integer.parseInt(request.getParameter("aid"));
    	try {
    		dao.delProject(aid);
    	} catch (Exception e) {
			e.printStackTrace();
		}
    	return "redirect:/project.nhn?action=listProject";
    }
}

