package unoeste.fipp.playmysongs.security;

public class User {
    private boolean autenticado;
    private String nome;
    public User(String nome){
        autenticado = true ;
        this.nome = nome;
    }

    public boolean isAutenticado() {
        return autenticado;
    }

    public String getNome() {
        return nome;
    }
}
