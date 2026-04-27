FROM ghcr.io/mealie-recipes/mealie:latest

# Set environment variables
ENV ALLOW_SIGNUP=false
ENV TZ=America/Los_Angeles
ENV BASE_URL=https://mealie-deployment-production.up.railway.app
ENV CORS_ORIGINS=https://ryeruva.github.io

# Expose port
EXPOSE 8080

# Override entrypoint and run the application
ENTRYPOINT []
CMD ["sh", "-c", "uvicorn mealie.app:app --host 0.0.0.0 --port ${PORT:-8080}"]