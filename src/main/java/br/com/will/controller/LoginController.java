package br.com.will.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.will.dtos.UsuarioDTO;
import br.com.will.entities.Usuario;
import br.com.will.helpers.MD5Helper;
import br.com.will.repositories.UsuarioRepository;

@Controller
public class LoginController {

	@Autowired
	UsuarioRepository usuarioRepository;

	@RequestMapping(value = "/")
	public ModelAndView login() {

		ModelAndView modelAndView = new ModelAndView("login");

		return modelAndView;

	}

	@RequestMapping(value = "/login-post", method = RequestMethod.POST)

	public ModelAndView loginPost(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView("login");

		try {

			String email = request.getParameter("email");
			String senha = MD5Helper.encrypt(request.getParameter("senha"));

			Usuario usuario = usuarioRepository.find(email, senha);

			if (usuario != null) {

				UsuarioDTO dto = new UsuarioDTO();

				dto.setId(usuario.getId());
				dto.setNome(usuario.getNome());
				dto.setEmail(usuario.getEmail());
				dto.setDataHoraAcesso(new Date());

				request.getSession().setAttribute("usuario_auth", dto);

				modelAndView.setViewName("redirect:/admin/dashboard");

			} else {
				modelAndView.addObject("mensagem_erro", "Usuario inválido.");
			}

		} catch (Exception e) {
			modelAndView.addObject("mensagem_erro", e.getMessage());
		}

		return modelAndView;

	}
}
