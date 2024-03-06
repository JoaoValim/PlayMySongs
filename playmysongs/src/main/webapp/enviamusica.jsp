<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Formulário para enviar músicas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="bg-light">
<div class="container mt-5">
    <h1 class="mb-4">Formulário para enviar músicas</h1>
    <form method="POST" action="up-servlet" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="fileMusica" class="form-label">Arquivo:</label>
            <input type="file" class="form-control" name="file" id="fileMusica" accept=".mp3"/>
        </div>
        <div class="mb-3">
            <label for="estilo" class="form-label">Estilo:</label>
            <select class="form-select" id="estilo" name="estilo">
                <option value="axe">Axé</option>
                <option value="blues">Blues</option>
                <option value="bossanova">Bossa Nova</option>
                <option value="classico">Clássico</option>
                <option value="country">Country</option>
                <option value="disco">Disco</option>
                <option value="eletronica">Eletrônica</option>
                <option value="flamenco">Flamenco</option>
                <option value="forro">Forró</option>
                <option value="funk">Funk</option>
                <option value="funkinternacional">Funk Internacional</option>
                <option value="gospel">Gospel</option>
                <option value="gotico">Gótico</option>
                <option value="heavymetal">Heavy Metal</option>
                <option value="hiphoprap">Hip Hop/Rap</option>
                <option value="infantil">Infantil</option>
                <option value="instrumental">Instrumental</option>
                <option value="jpopjrock">J-Pop/J-Rock</option>
                <option value="jazz">Jazz</option>
                <option value="jovemguarda">Jovem Guarda</option>
                <option value="kpop">K-pop</option>
                <option value="mpb">MPB</option>
                <option value="marchashinos">Marchas/Hinos</option>
                <option value="metal">Metal</option>
                <option value="pagode">Pagode</option>
                <option value="piseiro">Piseiro</option>
                <option value="popinternacional">Pop Internacional</option>
                <option value="poprock">Pop Rock</option>
                <option value="punkrock">Punk Rock</option>
                <option value="rnb">R&B</option>
                <option value="reggae">Reggae</option>
                <option value="rock">Rock</option>
                <option value="rockalternativo">Rock Alternativo</option>
                <option value="rockprogressivo">Rock Progressivo</option>
                <option value="rockandroll">Rock and Roll</option>
                <option value="romantico">Romântico</option>
                <option value="salsa">Salsa</option>
                <option value="samba">Samba</option>
                <option value="sertanejo">Sertanejo</option>
                <option value="softrock">Soft Rock</option>
                <option value="tango">Tango</option>
                <option value="tecnopop">Tecnopop</option>
                <option value="trap">Trap</option>
                <option value="velhaguarda">Velha Guarda</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="nomeMusica" class="form-label">Nome:</label>
            <input type="text" class="form-control" id="nomeMusica" name="nomeMusica">
        </div>
        <div class="mb-3">
            <label for="cantor" class="form-label">Cantor:</label>
            <input type="text" class="form-control" id="cantor" name="cantor">
        </div>
        <div class="mb-3">
            <button type="submit" class="btn btn-primary" name="upload" id="upload">Enviar</button>
            <a href="index.jsp" class="btn btn-secondary">Voltar</a>
        </div>
    </form>
</div>
</body>
</html>
