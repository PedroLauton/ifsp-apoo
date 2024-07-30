package model;

import java.util.ArrayList;
import java.util.List;

public class Materia {
    private String nome;
    private String sigla;
    private List<Professor> professores;
    private List<GuiaEstudos> guiaEstudos;
    private boolean estadoMateria;

    public Materia(String nome, String sigla) {
        this.nome = nome;
        this.sigla = sigla;
        this.estadoMateria = true;
        this.professores = new ArrayList<>();
        this.guiaEstudos = new ArrayList<>();
    }

    public String getNomeMateria() {
        return nome;
    }

    public void alterarEstadoMateria() {
        this.estadoMateria = !this.estadoMateria;
    }

    public void adicionarProfessor(Professor professor) {
        if (professor == null) {
            throw new IllegalArgumentException("Professor está vazio.");
        }
        this.professores.add(professor);
    }

    public boolean removerProfessor(String cpf) {
        if (cpf == null || cpf.isEmpty()) {
            throw new IllegalArgumentException("CPF não pode ser nulo ou vazio.");
        }

        for (int i = 0; i < this.professores.size(); i++) {
            Professor dadosProfessor = this.professores.get(i);
            if (dadosProfessor.getCpf().equals(cpf)) {
                professores.remove(i);
                return true;
            }
        }
        return false;
    }

    public void adicionarGuiaEstudos(GuiaEstudos guiaEstudos) {
        if (guiaEstudos == null) {
            throw new IllegalArgumentException("Guia de estudos está vazio.");
        }
        this.guiaEstudos.add(guiaEstudos);
    }

    public boolean removerGuiaEstudos(String titulo) {
        if (titulo == null || titulo.isEmpty()) {
            throw new IllegalArgumentException("O título não pode ser nulo ou vazio.");
        }

        for (int i = 0; i < this.guiaEstudos.size(); i++) {
            GuiaEstudos dadosGuiaEstudos = this.guiaEstudos.get(i);
            if (dadosGuiaEstudos.getTituloGuia().equals(titulo)) {
                this.guiaEstudos.remove(i);
                return true;
            }
        }
        return false;
    }
}
