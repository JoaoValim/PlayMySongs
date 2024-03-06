<%@ page import="unoeste.fipp.playmysongs.PesquisarServlet" %>
<%@ page import="java.io.File" %>
<%@ page import="unoeste.fipp.playmysongs.Pesquisar" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script>
    </script>
    <%!
        private boolean select(char i,Object o) {
            Pesquisar p = (Pesquisar) o;
            if(p!=null && p.getEscolha()==i)
                return true;
            return false;
        }

        private String musica(String absolutePath) {
            int i=absolutePath.length()-1;
            while(absolutePath.charAt(i)!='\\')
                i--;
            i--;
            while(absolutePath.charAt(i)!='\\')
                i--;
            return absolutePath.substring(i);
        }

        private String estilo(String musica) {
            int i=0,j=musica.length()-1;
            while(musica.charAt(i)!='_')
                i++;
            while(musica.charAt(j)!='_')
                j--;
            return musica.substring(++i,j);
        }

        private String formatMusic(String absolutePath) {
            int i=absolutePath.length()-1;
            while(absolutePath.charAt(i)!='\\')
                i--;
            return absolutePath.substring(i+1,absolutePath.length()-4);
        }

        private String nome(String musica){
            int i=0;
            while(musica.charAt(i)!='_')
                i++;
            return musica.substring(0,i);
        }

        private String cantor(String musica){
            int i=musica.length()-1;
            while(musica.charAt(i)!='_')
                i--;
            return musica.substring(++i);
        }




    %>
</head>
<body>
    <%@include file="topo.jsp" %>
    <br><br><br><br><br><br><br><br><br>
    <form class="row row-cols-lg-auto g-3 align-items-center" style="margin-left: 40%" method="get" action="./pesquisar-servlet">
        <div class="col-12">
            <div class="input-group">
                <input type="text" class="form-control" id="filtro" name="filtro" placeholder="Palavra-Chave" value="<%=((Pesquisar)session.getAttribute("filtro"))!=null? ((Pesquisar)session.getAttribute("filtro")).getNome():"" %>">
            </div>
        </div>

        <div class="col-12">
            <select class="form-select" id="escolha" name="escolha" >
                <option <%if(select('1',session.getAttribute("filtro")))out.print("selected");%> value="1">Musica</option>
                <option <%if(select('2',session.getAttribute("filtro")))out.print("selected");%> value="2">Artista</option>
                <option <%if(select('3',session.getAttribute("filtro")))out.print("selected");%> value="3">Estilo</option>
            </select>
        </div>

        <div class="col-12">
            <div class="input-group">
                <input type="submit" style="background: cyan" class="form-control" value="pesquisar">
            </div>
        </div>
    </form>

    <div>
        <br><br>
        <h1 style="text-align: center">Lista de Musicas</h1>
        <%
            Pesquisar p =(Pesquisar) session.getAttribute("filtro");
            File pastaMusicas = new File(request.getServletContext().getRealPath("/")+"/musicas");

            if(pastaMusicas.exists()){
                if(p!=null && p.getNome().compareTo("")!=0 ){
                    for (File file : pastaMusicas.listFiles())
                        if(file.isFile()) {
                            if (p.getEscolha() == '1' && p.getNome().compareToIgnoreCase(nome(formatMusic(file.getAbsolutePath())))==0) {
                                out.print("<div class=\"row justify-content-center\">" +
                                        "<audio controls class=\"col-md-6\">   " +
                                        "<source src=\"" + "." + musica(file.getAbsolutePath()) + "\" type=\"audio/mpeg\">" +
                                        "</audio>" +
                                        "<br>" +
                                        "<p style=\"text-align:center;\">" + formatMusic(file.getAbsolutePath()) + "</p> </div>");
                            }
                            else
                            if(p.getEscolha() == '2' && p.getNome().compareToIgnoreCase(cantor(formatMusic(file.getAbsolutePath())))==0){
                                out.print("<div class=\"row justify-content-center\">" +
                                        "<audio controls class=\"col-md-6\">   " +
                                        "<source src=\"" + "." + musica(file.getAbsolutePath()) + "\" type=\"audio/mpeg\">" +
                                        "</audio>" +
                                        "<br>" +
                                        "<p style=\"text-align:center;\">" + formatMusic(file.getAbsolutePath()) + "</p> </div>");
                            }
                            else
                            if(p.getEscolha() == '3' && p.getNome().compareToIgnoreCase(estilo(formatMusic(file.getAbsolutePath())))==0){
                                out.print("<div class=\"row justify-content-center\">" +
                                        "<audio controls class=\"col-md-6\">   " +
                                        "<source src=\"" + "." + musica(file.getAbsolutePath()) + "\" type=\"audio/mpeg\">" +
                                        "</audio>" +
                                        "<br>" +
                                        "<p style=\"text-align:center;\">" + formatMusic(file.getAbsolutePath()) + "</p> </div>");
                            }
                        }
                }else {
                    for (File file : pastaMusicas.listFiles())
                        if(file.isFile()){
                            System.out.println(file.getAbsolutePath());
                            System.out.println(musica(file.getAbsolutePath()));
                            out.print("<div class=\"row justify-content-center\">" +
                                    "<audio controls class=\"col-md-6\">   " +
                                    "<source src=\""+"."+musica(file.getAbsolutePath())+"\" type=\"audio/mpeg\">" +
                                    "</audio>" +
                                    "<br>" +
                                    "<p style=\"text-align:center;\">"+formatMusic(file.getAbsolutePath())+"</p> </div>");
                        }
                }
            }
        %>
    </div>
</body>
</html>