package br.com.treinaweb.clinicaveterinaria.services;

import br.com.treinaweb.clinicaveterinaria.modelos.Animal;
import br.com.treinaweb.clinicaveterinaria.repositorios.RepositorioAnimal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AnimalService {

    @Autowired
    private RepositorioAnimal repositorioAnimal;

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public Animal salvar(Animal animal) {
        Animal animalSalvo = this.repositorioAnimal.save(animal);
        return animalSalvo;
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public Animal obterPorId(Long id) {
        Animal animal = this.repositorioAnimal.findOne(id);
        return animal;
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Animal> obterTodos() {
        List<Animal> animais = this.repositorioAnimal.findAll();
        return animais;
    }

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public void excluir(Long id) {
        this.repositorioAnimal.delete(id);
    }

    public List<Animal> obterPorNome(String nome) {
        return this.repositorioAnimal.findByNome(nome);
    }

}
