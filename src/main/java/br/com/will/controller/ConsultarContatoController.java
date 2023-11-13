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
public class ConsultarContatoController {

	@Autowired
	ContatoRepository contatoRepository;

	@RequestMapping(value = "/admin/consultar-contato")

	public ModelAndView consultarContato() {

		ModelAndView modelAndView = new ModelAndView("/admin/consultar-contato");

		return modelAndView;

	}

	@RequestMapping(value = "/admin/consultar-contato-post", method = RequestMethod.POST)
	public ModelAndView consultarContatoPost(HttpServletRequest request) {
	    ModelAndView modelAndView = new ModelAndView("admin/consultar-contato");
	    try {
	        String nome = request.getParameter("nome");
	        
	        UsuarioDTO usuarioDTO = (UsuarioDTO) request.getSession().getAttribute("usuario_auth");
	        
	        List<Contato> contatos = contatoRepository.findAll(nome, usuarioDTO.getId());
	        
	        if (contatos.size() > 0) {
	            modelAndView.addObject("listagem_contatos" , contatos);
	        } else {
	            modelAndView.addObject("mensagem_alerta", "Nenhuma conta encontrada.");
	        }
	        
	    } catch (Exception e) {
	        modelAndView.addObject("mensagem_erro", e.getMessage());
	    }
	    
	    return modelAndView;
	}
}