FROM ghcr.io/mealie-recipes/mealie:latest

# Set environment variables
ENV ALLOW_SIGNUP=false
ENV TZ=America/Los_Angeles
ENV BASE_URL=https://spring-prep-hike-production.up.railway.app
ENV CORS_ORIGINS=*

# Expose port
EXPOSE 9000

# Create volume mount point
# VOLUME /app/data

# Run the application
CMD ["sh", "-c", "uvicorn mealie.app:app --host 0.0.0.0 --port ${PORT:-9000}"]