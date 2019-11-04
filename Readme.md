# Para realizar a geração da imagem do docker utilizar o comando:
`` 
docker build -t nildowjunior/desafio02:latest .
``

# Para subir o container utilizar o comando 
``
docker run -p8087:9090 -e APP_NAME=teste -e APP_COLOR=red nildowjunior/desafio02:latest
``

Os parâmetros `APP_NAME` e `APP_COLOR` podem ser substituidos conforme o usuário desejar.

O parâmetro `APP_NAME` é uma string que será utilizado no deploy da aplicação.

O parâmetro `APP_COLOR` só aceita nomes de cores escrito em inglês e será utilizado para setar a cor de fundo da aplicação

# Para acessar a aplicação localmente

Utilizar o caminho http://127.0.0.1:8087
