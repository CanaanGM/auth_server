FROM mcr.microsoft.com/dotnet/sdk:7.0 as build

WORKDIR /app
EXPOSE 80 443

COPY . . 

RUN dotnet restore 

WORKDIR /app/
RUN dotnet publish -c Release -o /app/out

FROM mcr.microsoft.com/dotnet/aspnet:7.0 
WORKDIR /app
COPY --from=build /app/out .

ENTRYPOINT [ "dotnet", "auth-server.dll" ]