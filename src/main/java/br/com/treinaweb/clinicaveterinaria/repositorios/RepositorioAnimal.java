package br.com.treinaweb.clinicaveterinaria.repositorios;

import br.com.treinaweb.clinicaveterinaria.modelos.Animal;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface RepositorioAnimal extends JpaRepository<Animal, Long> {
    @Query("select a from Animal a where a.nome like %:nome%")
    List<Animal> findByNome(@Param("nome") String nome);
}
