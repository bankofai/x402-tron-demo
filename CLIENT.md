# Client Documentation

## Overview

The **Client Module** enables direct user interaction with resources protected by the x402 payment protocol. Two implementations are provided: **command-line client (CLI)** and **React-based Web Client**.

---

## Features

### Terminal Client
CLI-based tool for automated transaction submissions and resource retrieval.

### Web Client
User-friendly interface powered by React, designed for TronLink-enabled workflows.

---

## Configuration

### Environment Variables
1. **SERVER_URL:** Address of the Resource Server.
2. **TRON_PRIVATE_KEY:** Used for CLI transactions.
3. **FACILITATOR_URL:** Facilitator API endpoint.

Example `.env` configuration:
```env
SERVER_URL=http://localhost:8000
TRON_PRIVATE_KEY=<private_key>
FACILITATOR_URL=http://localhost:8001
```

---

## Terminal Client (CLI)

**Workflow**:
1. Requests `/protected` endpoint triggering `402 Payment Required`.
2. Signs payment permits.
3. Submits permits to Facilitator.
4. Retrieves resource once validated.

**Run Command**:
```bash
./start.sh client
```

---

## Web Client

**Features**:
- Wallet integration using TronLink.
- Permit signing via Web UI.

**Run Locally**:
```bash
cd client/web
npm install
npm run dev
```
Access Web Client at `http://localhost:5173`.

---