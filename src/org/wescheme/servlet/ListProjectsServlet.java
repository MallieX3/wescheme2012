package org.wescheme.servlet;

import java.io.IOException;
import java.util.List;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.wescheme.project.Program;
import org.wescheme.project.ProgramDigest;
import org.wescheme.user.Session;
import org.wescheme.user.SessionManager;
import org.wescheme.user.UnauthorizedUserException;
import org.wescheme.util.PMF;

public class ListProjectsServlet extends HttpServlet {
	
	private static final long serialVersionUID = 6291188410939739681L;

	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		Session userSession;
		SessionManager sm = new SessionManager();
	
		try {
		
			userSession = sm.authenticate(req, resp);
		
			if( userSession == null ){
				throw new UnauthorizedUserException();
			}
			
			Query query = pm.newQuery(Program.class);
			query.setFilter("ownerName_ == ownerParam");
			query.declareParameters("String ownerParam");
			
			try {
				@SuppressWarnings({ "unchecked" })
				List<Program> pl = (List<Program>) query.execute(userSession.getName());
				
				for( Program d : pl ){
					resp.getWriter().print((new ProgramDigest(d)).toXML());
				}
				
			} finally {
				query.closeAll();
			}
		
		} catch (IOException e) {
			resp.sendError(500);
			e.printStackTrace();
		} catch (UnauthorizedUserException e) {
			resp.sendError(401);
			e.printStackTrace();
		} finally {
			pm.close();
		}
	}

}
