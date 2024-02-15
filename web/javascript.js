// script.js

     function showPageContent(pageUrl) {
            // Limpa o conteúdo atual
            document.getElementById("previewContent").innerHTML = "";

            // Use AJAX ou outra técnica para carregar o conteúdo da página
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    console.log('Resposta:', xhr.responseText);
// Adiciona o conteúdo carregado à div "previewContent"
                  document.getElementById("previewContent").innerHTML = xhr.responseText;
                }
            };
            xhr.open("GET", pageUrl, true);
            xhr.send();
        }