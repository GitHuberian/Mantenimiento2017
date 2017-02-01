package edu.uag.iidis.scec.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.Globals;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMessage;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import edu.uag.iidis.scec.modelo.User;


public class AuthorizationFilter implements Filter {
	private String[] roleNames;
	private String onErrorUrl;
	
    private Log log = LogFactory.getLog(AuthorizationFilter.class);	
	
	public void init(FilterConfig arg0) throws ServletException {
		
		// inicializacion de lo que se necesite en el filtro
		
		String roles = arg0.getInitParameter("roles"); 
	    if (roles == null || "".equals(roles)) {
	      roleNames = new String[0];
	    }
	    else {
	      roles.trim();
	      roleNames = roles.split(" ");
	    }
	    onErrorUrl = arg0.getInitParameter("onError"); 
	    if (onErrorUrl == null || "".equals(onErrorUrl)) {
	      onErrorUrl = "irLogin.dd"; 
	    }
	}

	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) arg0; 
	    HttpServletResponse res = (HttpServletResponse) arg1;
	    HttpSession session = req.getSession();
	    User user = (User) session.getAttribute("user"); 
	    ActionErrors errors = new ActionErrors();
	    if (user == null) {
	      errors.add(ActionErrors.GLOBAL_MESSAGE,
	        new ActionMessage("error.authentication.required"));
			log.debug(">En el filtro - error.authentication.required" );
	    }
	    else {
	      boolean hasRole = false;
			if (log.isDebugEnabled()) {
				log.debug(">En el filtro " + user.getUserid());
			}

			if (!"".equals(user.getUserid())) {
					hasRole = true;
					log.debug(">En el filtro - UserID " + user.getUserid());
			}
			if (!hasRole) {
				log.debug(">En el filtro - Sin Rol" + user.getUserid());
				errors.add(ActionErrors.GLOBAL_MESSAGE,
				new ActionMessage("error.authorization.nopermission", user.getUsername()));
			}
		}
	    if (errors.isEmpty()) {
	    	arg2.doFilter(arg0, arg1);
	    }
	    else {
			log.debug(">En el filtro - Con Errores");
			req.setAttribute(Globals.ERROR_KEY, errors); 
	      req.getRequestDispatcher(onErrorUrl).forward(req, res);
	    }
	}	
	
	public void destroy() {	}
}
