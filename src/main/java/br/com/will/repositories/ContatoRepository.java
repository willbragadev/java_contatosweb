package br.com.will.repositories;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

public class ContatoRepository {

	private JdbcTemplate jdbcTemplate;
	
	public ContatoRepository (DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
}
