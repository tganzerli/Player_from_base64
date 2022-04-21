# Resumo do erro:

Ao tentar rodar um vídeo que esta localizado no diretorio do aplicativo. Recebo os seguintes erro:
- Accessing hidden method Landroid/media/AudioTrack;->getLatency()I (greylist, reflection, allowed)
- Access denied finding property "vendor.display-size"
- registerTetheringEventCallback:com.example.errovideo

## Como estruturei este exemplo

- page1.dart => Apenas uma pagina para inicialização, nela contém apenas um botão para inicializar o exemplo
- player_page.dar => Pagina contendo o video player.
- video_base64.dart => Vídeo codificado em base64, para testar a criação do video no diretório do aplicativo.
- core_store.dart => Contem a função que descodifica o video e cria o diretório / arquivo mp4. 
