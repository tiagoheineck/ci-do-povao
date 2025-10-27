# Como isso funciona?

primeiro crie um arquivo db_root_password.txt dentro da pasta secrets, copie o arquivo de referência

```
cp secrets/db_root_password.txt.example secrets/db_root_password.txt
```

# Rodando

```
docker compose up
``` 

## Gerando a senha inicial do gitlab

Obs:  O Gitlab demora para subir, acompanhe os logs com 
```
docker compose logs -f gitlab
```
Então pegue a senha de root com
```
docker exec -it ci-gitlab grep 'Password:' /etc/gitlab/initial_root_password
```
Usuário padrão: root


# Registrando o gitlab runner
Vá até https://gitlab.localhost/admin/runners


```

Siga o procedimento de criar um novo runner, pegue o token informado

```
sh scripts/gitlab-runner-register.sh [TOKEN-INFORMADO] http://gitlab
```


Depois seja feliz!

