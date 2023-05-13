.PHONY: test lint format

test:
	cd python; pytest tests/

lint:
	cd python; black rebuff/ tests/
	cd python; flake8 rebuff/ tests/
	cd python; isort rebuff/ tests/
	cd python; mypy rebuff/ tests/

format:
	cd python; isort rebuff/ tests/
	cd python; black rebuff/ tests/


init: init-python init-server

init-python:
	cd python; pip install -e '.[dev]' -U

init-server:
	cd server; npm install

integration-test:
	cd server; npm run dev &  # Start the NextJS server
	cd python; pytest -s tests/test_integration.py  # Run the integration test
	pkill -f "next dev"  # Stop the NextJS server