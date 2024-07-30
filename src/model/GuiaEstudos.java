package model;

import javax.xml.crypto.Data;

public class GuiaEstudos {
    private String titulo;
    private Data dataInicio;
    private Data dataFim;
    private String ramo;
    private Materia materia;

    public GuiaEstudos(String titulo, Data dataInicio, Data dataFim, String ramo, Materia materia) {
        this.titulo = titulo;
        this.dataInicio = dataInicio;
        this.dataFim = dataFim;
        this.ramo = ramo;
        this.materia = materia;
    }

    public String getTituloGuia() {
        return titulo;
    }

    public void atualizarGuia(String titulo, Data dataInicio, Data dataFim, String ramo){
        this.titulo = titulo;
        this.dataInicio = dataInicio;
        this.dataFim = dataFim;
        this.ramo = ramo;
    }

    public void deletarGuia(){
        //Não entendi como fazer;
    }

}
