<%@ page import="unoeste.fipp.playmysongs.security.User" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Play My Songs</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<nav class="navbar navbar-expand-md navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"><img style="width: 100px;height: 100px;border-radius: 20px" src="./resources/logo.jpg" alt="Logo"></a>
        <h1 class="text-white">Play My Songs</h1>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <ul class="navbar-nav ms-auto mb-2 mb-md-0">
                <%
                    User user = (User)session.getAttribute("user");
                    if(user != null && user.isAutenticado()) {
                %>
                <li class="nav-item">
                    <a class="nav-link" href="enviamusica.jsp">Enviar Musica</a>
                </li>
                <li class="nav-item">
                    <button class="btn btn-danger" type="button">Logout</button>
                </li>
                <% } else {%>
                <li class="nav-item">
                    <form class="d-flex" method="post" action="./login-servlet">
                        <input class="form-control me-2" type="text" placeholder="Username" id="username" name="username">
                        <input class="form-control me-2" type="password" placeholder="Password" id="pswd" name="pswd">
                        <button class="btn btn-primary" type="submit">Login</button>
                    </form>
                </li>
                <%}%>
            </ul>
        </div>
    </div>
</nav>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
