<%@ page import="unoeste.fipp.playmysongs.PesquisarServlet" %>
<%@ page import="java.io.File" %>
<%@ page import="unoeste.fipp.playmysongs.Pesquisar" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <%!
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
            return absolutePath.substring(i+1);
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
    <form class="row g-3" style="margin-left: 20%" method="get" action="./pesquisar-servlet">
        <div class="col-auto" style="display: flex">
            <input type="text" class="form-control"  style="width: 1000px" id="MusicName" name="MusicName" placeholder="Musica...">
            <input style="background: aquamarine;width:100px" type="submit" class="form-control" value="pesquisar">
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
                        if(file.isFile() && formatMusic(file.getAbsolutePath()).equals(p.getNome())){
                            out.print("<div class=\"row justify-content-center\">" +
                                    "<audio controls class=\"col-md-6\">   " +
                                    "<source src=\"../"+file.getAbsolutePath()+"\" type=\"audio/mpeg\">" +
                                    "</audio>" +
                                    "<br>" +
                                    "<p style=\"text-align:center;\">"+formatMusic(file.getAbsolutePath())+"</p> </div>");
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