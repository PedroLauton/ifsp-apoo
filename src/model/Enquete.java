package model;

import javax.xml.crypto.Data;

public class Enquete extends ArtefatoInteratividade{
    private String opcoes;
    private String resposta;
    private String tipo;
    private String descricao;
    private String titulo;
    private Data dataPostagem;

    public Enquete(String tipoArtefato, String tituloArtefato, String descricaoArtefato, String opcoes, String resposta, String tipo, String descricao, String titulo) {
        super(tipoArtefato, tituloArtefato, descricaoArtefato);
        this.opcoes = opcoes;
        this.resposta = resposta;
        this.tipo = tipo;
        this.descricao = descricao;
        this.titulo = titulo;
    }

    public Enquete(String tipoArtefato, String tituloArtefato, String descricaoArtefato, String opcoes, String resposta, String tipo, String descricao, String titulo, Data dataPostagem) {
        super(tipoArtefato, tituloArtefato, descricaoArtefato);
        this.opcoes = opcoes;
        this.resposta = resposta;
        this.tipo = tipo;
        this.descricao = descricao;
        this.titulo = titulo;
        this.dataPostagem = dataPostagem;
    }

    public void agendarDataPostagem(Data dataPostagem){
        this.dataPostagem = dataPostagem;
    }
}
