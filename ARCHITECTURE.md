# System Architecture

## Overview

The X402-Tron ecosystem demonstrates the implementation of the **x402 payment protocol**, integrating blockchain micropayments with protected resource access. It consists of three core components:

- **Client**: Initiates requests and handles signed permits.
- **Server**: Hosts protected resources, validating payments using Facilitator.
- **Facilitator**: Processes and settles transactions on the TRON blockchain.

---

## Component Interactions

A simplified breakdown of the code-driven workflow:

1. **Client**:
   - CLI: Uses Python to initiate requests and sign cryptographic permits.
     ```python
     response = client.get("/protected")
     if response.status_code == 402:
         signed_permit = sign_payment_permit()  # TIP-712 signature
         facilitator.settle(signed_permit)
     ```
   - Web Client: React app prompting TronLink wallet interaction.

2. **Server**:
   - FastAPI backend enforcing pay-per-access via `x402_protected`:
     ```python
     @app.get("/protected")
     @x402_protected
     def protected_resource():
         return generate_image()
     ```

3. **Facilitator**:
   - Validates permits and settles transactions using TRON APIs:
     ```python
     @app.post("/settle")
     def settle_payment(permit):
         return tron_api.verify_and_settle(permit)
     ```

---

## Data Flow

1. **Resource Request**:
   - Client requests `/protected`, receiving `402 Payment Required`.
2. **Permit Signing**:
   - Payment permit signed via TronLink (Web) or Python SDK (CLI).
3. **Transaction Settlement**:
   - Facilitator verifies and confirms receipt using TRON Nile Testnet.
4. **Resource Delivery**:
   - Server validates permits and delivers the resource.

---

## Why X402?

Leveraging HTTP `402 Payment Required` with blockchain:

- **Decentralization**: TRON blockchain ensures secure processing and payment verification.
- **Scalability**: Protocol supports varying payment schemes for dynamic resources.
- **Integration**: Application-specific plug-ins simplify adoption.