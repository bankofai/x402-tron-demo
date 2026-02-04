# X402-Tron Demo

## Overview

The **X402-Tron Demo** project demonstrates the integration of the **x402 payment protocol** with the TRON blockchain ecosystem. It showcases secure pay-per-request mechanisms for accessing protected resources, combining blockchain-based automation with decentralized applications (dApps).

---

## Table of Contents
1. [Core Components](#core-components)
2. [Environment Setup](#environment-setup)
3. [Running the Demo](#running-the-demo)
4. [Troubleshooting](#troubleshooting)
5. [Additional Documentation](#additional-documentation)

---

## Core Components

### **Server: Secure Data as a Service**
- **Purpose:** Serve premium resources (e.g., dynamically generated images) that require TRON micropayments.
- **Features:**
  - Implements the x402 payment protocol (HTTP 402 Payment Required).
  - Protects resources with payment validation on TRON Nile Testnet.

### **Facilitator: Blockchain Payment Handler**
- **Purpose:** Trusted intermediary for payment processing.
- **Features:**
  - Verifies signed permits for payment.
  - Settles transactions on the TRON blockchain.

### **Client: Payment Demonstration Tool**
- **CLI Client**:
  - Command-line interface for automated payment and resource access.
- **Web Client**:
  - React-powered UI for showcasing wallet-based payment flows.

---

## Environment Setup

### **Required Environment Variables**
Create a `.env` file in the project root:

```env
# TRON private key for Facilitator's blockchain interactions.
TRON_PRIVATE_KEY=<your_tron_private_key>

# Payment recipient address for Server.
PAY_TO_ADDRESS=<server_recipient_tron_address>

# Server URL (default: localhost).
SERVER_URL=http://localhost:8000

# HTTP timeout for network operations.
HTTP_TIMEOUT_SECONDS=60

# Facilitator URL (default: localhost:8001).
FACILITATOR_URL=http://localhost:8001
```

### **Installation**

1. **Clone the repository:**
   ```bash
   git clone <repo-url>
   cd x402-tron-demo
   ```

2. **Create the `.env` file:**
   Refer to the example above for configurations.

3. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   npm install # For client/web
   ```

---

## Running the Demo

### **Start Services Using Scripts**

```bash
# Start Facilitator
./start.sh facilitator

# Start Server
./start.sh server

# Run Terminal Client
./start.sh client

# Run Web Client (Local Development)
cd client/web && npm run dev
```

### **Docker Setup**
Use Docker Compose for containerized execution:

```bash
docker-compose up -d
```
Access the Web Client at `http://localhost:8080`.

---

## Troubleshooting

### **Common Issues**
1. **`TRON_PRIVATE_KEY` not found:**
   - Ensure `.env` is correctly configured.
   - Double-check test TRON addresses on the [Nile Faucet](https://nileex.io/join/getJoinPage).

2. **HTTP Timeout:**
   - Increase `HTTP_TIMEOUT_SECONDS` in `.env` for slow blockchain interactions.

3. **Web Client Issues**:
   - Ensure TronLink is switched to **Nile Testnet**.

---

## Additional Documentation

- **System Architecture:** Communication flows are detailed in [ARCHITECTURE.md](ARCHITECTURE.md).
- **Server Documentation:** API specifications are available in [SERVER.md](SERVER.md).
- **Facilitator Documentation:** Payment flows are explained in [FACILITATOR.md](FACILITATOR.md).
- **Client Documentation:** Usage instructions are provided in [CLIENT.md](CLIENT.md).