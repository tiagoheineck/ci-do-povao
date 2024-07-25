# Como isso funciona?

primeiro crie um arquivo db_root_password.txt dentro da pasta secrets, copie o arquivo de referência

```
cp secrets/db_root_password.txt.example secrets/db_root_password.txt
```


# Registrando o gitlab runner
```
sh scripts/gitlab-runner-register.sh
```


Depois seja feliz!