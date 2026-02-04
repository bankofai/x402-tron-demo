# Facilitator Documentation

## Overview

The **Facilitator Module** handles payment validation and transaction settlement within the X402-Tron Demo. It acts as a trusted intermediary between the Resource Server and the TRON blockchain.

---

## Features

- **Permit Verification:** Validates payment requests signed by clients.
- **Transaction Settlement:** Executes TRON blockchain transactions.

---

## API Endpoints

| Endpoint       | Method | Description                                |
|----------------|--------|--------------------------------------------|
| `/`            | `GET`  | Health check and system information.      |
| `/verify`      | `POST` | Verifies signed permits.                  |
| `/settle`      | `POST` | Confirms and processes blockchain payments.

**Example Request**:
```bash
curl -X POST http://localhost:8001/settle -d '{"permit": {...}}'
```

---

## Environment Configuration

### Environment Variables
1. **TRON_PRIVATE_KEY:** Used for blockchain interactions.
2. **FACILITATOR_URL:** Endpoint for permit submission.

Example `.env` configuration:
```env
TRON_PRIVATE_KEY=<private_key>
FACILITATOR_URL=http://localhost:8001
```

---