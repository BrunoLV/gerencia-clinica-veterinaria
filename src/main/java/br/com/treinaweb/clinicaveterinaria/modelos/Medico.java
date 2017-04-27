package br.com.treinaweb.clinicaveterinaria.modelos;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tbl_medico")
public class Medico implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_medico")
    private Long id;

    @Column(name = "nome_medico", length = 150, nullable = false)
    private String nome;

    @Column(name = "especialidade_medico", length = 150, nullable = false)
    private String especialidade;

    @Column(name = "ncrv_medico", nullable = false)
    private Integer numeroConselhoRegionalVeterinaria;

    public Medico() {
        super();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEspecialidade() {
        return especialidade;
    }

    public void setEspecialidade(String especialidade) {
        this.especialidade = especialidade;
    }

    public Integer getNumeroConselhoRegionalVeterinaria() {
        return numeroConselhoRegionalVeterinaria;
    }

    public void setNumeroConselhoRegionalVeterinaria(Integer numeroConselhoRegionalVeterinaria) {
        this.numeroConselhoRegionalVeterinaria = numeroConselhoRegionalVeterinaria;
    }

}
