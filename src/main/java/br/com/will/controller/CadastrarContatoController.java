package br.com.will.controller;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.will.dtos.UsuarioDTO;
import br.com.will.entities.Contato;
import br.com.will.entities.Usuario;
import br.com.will.repositories.ContatoRepository;

@Controller
public class CadastrarContatoController {
	
	@Autowired
	ContatoRepository contatoRepository;
	
	@RequestMapping (value = "/admin/cadastrar-contato")
	
	public ModelAndView cadastrarContato() {
		
		ModelAndView modelAndView = new ModelAndView("admin/cadastrar-contato");
	
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/admin/cadastrar-contato-post", method = RequestMethod.POST)
	public ModelAndView cadastrarContatoPost (HttpServletRequest request){
		ModelAndView modelAndView = new ModelAndView("admin/cadastrar-contato");

		try {
			
			Contato contato = new Contato();
			contato.setUsuario(new Usuario());
			
			contato.setNome(request.getParameter("nome"));
			contato.setSobrenome(request.getParameter("sobrenome"));
			contato.setEmail(request.getParameter("email"));
			contato.setTelefone(request.getParameter("telefone"));
			contato.setTipo(Integer.parseInt(request.getParameter("tipo")));
			contato.setAniversario(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("aniversario")));
			contato.setEndereco(request.getParameter("endereco"));
			
			UsuarioDTO usuarioDTO = (UsuarioDTO) request.getSession().getAttribute("usuario_auth");
			
			contato.getUsuario().setId(usuarioDTO.getId());
			
			contatoRepository.create(contato);
			
			modelAndView.addObject("mensagem_sucesso", "Contato cadastrado.");
			
		} catch (Exception e) {
			
			modelAndView.addObject("mensagem_erro", "Erro: " + e.getMessage());
			
		}
		
		
		return modelAndView;
	
	}

}