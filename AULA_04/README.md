# Aula 4 - API REST do IFgram

Implementacao do exercicio da aula 4 de Desenvolvimento Web Back-end com Spring Web MVC.

## O que foi entregue

- API REST para o recurso `Postagem`
- Operacoes de listar, buscar por ID, criar, atualizar e remover
- Armazenamento em memoria, seguindo a proposta vista em sala
- Documento da especificacao em PDF: [EspecificacaoAPIIFgram.pdf](./EspecificacaoAPIIFgram.pdf)

## Estrutura do JSON

```json
{
  "id": 1,
  "titulo": "Visita tecnica ao laboratorio",
  "conteudo": "Os alunos conheceram a infraestrutura de redes do campus.",
  "dataCriacao": "2026-04-01"
}
```

## Endpoints implementados

- `GET /api/posts`
- `GET /api/posts/{id}`
- `POST /api/posts`
- `PUT /api/posts/{id}`
- `DELETE /api/posts/{id}`

## Como executar

No PowerShell, dentro da pasta `AULA_04`:

```powershell
$env:JAVA_HOME='C:\Program Files\Java\jdk-26'
.\mvnw.cmd spring-boot:run
```

Depois, acesse a API em `http://localhost:8080`.

## Como testar

Exemplo de criacao de postagem:

```http
POST /api/posts
Content-Type: application/json

{
  "titulo": "Primeira postagem",
  "conteudo": "Conteudo da primeira postagem no IFgram"
}
```

## Validacao

Teste executado com sucesso:

```powershell
$env:JAVA_HOME='C:\Program Files\Java\jdk-26'
.\mvnw.cmd test
```
