# X402-Tron Demo

## Overview

The **X402-Tron Demo** showcases a blockchain-powered implementation of the **x402 payment protocol**, enabling secure pay-to-access workflows. The demo demonstrates how decentralized payments can facilitate resource access using an **Agent-based payment model** as a conceptual framework, even if the underlying implementation uses standard Python services.

### Key Concept: Agent-Like Payment Flow

Although powered by Python servers, the demo simulates an **Agent-driven interaction model**: 
1. The **Client Agent** interacts with a **Server Agent** to request access to protected resources.
2. Upon receiving a `402 Payment Required` challenge, the Client operates similarly to an agent by signing cryptographic permits to fulfill payment requirements.
3. The **Facilitator Agent**, acting conceptually as a payment handler, validates these permits and settles the transactions on the TRON blockchain.
4. After payment confirmation, the Server delivers the resource to the Client Agent.

This framework ensures:
- **Trustless Transactions**: Payments are cryptographically verified and settled on-chain.
- **Flexible Interactions**: Agents interact seamlessly to execute workflows, even using basic underlying services.
- **Scalability**: Designed for microtransactions with minimal overhead, supporting decentralized applications (dApps).

---

## Table of Contents
1. [Core Components](#core-components)
2. [Environment Setup](#environment-setup)
3. [Running the Demo](#running-the-demo)
4. [Additional Documentation](#additional-documentation)

---

## Core Components

### **Server: Resource Provider Agent (Conceptual)**
- **Purpose:** Monetizes premium resources such as dynamically generated images via blockchain-based payments.
- **Features:**
  - Implements the x402 payment protocol (HTTP 402 Payment Required).
  - Protects resources by validating TRON blockchain transactions.

### **Facilitator: Payment Handler Agent (Conceptual)**
- **Purpose:** Processes and validates cryptographic payment permits.
- **Features:**
  - Ensures signed permits comply with the TIP-712 standard.
  - Settles micropayments on the TRON Nile Testnet.

### **Client: Requesting Agent**
- **CLI Client:**
  - Operates as an agent to sign permits and automate resource retrieval.
- **Web Client:**
  - Simulates manual agent-like behavior using the TronLink wallet.

---

## Environment Setup

### **Required Environment Variables**
Create a `.env` file in the project root to configure blockchain and service settings:

```env
# TRON private key for Facilitator's blockchain interactions.
TRON_PRIVATE_KEY=<your_tron_private_key>

# Payment recipient address for Server.
PAY_TO_ADDRESS=<server_recipient_tron_address>

# Server URL for accessing secured resources.
SERVER_URL=http://localhost:8000

# Facilitator API URL for payment validation.
FACILITATOR_URL=http://localhost:8001

# HTTP timeout for requests.
HTTP_TIMEOUT_SECONDS=60
```

### **Installation Steps**

1. **Clone the repository:**
   ```bash
   git clone <repo-url>
   cd x402-tron-demo
   ```

2. **Set up the `.env` file:**
   Configure environment variables as outlined above.

3. **Install dependencies:**
   ```bash
   pip install -r requirements.txt
   npm install # For web client dependencies
   ```

---

## Running the Demo

### **Using Shell Scripts**
To simplify running services:

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

### **Accessing the Demo**
1. **CLI Client:**
   Use the CLI to request `protected_image.png` from the server:
   ```bash
   ./start.sh client
   ```
   After resolving payment challenges (via TRON Nile), the protected resource will be downloaded locally.

2. **Web Client:**
   Navigate to `http://localhost:5173` (or `http://localhost:8080` if using Docker) to:
   - Connect your TronLink wallet.
   - Sign payment permits.
   - Access premium resources through the intuitive web interface.

### **Docker Setup**
Alternatively, deploy the demo containerized:
```bash
docker-compose up -d
```
Access services via:
- **Web Client**: `http://localhost:8080`
- **Server API**: `http://localhost:8000`

---

## Additional Documentation

- **System Architecture:** Explore inter-component communication in [ARCHITECTURE.md](ARCHITECTURE.md).
- **Server Details:** Resource management info in [SERVER.md](SERVER.md).
- **Facilitator Details:** Payment processing insights in [FACILITATOR.md](FACILITATOR.md).
- **Client Details:** Instructions for CLI and web demo in [CLIENT.md](CLIENT.md).