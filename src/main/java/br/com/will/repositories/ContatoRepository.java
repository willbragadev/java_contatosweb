package br.com.will.repositories;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import br.com.will.entities.Contato;
import br.com.will.entities.Usuario;

public class ContatoRepository {

	private JdbcTemplate jdbcTemplate;

	public ContatoRepository(DataSource dataSource) {
		jdbcTemplate = new JdbcTemplate(dataSource);
	}

	public void create(Contato contato) throws Exception {

		String sql = "insert into contato(nome, sobrenome, email, telefone, tipo, aniversario, endereco, usuario_id) values (?,?,?,?,?,?,?,?)";

		Object[] params = { contato.getNome(), contato.getSobrenome(), contato.getEmail(), contato.getTelefone(),
				contato.getTipo(), contato.getAniversario(), contato.getEndereco(), contato.getUsuario().getId() };

		jdbcTemplate.update(sql, params);

	}

	public void update(Contato contato) throws Exception {
		String sql = "update contato set nome=?, sobrenome=?, email=?, telefone=?, tipo=?, aniversario=?, endereco=? where id=?";

		Object[] params = { contato.getNome(), contato.getSobrenome(), contato.getEmail(), contato.getTelefone(),
				contato.getTipo(), contato.getAniversario(), contato.getEndereco(), contato.getId() };

		jdbcTemplate.update(sql, params);

	}

	public void delete(Integer id) throws Exception {
		String sql = "delete from contato where id=?";
		Object[] params = { id };

		jdbcTemplate.update(sql, params);

	}

	public List<Contato> findAll(String nome, Integer usuario_id) throws Exception {

		String sql = "select * from contato where nome like ? and usuario_id = ?";

		Object[] params = { "%" + nome + "%", usuario_id };

		List<Contato> contatos = jdbcTemplate.query(sql, params, new RowMapper<Contato>() {

			@Override
			public Contato mapRow(ResultSet rs, int rowNum) throws SQLException {
				Contato contato = new Contato();
				contato.setUsuario(new Usuario());
				contato.setId(rs.getInt("id"));
				contato.setNome(rs.getString("nome"));
				contato.setSobrenome(rs.getString("sobrenome"));
				contato.setEmail(rs.getString("email"));
				contato.setTelefone(rs.getString("telefone"));
				contato.setTipo(rs.getInt("tipo"));
				contato.setEndereco(rs.getString("endereco"));

				try {
					contato.setAniversario(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("aniversario")));
				} catch (Exception e) {
					e.printStackTrace();
				}

				contato.getUsuario().setId(rs.getInt("usuario_id"));

				return contato;

			}

		});

		return contatos;

	}

	public Contato findById(Integer id) throws Exception {

		String sql = "select * from contato where id = ?";
		Object[] params = { id };

		List<Contato> contatos = jdbcTemplate.query(sql, params, new RowMapper<Contato>() {

			@Override
			public Contato mapRow(ResultSet rs, int rowNum) throws SQLException {

				Contato contato = new Contato();
				contato.setUsuario(new Usuario());

				contato.setId(rs.getInt("id"));
				contato.setNome(rs.getString("nome"));
				contato.setSobrenome(rs.getString("sobrenome"));
				contato.setEmail(rs.getString("email"));
				contato.setTelefone(rs.getString("telefone"));
				contato.setTipo(rs.getInt("tipo"));
				contato.setEndereco(rs.getString("endereco"));

				try {
					contato.setAniversario(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("aniversario")));
				} catch (Exception e) {
					e.printStackTrace();
				}

				return contato;

			}

		});

		if (contatos.size() == 1) {
			return contatos.get(0);

		} else {

			return null;

		}

	}

	public List<Contato> findAllById(Integer usuario_id) throws Exception {
		String sql = "SELECT * FROM contato WHERE usuario_id = ?";
		Object[] params = { usuario_id };

		List<Contato> contatos = jdbcTemplate.query(sql, params, new RowMapper<Contato>() {
			@Override
			public Contato mapRow(ResultSet rs, int rowNum) throws SQLException {
				Contato contato = new Contato();
				contato.setUsuario(new Usuario());

				contato.setId(rs.getInt("id"));
				contato.setNome(rs.getString("nome"));
				contato.setSobrenome(rs.getString("sobrenome"));
				contato.setEmail(rs.getString("email"));
				contato.setTelefone(rs.getString("telefone"));
				contato.setTipo(rs.getInt("tipo"));
				contato.setEndereco(rs.getString("endereco"));

				try {
					contato.setAniversario(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("aniversario")));
				} catch (Exception e) {
					e.printStackTrace();
				}

				return contato;
			}
		});

		return contatos; 
	}

}
