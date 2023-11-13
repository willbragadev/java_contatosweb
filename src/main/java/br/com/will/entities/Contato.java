package br.com.will.entities;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Contato {
	
	private Integer id;
	private String nome;
	private String email;
	private String telefone;
	private Integer tipo;
	private Date data;
	private Integer usuario_id;
	private Usuario usuario;

}
