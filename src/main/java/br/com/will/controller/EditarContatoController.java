package br.com.will.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EditarContatoController {
	
	@RequestMapping (value = "/admin/editar-contato")
	
	public ModelAndView editarContato() {
		
		ModelAndView modelAndView = new ModelAndView("admin/editar-contato");
		
		return modelAndView;
		
	}

}