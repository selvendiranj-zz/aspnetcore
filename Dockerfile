FROM microsoft/dotnet:latest

RUN apt-get update && apt-get install sqlite3 libsqlite3-dev

COPY . /app

WORKDIR /app

RUN ["dotnet", "restore"]

RUN ["dotnet", "build"]

RUN ["dotnet", "ef", "database", "update"]

EXPOSE 5000/tcp

ENTRYPOINT ["dotnet", "run", "--server.urls", "http://192.168.1.107:5000"]
