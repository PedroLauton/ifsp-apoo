package model;

import javax.xml.crypto.Data;

public class Pergunta extends ArtefatoInteratividade{
    private String opcoes;
    private String resposta;
    private String tipo;
    private String titulo;
    private String descricao;
    private Data dataPostagem;

    public Pergunta(String tipoArtefato, String tituloArtefato, String descricaoArtefato, String opcoes, String resposta, String tipo, String titulo, String descricao) {
        super(tipoArtefato, tituloArtefato, descricaoArtefato);
        this.opcoes = opcoes;
        this.resposta = resposta;
        this.tipo = tipo;
        this.titulo = titulo;
        this.descricao = descricao;
    }

    public Pergunta(String tipoArtefato, String tituloArtefato, String descricaoArtefato, String opcoes, String resposta, String tipo, String titulo, String descricao, Data dataPostagem) {
        super(tipoArtefato, tituloArtefato, descricaoArtefato);
        this.opcoes = opcoes;
        this.resposta = resposta;
        this.tipo = tipo;
        this.titulo = titulo;
        this.descricao = descricao;
        this.dataPostagem = dataPostagem;
    }

    public void agendarDataPostagem(Data dataPostagem){
        this.dataPostagem = dataPostagem;
    }
}
