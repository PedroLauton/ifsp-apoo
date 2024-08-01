package model;

import javax.xml.crypto.Data;

public class Desafio extends ArtefatoInteratividade{
    private String requisitos;
    private String tipo;
    private String titulo;
    private String descricao;
    private Data dataPostagem;

    public Desafio(String tipoArtefato, String tituloArtefato, String descricaoArtefato, String requisitos, String tipo, String titulo, String descricao) {
        super(tipoArtefato, tituloArtefato, descricaoArtefato);
        this.requisitos = requisitos;
        this.tipo = tipo;
        this.titulo = titulo;
        this.descricao = descricao;
    }

    public Desafio(String tipoArtefato, String tituloArtefato, String descricaoArtefato, String requisitos, String tipo, String titulo, String descricao, Data dataPostagem) {
        super(tipoArtefato, tituloArtefato, descricaoArtefato);
        this.requisitos = requisitos;
        this.tipo = tipo;
        this.titulo = titulo;
        this.descricao = descricao;
        this.dataPostagem = dataPostagem;
    }

    public void agendarDataPostagem(Data dataPostagem){
        this.dataPostagem = dataPostagem;
    }
}
