# AGENTS.md

## Repository Guide for Agentic Automation

This document provides a clear structure for coding agents tasked with maintaining, extending, or fixing issues within this repository. It is tailored to agentic coding processes ensuring clarity, consistency, and operational efficiency.

---

## 💻 Commands Overview

### Build Commands
Currently, there is no explicit build process as this is a Python repository.

### Linting Commands

Use `flake8` for linting to adhere to Python's PEP 8 style guide:
```bash
# Install flake8
pip install flake8

# Perform global linting
flake8 .

# Lint a specific file
flake8 server/main.py
```

Alternatively, use `black` for code formatting:
```bash
# Install black
pip install black

# Automatically format all Python files
black .

# Format a specific file
black server/main.py
```

### Testing Commands

Tests use `pytest` to ensure robust validation of the repository functionalities:
```bash
# Install pytest
pip install pytest

# Run all tests globally
pytest

# Test a specific file
pytest test/test_x402.py

# Run a specific test by its name
pytest -k "test_sample_method"
```
Additional options for failed test debugging:
```bash
pytest --maxfail=3 --disable-warnings
pytest --tb=short
```

---

## ✨ Code Style Guidelines
### General Principles
- Adhere strictly to Python's PEP 8 style guide.
- Focus on readability and maintainability:
  - Avoid complex one-liners.
  - Ensure comments describe reasoning and intent.

### Formatting
Use [black](https://black.readthedocs.io/) for consistent formatting:
```bash
black .
```
- Maximum line length: **88 characters**.
- Use 4 spaces per indentation level.

### Imports and Dependencies
Sort imports following Python's guidelines:
1. **Standard libraries**
2. **Third-party libraries**
3. **Local project modules**

Group and alphabetize imports within their respective sections:
```python
import os
import sys

from fastapi import FastAPI
from dotenv import load_dotenv

from .utils import helper_method
```

### Naming Conventions
- **Variables:** Use `snake_case`.
- **Functions:** Use `snake_case`.
- **Classes:** Use `PascalCase`.
- **Constants:** Use `CAPS_WITH_UNDERSCORES`.

Example:
```python
PRIVATE_KEY = "sample_key"
def fetch_data():
    pass

class DataFetcher:
    pass
```

### Type Annotations
Add type hints for clarity in function signatures:
```python
def calculate_total(price: float, quantity: int) -> float:
    return price * quantity
```

### Error Handling
- Use structured logging for all errors.
- Raise exceptions with clear, actionable error descriptions:
```python
try:
    payload = client.fetch_data()
except Exception as e:
    logger.error(f"Error while fetching: {str(e)}")
    raise HTTPException(status_code=500, detail="An error occurred")
```

### Thread Safety
Handle shared resources cautiously using thread locks:
```python
_request_count_lock = threading.Lock()
```

---

## 📜 Testing Guidelines
1. Use `pytest` for all test cases.
2. Write tests validating:
   - Successful responses
   - Failure cases
   - Edge conditions
3. Coverage:
   - API endpoints
   - Payment processing
   - Exception handling

Example Test:
```python
def test_endpoints():
    response = client.get("/protected")
    assert response.status_code == 402
    assert "paymentRequired" in response.text
```
Run tests under specific conditions:
```bash
pytest --cov ./server
pytest test/test_x402.py --maxfail=5
```

---

## 🛠 Developer Utilities

### Docker Support
Docker configurations ensure containerized consistency:
```bash
# Build images
docker build -t x402_server .

# Start services
docker-compose up -d

# Stop services
docker-compose down
```

### Start/Stop Scripts
Convenient scripts simplify multi-service handling:
```bash
# Start all services
bash start.sh

# Stop Docker containers
bash stop_docker.sh
```

### Useful Debugging Tips
- Run FastAPI server post-debugging:
```bash
uvicorn server.main:app --reload
```
- Start facilitator components:
```bash
python facilitator/main.py
```

---

## ⚡ Notes for Agent Coding
1. **Strict Adherence**: Follow all outlined guidelines.
2. **Pre-Testing:** Agents must lint and test code prior to commits.
3. **Documentation:** Create comprehensive docstrings and comments for new features.

For deeper understanding of the project:
- Reference `ARCHITECTURE.md` for system-wide insights.
- Consult `SERVER.md`, `CLIENT.md`, and `FACILITATOR.md` for technical details.