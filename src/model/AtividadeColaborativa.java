package model;

import javax.xml.crypto.Data;

public class AtividadeColaborativa extends ArtefatoInteratividade {
    private String requisitos;
    private String entregaveis;
    private String tipo;
    private String titulo;
    private String descricao;
    private Data dataPostagem;

    public AtividadeColaborativa(String tipoArtefato, String tituloArtefato, String descricaoArtefato, String requisitos, String entregaveis, String tipo, String titulo, String descricao) {
        super(tipoArtefato, tituloArtefato, descricaoArtefato);
        this.requisitos = requisitos;
        this.entregaveis = entregaveis;
        this.tipo = tipo;
        this.titulo = titulo;
        this.descricao = descricao;
    }

    public AtividadeColaborativa(String tipoArtefato, String tituloArtefato, String descricaoArtefato, String requisitos, String entregaveis, String tipo, String titulo, String descricao, Data dataPostagem) {
        super(tipoArtefato, tituloArtefato, descricaoArtefato);
        this.requisitos = requisitos;
        this.entregaveis = entregaveis;
        this.tipo = tipo;
        this.titulo = titulo;
        this.descricao = descricao;
        this.dataPostagem = dataPostagem;
    }

    public void agendarDataPostagem(Data dataPostagem){
        this.dataPostagem = dataPostagem;
    }
}
