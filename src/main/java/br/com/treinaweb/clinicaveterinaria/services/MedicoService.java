package br.com.treinaweb.clinicaveterinaria.services;

import br.com.treinaweb.clinicaveterinaria.modelos.Medico;
import br.com.treinaweb.clinicaveterinaria.repositorios.RepositorioMedico;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MedicoService {

    @Autowired
    private RepositorioMedico repositorioMedico;

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public Medico salvar(Medico medico) {
        Medico medicoSalvo = this.repositorioMedico.save(medico);
        return medicoSalvo;
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public Medico obterPorId(Long id) {
        Medico medico = this.repositorioMedico.findOne(id);
        return medico;
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Medico> obterTodos() {
        List<Medico> medicos = this.repositorioMedico.findAll();
        return medicos;
    }

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public void excluir(Long id) {
        this.repositorioMedico.delete(id);
    }

    public List<Medico> obterPorNome(String nome) {
        return this.repositorioMedico.obterPorNome(nome);
    }
}