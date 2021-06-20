#FROM microsoft/dotnet:1.1-sdk AS builder
FROM mcr.microsoft.com/dotnet/sdk:latest AS builder
ENV VERSION 1.11.0

COPY * /proj/
RUN cd /proj && ./project-build.sh

# Build env image
#FROM microsoft/dotnet:1.1.0-runtime
FROM mcr.microsoft.com/dotnet/runtime:latest
WORKDIR /fission-workdir
COPY --from=builder /proj/out .
EXPOSE 8888

ENTRYPOINT ["dotnet"]

CMD ["fission-dotnet.dll"]
