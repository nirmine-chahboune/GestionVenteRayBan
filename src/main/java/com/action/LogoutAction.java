package com.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.interceptor.SessionAware;
import java.util.Map;



import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class LogoutAction extends ActionSupport {
    public String execute() {
        ServletActionContext.getRequest().getSession().invalidate();
        return "redirect";
    }
}

