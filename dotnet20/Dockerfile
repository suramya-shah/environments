#FROM microsoft/dotnet:2.0.0-sdk AS builder
FROM mcr.microsoft.com/dotnet/sdk:latest AS builder
COPY * /proj/
RUN cd /proj && ./project-build.sh

# Build env image
#FROM microsoft/dotnet:2.0-runtime
FROM mcr.microsoft.com/dotnet/runtime:latest
WORKDIR /fission-workdir
COPY --from=builder /proj/out .
EXPOSE 8888

ENTRYPOINT ["dotnet"]

CMD ["fission-dotnet20.dll"]
