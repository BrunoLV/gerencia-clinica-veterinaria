package br.com.treinaweb.clinicaveterinaria.services;

import br.com.treinaweb.clinicaveterinaria.modelos.Animal;
import br.com.treinaweb.clinicaveterinaria.modelos.Prontuario;
import br.com.treinaweb.clinicaveterinaria.repositorios.RepositorioProntuario;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProntuarioService {

    @Autowired
    private RepositorioProntuario repositorioProntuario;

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public Prontuario salvar(Prontuario prontuario) {
        Prontuario prontuarioSalvo = this.repositorioProntuario.save(prontuario);
        return prontuarioSalvo;
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public Prontuario obterPorId(Long id) {
        Prontuario prontuario = this.repositorioProntuario.findOne(id);
        return prontuario;
    }

    @Transactional(propagation = Propagation.SUPPORTS, readOnly = true)
    public List<Prontuario> obterTodos() {
        List<Prontuario> prontuarios = this.repositorioProntuario.findAll();
        return prontuarios;
    }

    @Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
    public void excluir(Long id) {
        this.repositorioProntuario.delete(id);
    }

    public List<Prontuario> obterPorObservacao(String observacao) {
        return this.repositorioProntuario.obterPorObservacao(observacao);
    }
}
