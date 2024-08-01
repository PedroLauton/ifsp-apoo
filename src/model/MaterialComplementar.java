package model;

import java.util.List;

public class MaterialComplementar {
    private String materia;
    private String arquivo;
    private String titulo;
    private String miniatura;
    private String descricao;
    private List<GuiaEstudos> guiaEstudos;

    public MaterialComplementar(String materia, String arquivo, String titulo, String miniatura, String descricao) {
        this.materia = materia;
        this.arquivo = arquivo;
        this.titulo = titulo;
        this.miniatura = miniatura;
        this.descricao = descricao;
    }

    public void editarMaterial(String materia, String arquivo, String titulo, String miniatura, String descricao){
        this.materia = materia;
        this.arquivo = arquivo;
        this.titulo = titulo;
        this.miniatura = miniatura;
        this.descricao = descricao;
    }
}
