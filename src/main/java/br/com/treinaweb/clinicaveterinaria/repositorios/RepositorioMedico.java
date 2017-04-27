package br.com.treinaweb.clinicaveterinaria.repositorios;

import br.com.treinaweb.clinicaveterinaria.modelos.Animal;
import br.com.treinaweb.clinicaveterinaria.modelos.Medico;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface RepositorioMedico extends JpaRepository<Medico, Long> {

    @Query("select m from Medico m where m.nome like %:nome%")
    List<Medico> obterPorNome(@Param("nome") String nome);

}
