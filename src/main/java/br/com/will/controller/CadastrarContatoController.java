package br.com.will.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CadastrarContatoController {
	
	@RequestMapping (value = "/admin/cadastrar-contato")
	
	public ModelAndView cadastrarContato() {
		
		ModelAndView modelAndView = new ModelAndView("admin/cadastrar-contato");
	
		return modelAndView;
		
	}

}