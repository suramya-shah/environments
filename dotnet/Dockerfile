#FROM microsoft/dotnet:1.1-sdk AS builder
FROM mcr.microsoft.com/dotnet/sdk:3.1 AS builder

COPY * /proj/
#RUN cd /proj && ./project-build.sh
RUN cd /proj
RUN dotnet restore "fission-dotnet.csproj"
RUN dotnet publish "fission-dotnet.csproj" -c Release -o out
# Build env image
#FROM microsoft/dotnet:1.1.0-runtime
FROM mcr.microsoft.com/dotnet/runtime:3.1
WORKDIR /fission-workdir
COPY --from=builder /proj/out .
EXPOSE 8888

ENTRYPOINT ["dotnet"]

CMD ["fission-dotnet.dll"]
