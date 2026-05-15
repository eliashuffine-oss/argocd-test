FROM python:3.14-slim-trixie
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Copy the project into the image
COPY . /app

# Copies `requirements.txt`
COPY requirements.txt .

# Installs the Python dependencies
RUN pip install -r requirements.txt

# Disable development dependencies
ENV UV_NO_DEV=1
#EXPOSE 8000

# Sync the project into a new environment, asserting the lockfile is up to date
WORKDIR /app
RUN uv sync

CMD ["/app/.venv/bin/fastapi", "run", "main.py", "--port", "8000", "--host", "0.0.0.0"]