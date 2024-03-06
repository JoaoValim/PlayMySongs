package unoeste.fipp.playmysongs;

public class Pesquisar {
    private String nome;
    private char escolha;

    public Pesquisar(String nome,char escolha) {
        this.nome = nome;
        this.escolha = escolha;
    }

    public String getNome() {
        return nome;
    }
    public char getEscolha(){return escolha;}
}
