package br.com.will.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.will.entities.Usuario;
import br.com.will.helpers.MD5Helper;
import br.com.will.repositories.UsuarioRepository;

@Controller
public class CriarUsuarioController {
	
	@Autowired
	UsuarioRepository usuarioRepository;

	@RequestMapping(value = "/criar-usuario")
	
	public ModelAndView criarUsuario() {
		
		ModelAndView modelAndView = new ModelAndView("criar-usuario");
		
		return modelAndView;
		
	}
	
	@RequestMapping(value = "/criar-usuario-post")
	
	public ModelAndView criarUsuarioPost(HttpServletRequest request) {
		
		ModelAndView modelAndView = new ModelAndView("criar-usuario");
		
		try {
			
			Usuario usuario = new Usuario();
			
			usuario.setNome(request.getParameter("nome"));
			usuario.setEmail(request.getParameter("email"));
			usuario.setSenha(MD5Helper.encrypt(request.getParameter("senha")));
			
			if (usuarioRepository.find(usuario.getEmail()) != null) {
				
				modelAndView.addObject("mensagem_erro", "O e-mail informado já está cadastrado.");
				
			} else {
				
				usuarioRepository.create(usuario);
				
				modelAndView.addObject("mensagem_sucesso", "Usuario cadastrado com sucesso.");
				
			}
			
			
		} catch (Exception e) {
			modelAndView.addObject("mensagem", "Erro na criação do usuário: " + e.getMessage());
		}
		
		return modelAndView;
		
	}
	
	
		
	} 
	
	

