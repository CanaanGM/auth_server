## env 

```bash
echo GUILD_USER=$(openssl rand -base64 32)>.env && echo GUILD_PASSWORD=$(openssl rand -base64 32) >> .env
```

## certificate

```bash
## windows
dotnet dev-certs https -ep "$env:USERPROFILE\.aspnet\https\auth-server.pfx"  -p lY3XNbK465BIPyS6W+KD8Si7fo9Vn5zhgMu5n8zh3Tk=
## linux
dotnet dev-certs https -ep ${HOME}/.aspnet/https/auth-server.pfx  -p lY3XNbK465BIPyS6W+KD8Si7fo9Vn5zhgMu5n8zh3Tk=

dotnet dev-certs https --trust
```