# spring-exercicios

Repositorio com exercicios praticos de Spring desenvolvidos na disciplina de Desenvolvimento Web Back-end.

## Estrutura

- `AULA_03/api_rest`: primeira API REST da disciplina, com CRUD simples de usuarios em memoria
- `AULA_04`: modelagem e implementacao da API REST do IFgram para o recurso `Postagem`

## Tecnologias utilizadas

- Java 26
- Spring Boot 4
- Spring Web MVC
- Maven Wrapper
- JUnit

## Projetos

### AULA_03

Projeto introdutorio com uma API REST simples para gerenciamento de usuarios.

### AULA_04

Projeto com foco em modelagem de API REST e implementacao do recurso `Postagem`, contendo:

- `GET /api/posts`
- `GET /api/posts/{id}`
- `POST /api/posts`
- `PUT /api/posts/{id}`
- `DELETE /api/posts/{id}`

Tambem inclui o PDF de especificacao enviado junto com a atividade.

## Como executar um projeto

Entre na pasta desejada e execute no PowerShell:

```powershell
$env:JAVA_HOME='C:\Program Files\Java\jdk-26'
.\mvnw.cmd spring-boot:run
```

## Como testar

Para rodar os testes:

```powershell
$env:JAVA_HOME='C:\Program Files\Java\jdk-26'
.\mvnw.cmd test
```

## Objetivo do repositorio

Organizar a evolucao dos exercicios da disciplina, deixando cada aula separada em sua propria pasta, com codigo-fonte, instrucoes de execucao e materiais de apoio quando necessario.
