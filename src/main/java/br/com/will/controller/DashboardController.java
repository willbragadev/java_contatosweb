package br.com.will.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.will.dtos.UsuarioDTO;
import br.com.will.entities.Contato;
import br.com.will.repositories.ContatoRepository;

@Controller
public class DashboardController {

	@Autowired
	ContatoRepository contatoRepository;

	@RequestMapping(value = "/admin/dashboard" , method = RequestMethod.GET)

	public ModelAndView consultarContato(HttpServletRequest request) {
	    ModelAndView modelAndView = new ModelAndView("admin/dashboard");

		try {
			
			UsuarioDTO usuarioDTO = (UsuarioDTO)
					request.getSession().getAttribute("usuario_auth");
			
	        List<Contato> contatos = contatoRepository.findAllById(usuarioDTO.getId());
			
	        if (!contatos.isEmpty()) {
				
	            modelAndView.addObject("listagem_contatos" , contatos);

				
			} else {
				
				 modelAndView.addObject("mensagem_erro" , "NENHUMA CONTA ENCONTRADA.");
				 
			}
			
		} catch (Exception e) {
		modelAndView.addObject("mensagem_erro", e.getMessage());
	}
		
	return modelAndView;
	
	}
}