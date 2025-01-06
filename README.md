# 🌟 Mainô Rails Blog 🌟

[![GitHub issues](https://img.shields.io/github/issues/Lusqinha/maino-rails-blog)]()  [![GitHub forks](https://img.shields.io/github/forks/Lusqinha/maino-rails-blog)]()  [![GitHub stars](https://img.shields.io/github/stars/Lusqinha/maino-rails-blog)]()  [![GitHub license](https://img.shields.io/github/license/Lusqinha/maino-rails-blog)]()

![](/readme_docs/img/railsblog-header.png)

## 📜 Descrição do Projeto

Este projeto é uma aplicação web de blog desenvolvida como parte do Desafio Técnico Mainô. A aplicação permite que usuários publiquem, editem e comentem posts. Além disso, oferece funcionalidades de autenticação, recuperação de senha e paginação de posts. O projeto foi desenvolvido utilizando Ruby on Rails, HTML, CSS, JavaScript e PostgreSQL.

## 🚀 Funcionalidades

### 🔓 Área Deslogada

- 📄 Visualizar posts publicados por todos os usuários, ordenados do mais novo para o mais antigo.
- 📑 Paginação dos posts, exibindo até 3 posts por página.
- 💬 Fazer comentários anônimos.
- 📝 Cadastrar um novo usuário.
- 🔑 Fazer login com um usuário cadastrado.
- 🔄 Recuperar a senha do usuário.

### 🔒 Área Logada

- ✍️ Redigir e publicar um post.
- ✏️ Editar e apagar posts publicados pelo próprio usuário.
- 💬 Fazer comentários identificados através do login.
- 🛠️ Editar o cadastro do usuário.
- 🔄 Alterar a senha do usuário logado.

### 🌟 Funcionalidades Opcionais

- ✅ Testes automatizados simples.
- 🌐 Internacionalização.
- 🏷️ Adicionar tags aos posts e filtrar posts por tags.
- 📂 Upload de arquivo TXT para criação de posts ou múltiplas tags, utilizando Sidekiq para processamento assíncrono.

## 🛠️ Decisões Técnicas

### 📦 Gems Utilizadas

-`devise`: Para autenticação de usuários.

-`kaminari`: Para paginação dos posts.

-`sidekiq`: Para processamento assíncrono de uploads de arquivos.

-`rails-i18n` e `devise-i18n`: Para internacionalização.

-`simplecov`: Para cobertura de testes.

-`rubocop-rails-omakase`: Para análise estática de código.

-`bootsnap`: Para acelerar o boot da aplicação.

-`solid_cache`, `solid_queue`, `solid_cable`: Para cache, filas e WebSockets.

### 🏗️ Estrutura do Projeto

-**Modelos**: `Post`, `Comment`, `User`, `Tag`, `PostTag`

-**Controladores**: `PostsController`, `CommentsController`, `Users::SessionsController`, `Users::RegistrationsController`, `Users::OmniauthCallbacksController`

-**Views**: Utilização de ERB para renderização de templates.

-**Jobs**: `CreatePostsFromFileContentJob` para processamento de uploads de arquivos.

-**Configurações**: Internacionalização configurada para português e inglês.

## ▶️ Como Executar o Projeto

### 📋 Pré-requisitos

- Ruby 3.3.5
- Rails 8.0.1
- PostgreSQL
- Redis (para Sidekiq)

### 📦 Passos para Execução

1. **Clone o repositório:**

```sh
git clone https://github.com/Lusqinha/maino-rails-blog.git
cd maino_rails_blog
```

2. **Instale as dependências:**

```sh
bundle install
```

3. **Configure o banco de dados:** Crie um arquivo `.env` na raiz do projeto com as seguintes variáveis:

```env
DB_HOST=localhost
DB_PORT=5432
DB_USERNAME=postgres
DB_PASSWORD=postgres
DB_NAME=rails_blog
DB_TEST_NAME=rails_blog_test
DB_SSLMODE=disable

REDIS_URL=redis://default:senha123!@localhost:6379/0

HOST_ADRESS=examaple.com
SMTP_ADDRESS=smtp.example.com
SMTP_PORT=587
SMTP_DOMAIN=example.com
SMTP_USER_NAME=mailer@example.com
SMTP_PASSWORD=mailer_password 

HOST=localhost
PORT=3000
```

4. **Prepare o banco de dados:**

```sh
bin/rails db:setup
```

5. **Inicie o Sidekiq:**

```sh
bundle exec sidekiq
```

6. **Inicie o servidor Rails:**

```sh
bin/rails server
```

7. **Acesse a aplicação:** Abra o navegador e acesse [http://localhost:3000](http://localhost:3000).

### 🧪 Testes Automatizados

Para executar os testes automatizados, utilize o comando:

```sh
bin/rails test
```

### 🚀 Deploy

A aplicação está configurada para ser implantada em um serviço de hospedagem na nuvem. Certifique-se de configurar as variáveis de ambiente necessárias e seguir as instruções de deploy específicas da plataforma escolhida.

### 🎉 Conclusão

Este projeto foi desenvolvido seguindo as melhores práticas de desenvolvimento em Ruby on Rails, com foco em qualidade de código, legibilidade e aderência ao escopo solicitado. A aplicação está pronta para ser utilizada e pode ser facilmente expandida com novas funcionalidades.
