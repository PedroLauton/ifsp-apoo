package model;

import java.util.ArrayList;
import java.util.List;

public class Professor {
    private String especialidade;
    private Integer matricula;
    private String nome;
    private String cpf;
    private String rg;
    private String email;
    private String telefone;
    private String endereco;
    private List<Materia> materiasProfessor;

    public Professor(String especialidadeProfessor, Integer matriculaProfessor, String nomeProfessor, String cpfProfessor, String rgProfessor, String emailProfessor, String telefoneProfessor, String enderecoProfessor) {
        this.especialidade = especialidadeProfessor;
        this.matricula = matriculaProfessor;
        this.nome = nomeProfessor;
        this.cpf = cpfProfessor;
        this.rg = rgProfessor;
        this.email = emailProfessor;
        this.telefone = telefoneProfessor;
        this.endereco = enderecoProfessor;
        this.materiasProfessor = new ArrayList<>();
    }

    public String getCpf() {
        return cpf;
    }

    public void adicionarMateria(Materia materia){
        if (materia == null) {
            throw new IllegalArgumentException("Matéria está vazia.");
        }
        this.materiasProfessor.add(materia);
    }

    public boolean removerMateria(String nomeMateria) {
        if (nomeMateria == null || nomeMateria.isEmpty()) {
            throw new IllegalArgumentException("O nome da matéria não pode ser nulo ou vazio.");
        }

        for (int i = 0; i < this.materiasProfessor.size(); i++) {
            Materia dadosMateria = this.materiasProfessor.get(i);
            if (dadosMateria.getNomeMateria().equals(nomeMateria)) {
                materiasProfessor.remove(i);
                return true;
            }
        }
        return false;
    }

    public void alterarDados(String email, String telefone, String endereco, String especialidade){
        this.endereco = endereco;
        this.email = email;
        this.telefone = telefone;
    }

}
