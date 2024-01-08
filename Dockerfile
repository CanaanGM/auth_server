FROM mcr.microsoft.com/dotnet/sdk:7.0 as build

WORKDIR /app
EXPOSE 80

COPY . . 
# Restore package deps

RUN dotnet restore 

# Copy app folders

WORKDIR /app/
RUN dotnet publish -c Release -o /app/out

# Build runtime image

FROM mcr.microsoft.com/dotnet/aspnet:7.0 
WORKDIR /app
COPY --from=build /app/out .

ENTRYPOINT [ "dotnet", "auth-server.dll" ]