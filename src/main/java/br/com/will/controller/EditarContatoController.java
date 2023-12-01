package br.com.will.controller;

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
public class EditarContatoController {
	
	@Autowired
	ContatoRepository contatoRepository;
	
	@RequestMapping(value = "/admin/editar-contato")
	public ModelAndView editarContato(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("admin/editar-contato");
		
		try {
			
			
			Integer id = Integer.parseInt(request.getParameter("id"));
			
			UsuarioDTO usuarioDTO = (UsuarioDTO)
					request.getSession().getAttribute("usuario_auth");
			
			Contato contato = contatoRepository.findById(id);
			
			if(contato != null) {
				
				modelAndView.addObject("id", contato.getId());
				modelAndView.addObject("nome", contato.getNome());
				modelAndView.addObject("email", contato.getEmail());
				modelAndView.addObject("telefone", contato.getTelefone());
				modelAndView.addObject("tipo", contato.getTipo());
				
			} else {
				modelAndView.setViewName("redirect:/admin/consultar-contato");
			}
			
		} catch (Exception e) {
		modelAndView.addObject("mensagem_erro", e.getMessage());
	}
		
	return modelAndView;
	
	}
	
	@RequestMapping(value = "/admin/editar-contato-post", method = RequestMethod.POST)

	public ModelAndView editarContatoPost(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("admin/dashboard");
		
		try {
			
			Contato contato = new Contato();
			
			contato.setId(Integer.parseInt(request.getParameter("id")));
			contato.setNome(request.getParameter("nome"));
			contato.setEmail(request.getParameter("email"));
			contato.setTelefone(request.getParameter("telefone"));
			contato.setTipo(Integer.parseInt(request.getParameter("tipo")));
			
			contatoRepository.update(contato);
			
			modelAndView.addObject("mensagem_sucesso", "Contato atualizado.");
			
		} catch (Exception e) {
			
			modelAndView.addObject("mensagem_erro", e.getMessage());
			
		}
		
		return modelAndView;		
	}
}
