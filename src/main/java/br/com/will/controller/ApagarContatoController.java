package br.com.will.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.will.dtos.UsuarioDTO;
import br.com.will.entities.Contato;
import br.com.will.repositories.ContatoRepository;

@Controller
public class ApagarContatoController {
	
	@Autowired
	ContatoRepository contatoRepository;
	
	@RequestMapping(value = "/admin/apagar-contato")
	public ModelAndView apagarContato(HttpServletRequest request) throws Exception {
		
		ModelAndView modelAndView = new ModelAndView("redirect:/admin/dashboard");
		
		try {
			
			Integer id = Integer.parseInt(request.getParameter("id"));
			
			UsuarioDTO usuarioDTO = (UsuarioDTO) request.getSession().getAttribute("usuario_auth");
			
			Contato contato = contatoRepository.findById(id);
			
			if(contato != null) {
				
				contatoRepository.delete(id);
				
				modelAndView.addObject("mensagem_sucesso","Contato apagado com sucesso.");
				
			}
			
		} catch (Exception e) {
			modelAndView.addObject("mensagem_erro", e.getMessage());
		}
		
		return modelAndView;
		
	}
	
}
