# Use a imagem oficial do Python como base.  Especificamente, a versão 3.13.5 com Alpine Linux para uma imagem menor.
FROM python:3.13.5-alpine3.22

# Define o diretório de trabalho dentro do container como /app.
WORKDIR /app

EXPOSE 8000

# Copia o arquivo requirements.txt para o diretório de trabalho.
COPY requirements.txt .

# Instala as dependências Python listadas no arquivo requirements.txt.
# A flag --no-cache-dir evita o armazenamento de caches pip, reduzindo o tamanho da imagem.
RUN pip install --no-cache-dir -r requirements.txt

# Copia todo o código do aplicativo para o diretório de trabalho.
COPY . .

# Define o comando padrão para iniciar o aplicativo quando o container for executado.
# Utiliza o Uvicorn como servidor ASGI, especificando o módulo app (app.py) e o objeto app (FastAPI instance).
# Define o host para 0.0.0.0 para ouvir em todas as interfaces e a porta 8000.
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
