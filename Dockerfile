# Mock enterprise services image (used by release-copilot's compose.yaml).
FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 PYTHONUNBUFFERED=1 PIP_NO_CACHE_DIR=1
WORKDIR /app

COPY pyproject.toml ./
COPY src ./src
RUN pip install . && useradd --create-home --uid 10001 mocks

USER mocks
EXPOSE 9100
CMD ["python", "-m", "release_copilot_mocks", "--host", "0.0.0.0", "--port", "9100"]
