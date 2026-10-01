# Letra Viva: aprenda espanhol com o seu Spotify

Mostra a letra da música que está tocando (ou de uma das suas playlists), com a tradução linha a linha. Você pode clicar em qualquer palavra para ver o significado e salvá-la para revisar.

## 1. Rodar o app (Mac)

1. Coloque a pasta `letra-viva` onde quiser (ex.: Documentos).
2. Abra o **Terminal** e rode:
   ```
   cd ~/Documents/letra-viva
   python3 -m http.server 8888 --bind 127.0.0.1
   ```
3. Abra **http://127.0.0.1:8888** no navegador. Use `127.0.0.1`, não `localhost`, porque o Spotify não aceita `localhost`.

Atalho: rode `chmod +x iniciar.command` uma vez. Depois disso, basta dar dois cliques em `iniciar.command`. Se o macOS bloquear, clique com o botão direito → Abrir.

Sem o Spotify, você já pode usar a **busca de letras** na barra lateral.

## 2. Conectar o Spotify (uma vez, ~5 min)

> Desde fevereiro de 2026, apps em modo de desenvolvimento exigem que **o dono tenha Spotify Premium**, e cada app tem no máximo 5 usuários.

1. Acesse https://developer.spotify.com/dashboard e entre com sua conta.
2. **Create app**:
   - Nome e descrição: qualquer coisa (ex.: "Letra Viva")
   - **Redirect URI**: `http://127.0.0.1:8888/`, exatamente assim, com a barra no final
   - Marque **Web API** e aceite os termos.
3. Abra o app criado → **Settings** → copie o **Client ID**.
4. No Letra Viva, clique em ⚙︎, cole o Client ID e salve.
5. Clique em **Entrar com Spotify**.

Não precisa de "Client Secret". O login usa PKCE, que é seguro para apps sem servidor.

## 📱 No iPhone (como app na tela de início)

O iPhone não acessa o `127.0.0.1` do seu Mac. Por isso, você vai publicar a pasta num endereço `https` gratuito com o GitHub Pages. Faça isso uma vez, pelo Mac.

### A. Publicar no GitHub Pages (~10 min)

1. Crie uma conta grátis em https://github.com.
2. Clique em **+ → New repository**:
   - Nome: `letra-viva`
   - Deixe como **Public** (o plano grátis só publica repositórios públicos). Não há nada secreto nos arquivos: o Client ID não é segredo, e sua chave de IA fica só no seu celular.
   - Clique em **Create repository**.
3. Na página do repositório, clique em **uploading an existing file**. Arraste **todos os arquivos de dentro** da pasta `letra-viva` (não a pasta em si) e clique em **Commit changes**.
4. Vá em **Settings → Pages**. Em *Source*, escolha **Deploy from a branch**, depois **main** e **/(root)**, e clique em **Save**.
5. Espere 1–2 minutos. Seu endereço será:
   **`https://SEU-USUARIO.github.io/letra-viva/`**

### B. Avisar o Spotify do novo endereço

No painel do Spotify (https://developer.spotify.com/dashboard), abra seu app e vá em **Settings → Edit**. Em *Redirect URIs*, **adicione** `https://SEU-USUARIO.github.io/letra-viva/` (com a barra no final) e salve. Pode manter o do Mac também.

### C. Instalar no iPhone

1. Abra o endereço no **Safari**.
2. Toque em **Compartilhar** (o quadrado com a seta para cima). Em versões mais novas do iOS, pode estar dentro do menu **•••**.
3. Toque em **Adicionar à Tela de Início → Adicionar**.
4. **Abra pelo ícone novo** e configure tudo lá dentro (⚙︎ → Client ID, e a chave de IA se quiser). Depois, entre com o Spotify.

> ⚠️ O app da tela de início guarda dados separados do Safari. Configure e faça login **dentro do app instalado**, não no Safari.
>
> 💡 Para não digitar o Client ID ou a chave no celular, copie no Mac e cole no iPhone. Com o mesmo Apple ID, a área de transferência é compartilhada.

### Uso no dia a dia

Toque a música no app do Spotify e troque para o Letra Viva. Ele atualiza sozinho assim que você volta para ele. Toque numa palavra e o significado aparece num painel que sobe da parte de baixo da tela.

Quando você mudar alguma coisa no app (por exemplo, uma versão nova que eu fizer), suba os arquivos de novo no GitHub, substituindo os antigos.

### Sincronizar palavras salvas entre Mac e iPhone

1. Em https://github.com/settings/tokens, clique em **Generate new token → Generate new token (classic)**. Escreva uma nota (ex.: "Letra Viva"), escolha a expiração **No expiration** e marque **só `gist`**. Clique em **Generate token** e copie o token.
2. No Letra Viva do **computador**, vá em ⚙︎ → **☁️ Sincronizar palavras** → cole o token → **Ativar / sincronizar agora**.
3. Gere o código em **📱 Conectar o celular** e cole no iPhone. O código já leva o token, então o celular também passa a sincronizar.

As palavras ficam num gist **secreto** na sua conta do GitHub e sincronizam sempre que você salva ou apaga uma palavra, ou volta para o app.

## 3. Traduções melhores com IA (opcional, recomendado)

- **Grátis (MyMemory)** é o padrão. Funciona, mas traduz ao pé da letra, e a palavra clicada é traduzida sem considerar a frase. Tem limite diário (informar seu e-mail nas configurações aumenta o limite).
- **Claude (IA)** entende gírias e expressões, e explica a palavra **no contexto do verso**: forma base (infinitivo), classe gramatical, uma dica e um exemplo. Para ativar:
  1. Crie uma chave em https://console.anthropic.com (é pago por uso; traduzir uma música custa frações de centavo).
  2. Em ⚙︎, escolha "Claude (IA)" e cole a chave.

As traduções ficam em cache, então cada música só é traduzida uma vez.

## Como usar

- **▶ Seguir o que toca**: acompanha o Spotify (app, celular ou web) e destaca a linha atual.
- **Playlists** (barra lateral): escolha uma música para estudar sem precisar tocar. O Spotify só libera o conteúdo das playlists **que você criou ou colabora**, além das Músicas curtidas.
- **Modo desafio**: a tradução fica borrada. Tente entender antes e clique na linha para revelar.
- **Só espanhol**: esconde as traduções.
- **✎ Colar letra**: para quando a letra não for encontrada.
- **★ Palavras salvas → Exportar CSV**: importa direto no **Anki** (File → Import, campos separados por vírgula, "Permitir HTML" ligado).

## Limitações

- As letras vêm do **LRCLIB**, um banco aberto e colaborativo. Músicas muito recentes ou pouco conhecidas podem não estar lá.
- Tudo (configurações, chave, palavras salvas) fica guardado **só neste navegador** (ou só no app da tela de início). As palavras salvas no Mac não aparecem no iPhone, e vice-versa. Use **Exportar CSV** para levar suas palavras para o Anki.
- No iPhone, o app não roda em segundo plano. O destaque da linha atual só acompanha a música enquanto o Letra Viva está aberto na tela.
