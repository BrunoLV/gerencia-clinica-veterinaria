package br.com.treinaweb.clinicaveterinaria.modelos;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tbl_animal")
public class Animal implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_animal")
    private Long id;

    @Column(name = "nome_animal", length = 150, nullable = false)
    private String nome;

    @Column(name = "idade_animal")
    private Integer idade;

    @Column(name = "raca_animal", length = 150, nullable = false)
    private String raca;

    @Column(name = "nome_dono_animal", length = 150, nullable = false)
    private String nomeDono;

    public Animal() {
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

    public Integer getIdade() {
        return idade;
    }

    public void setIdade(Integer idade) {
        this.idade = idade;
    }

    public String getRaca() {
        return raca;
    }

    public void setRaca(String raca) {
        this.raca = raca;
    }

    public String getNomeDono() {
        return nomeDono;
    }

    public void setNomeDono(String nomeDono) {
        this.nomeDono = nomeDono;
    }

}
