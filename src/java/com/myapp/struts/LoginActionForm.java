/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.myapp.struts;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author Dell
 */
public class LoginActionForm extends org.apache.struts.action.ActionForm {
    
    private String email;
    private String pwd;
    private String errorMessage;
    /**
     * @return
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param string
     */
    public void setEmail(String string) {
        email = string;
    }

    /**
     * @return
     */
    public String getPwd() {
        return pwd;
    }

    /**
     * @param i
     */
    public void setPwd(String i) {
        pwd = i;
    }

    /**
     *
     */
    
    public LoginActionForm() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * This is the action called from the Struts framework.
     *
     * @param mapping The ActionMapping used to select this instance.
     * @param request The HTTP Request we are processing.
     * @return
     */
    @Override
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        ActionErrors errors = new ActionErrors();
        if (getEmail() == null || getEmail().isEmpty()) {
            errors.add("email", new ActionMessage("error.email.required"));
        }

        if (getPwd() == null || getPwd().isEmpty()) {
            errors.add("pass", new ActionMessage("error.pass.required"));
        }

        return errors;
    }
    @Override
    public void reset(ActionMapping mapping, HttpServletRequest request){
        setEmail("");
        setPwd("");
        super.reset(mapping, request);
    }

}
