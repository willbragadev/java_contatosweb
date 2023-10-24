package br.com.will.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ConsultarContatoController {
	
	@RequestMapping (value = "/admin/consultar-contato")
	
	public ModelAndView consultarContato() {
		
		ModelAndView modelAndView = new ModelAndView("/admin/consultar-contato");
		
		return modelAndView;
		
	}

}