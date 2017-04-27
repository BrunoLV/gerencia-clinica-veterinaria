package br.com.treinaweb.clinicaveterinaria.repositorios;

import br.com.treinaweb.clinicaveterinaria.modelos.Animal;
import br.com.treinaweb.clinicaveterinaria.modelos.Prontuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface RepositorioProntuario extends JpaRepository<Prontuario, Long> {

    @Query("select p from Prontuario p where p.observacao like %:observacao%")
    List<Prontuario> obterPorObservacao(@Param("observacao") String observacao);

}
