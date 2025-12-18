# Django no Arranque do windows

Sim, tem como fazer o **Waitress arrancar logo no início do Windows**, mesmo sem a sua intervenção, simulando um ambiente de produção real onde o servidor está sempre a funcionar.

A melhor maneira de fazer isso no Windows é configurar a sua aplicação para rodar como um **Serviço do Windows (Windows Service)**.

## 🛠️ Método Recomendado: Usar o NSSM

O **NSSM (Non-Sucking Service Manager)** é a ferramenta mais popular e mais fácil de usar para transformar qualquer aplicação de linha de comando (como o Waitress a correr o seu Django) num serviço do Windows.

Um serviço do Windows arranca automaticamente no início do sistema, corre em segundo plano, e reinicia-se automaticamente em caso de falha.

---

### 1. Preparação: Crie um Script de Arranque Simples

Primeiro, garanta que o seu *script* `.bat` apenas ativa o ambiente virtual e inicia o Waitress. Chame-o de, por exemplo, `iniciar_waitress.bat`:

Fragmento do código

`@echo off
REM Script que será executado pelo NSSM

REM Ativação e arranque (mantenha o caminho completo, pois o NSSM pode não saber onde está)
call "C:\Caminho\Completo\Para\O\Seu\Projeto\.venv\Scripts\activate.bat"

REM Arranque do Waitress
waitress-serve --port=8000 meuprojeto.wsgi:application

REM Não coloque 'pause' ou 'deactivate' no final, pois o serviço deve correr até ser parado.`

*(Certifique-se de substituir o caminho completo e o nome do seu projeto `meuprojeto`)*.

### 2. Instalar o NSSM

1. **Descarregue o NSSM:** Pesquise por "NSSM download" no Google.
2. **Extraia:** Descomprima o ficheiro e copie o executável `nssm.exe` para uma pasta de fácil acesso (ex: `C:\nssm`).

### 3. Criar o Serviço do Windows

Abra o **Prompt de Comando como Administrador** e use o NSSM para instalar o seu *script* como um serviço:

Bash

`# Navegue até à pasta onde guardou o nssm.exe
C:\nssm\nssm install NomeDoSeuServicoDjango`

O NSSM irá abrir uma janela gráfica onde você deve configurar o seguinte:

| **Campo** | **O que preencher** |
| --- | --- |
| **Path** | O caminho completo para o seu *script* `.bat` (Ex: `C:\Projetos\Django\iniciar_waitress.bat`) |
| **Startup directory** | O caminho para a pasta onde está o seu `manage.py` (pasta raiz do projeto) |

Depois de preencher e clicar em **"Install Service"**, o serviço será criado.

### 4. Configurar e Iniciar o Serviço

1. Abra o **Gestor de Serviços do Windows** (pesquise por "Services" no menu Iniciar).
2. Procure pelo nome que você deu ao seu serviço (Ex: `NomeDoSeuServicoDjango`).
3. Clique duas vezes nele:
    - Em **"Startup type"** (Tipo de Arranque), selecione **"Automatic"** (Automático).
    - Clique em **"Start"** (Iniciar) para arrancar o servidor imediatamente.

Com isso, o seu servidor Django com Waitress **arrancará automaticamente sempre que o Windows for ligado** e correrá em segundo plano sem a necessidade de janelas abertas.