"""ASGI entry point for ``uvicorn release_copilot_mocks.asgi:app`` (and ``--reload``)."""

from release_copilot_mocks.app import create_app

app = create_app()
