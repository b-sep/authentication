## Desafio <a href="https://github.com/backend-br/desafios/blob/master/authentication/PROBLEM.md" target="_blank">Autenticação</a>

`GET localhost:3000/api/v1/foo-bar`

<details>
    <summary>Sem Bearer Token</summary>
    <p>Status http: 401</p>
    <p>Body: { "message": "Missing or invalid token, to generate a token go to: /api/v1/generate_token" }</p>
</details>

<details>
    <summary>Com Bearer Token</summary>
    <p>Status http: 204 (no content)</p>
</details><br>

`POST localhost:3000/api/v1/foo-bar`

<b>Parâmetro obrigatório em format **JSON**: { "api_token": { "user_email": "jhon@doe.com.br" }}</b>

<details>
    <summary>Com email válido</summary>
    <p>Status http: 201</p>
    <p>Body: { "Bearer token": "1239823", "expires_at": "expiration date" }</p>
</details>

<details>
    <summary>Com email inválido</summary>
    <p>Status http: 422</p>
    <p>Body: { "user_email": ['is invalid']}</p>
</details>

<details>
    <summary>Quando o usuário já tem um token ativo</summary>
    <p>Status http: 200</p>
    <p>Body: { "Bearer token": "1239823", "expires_at": "expiration date" }</p>
</details>
