# 🛡️ Sakhi-Safe: AI-Powered Women's Safety Platform

> **Hackathon-Winning Real-Time Safety Intelligence System**

![Version](https://img.shields.io/badge/version-1.0.0--hackathon-blue)
![Status](https://img.shields.io/badge/status-Production%20Ready-brightgreen)
![License](https://img.shields.io/badge/license-MIT-green)

## 🎯 Vision

Sakhi-Safe is an **AI-powered, real-time community safety platform** designed specifically for women's security. Unlike existing ride-sharing apps (Ola, Uber) that focus on route planning, Sakhi-Safe adds an intelligent safety layer:

- **🤖 Real-Time AI Safety Scoring**: Analyzes 6+ factors simultaneously
- **🗺️ Intelligent Route Selection**: Recommends safest routes, not fastest
- **👁️ Blind Spot Detection**: Real-time crowd/lighting/incident awareness
- **🌐 Community Safety Intelligence**: Crowdsourced incident data + predictive modeling
- **🚨 One-Tap Emergency Response**: Auto-shares location with trusted contacts + authorities

## 🏗️ Architecture Overview

**Microservices Stack:**
- Frontend: React Native (Mobile) + React/Vite (Web)
- Backend: Node.js + Express + WebSocket
- ML Engine: Python + TensorFlow/Scikit-learn
- Databases: PostgreSQL + Redis + Firebase
- Deployment: Docker + Kubernetes

## 🧠 AI Safety Engine: 6-Factor Evaluation

```python
Safety Score = (
    0.25 * Location_Risk +
    0.20 * Time_Risk +
    0.20 * Crowd_Risk +
    0.15 * Lighting_Risk +
    0.15 * Historical_Incident_Risk +
    0.05 * Driver_Behavior_Risk
)

# Real-time evaluation every 30 seconds
# Triggers alerts when score < 60
```

## 📦 Project Structure

```
sakhi-safe/
├── backend/                    # Node.js API Server
│   ├── src/
│   │   ├── api/               # REST endpoints
│   │   ├── services/          # Business logic
│   │   ├── middleware/        # Auth, validation
│   │   ├── models/            # DB schemas
│   │   └── config/            # Environment config
│   ├── migrations/            # Database migrations
│   ├── tests/                 # Test suites
│   ├── Dockerfile
│   └── package.json
│
├── ml_engine/                 # Python ML Pipeline
│   ├── safety_scorer.py       # Main scoring algorithm
│   ├── location_analyzer.py   # Geospatial analysis
│   ├── incident_predictor.py  # ML model
│   ├── app.py                 # Flask API
│   ├── models/                # Pre-trained models
│   ├── requirements.txt
│   └── Dockerfile
│
├── frontend/
│   ├── mobile/                # React Native
│   │   ├── src/
│   │   │   ├── screens/       # App screens
│   │   │   ├── components/    # UI components
│   │   │   ├── services/      # API client
│   │   │   └── redux/         # State management
│   │   └── package.json
│   │
│   └── web/                   # React web dashboard
│       ├── src/
│       └── package.json
│
├── infrastructure/            # DevOps
│   ├── docker-compose.yml
│   ├── kubernetes/
│   └── scripts/
│
└── docs/                      # Documentation
    ├── API.md
    ├── ARCHITECTURE.md
    └── DEPLOYMENT.md
```

## ⚡ Key Features

### 1. Real-Time Safety Scoring
- Live AI evaluation every 30 seconds
- Multi-factor risk assessment
- Predictive incident forecasting
- Instant notifications

### 2. Intelligent Route Planning
- Safety-first routing (not speed-first)
- Real-time crowd density analysis
- Automated route deviation alerts
- Alternative safe routes

### 3. Community Safety Network
- Incident crowdsourcing
- Heatmap visualization (green/yellow/red zones)
- Trusted contact auto-sharing
- Live community feed

### 4. Emergency Response System
- One-tap SOS activation
- Automatic location sharing
- Direct communication with authorities
- Emergency hotline integration (100, 108, 1091, 1098)

## 🔐 Security & Privacy

- End-to-end encryption for sensitive data
- Zero-knowledge architecture for location privacy
- GDPR compliant data handling
- Secure token refresh mechanism
- Rate limiting & DDoS protection
- No data retention without consent

## 🚀 Quick Start

### Prerequisites
- Node.js 18+
- Python 3.9+
- Docker & Docker Compose
- Firebase account
- Google Maps API key

### Local Development Setup

```bash
# Clone repository
git clone https://github.com/ShamrithaGS/sakhi-safe.git
cd sakhi-safe

# Setup environment
cp .env.example .env
# Edit .env with your API keys

# Start all services with Docker
docker-compose up -d

# Backend
cd backend
npm install
npm run dev
# Backend runs on http://localhost:3000

# In new terminal - ML Engine
cd ml_engine
pip install -r requirements.txt
python app.py
# ML Engine runs on http://localhost:5000

# In new terminal - Frontend Web
cd frontend/web
npm install
npm run dev
# Web dashboard runs on http://localhost:5173
```

## 📊 Performance Targets

| Metric | Target |
|--------|--------|
| API Response Time (p95) | < 200ms |
| Safety Score Computation | < 150ms |
| Location Update Latency | < 5 seconds |
| Alert Delivery | < 2 seconds |
| System Uptime | 99.9% |

## 🏆 Hackathon Differentiation

| Feature | Sakhi-Safe | Uber/Ola |
|---------|-----------|----------|
| Safety-First Routing | ✅ | ❌ |
| Real-Time Safety Scoring | ✅ | ❌ |
| Blind Spot Detection | ✅ | ❌ |
| Community Safety Intel | ✅ | ✅ (limited) |
| Predictive Risk Modeling | ✅ | ❌ |
| One-Tap Emergency Response | ✅ | ❌ |
| Automated Trusted Contacts | ✅ | ❌ |
| Multi-Factor Safety Analysis | ✅ | ❌ |

## 🧪 Testing

```bash
# Unit tests
npm run test:unit

# Integration tests
npm run test:integration

# E2E tests
npm run test:e2e

# Load testing
npm run test:load

# Coverage report
npm run test:coverage
```

## 📈 Scalability

- Microservices architecture (Kubernetes-ready)
- Horizontal scaling for API layer
- Redis caching for hot data
- Batch processing for ML inference
- CDN integration for static assets
- Database replication for high availability

## 🔗 API Endpoints

### Authentication
```
POST   /api/auth/register
POST   /api/auth/login
POST   /api/auth/refresh
POST   /api/auth/logout
```

### Safety
```
GET    /api/safety/score
GET    /api/safety/heatmap
POST   /api/safety/report-incident
GET    /api/safety/blind-spots
```

### Routes
```
POST   /api/routes/calculate
GET    /api/routes/active
POST   /api/routes/deviation
GET    /api/routes/history
```

### Community
```
GET    /api/community/incidents
GET    /api/community/feed
GET    /api/community/stats
```

### Alerts
```
POST   /api/alerts/sos
GET    /api/alerts/active
POST   /api/alerts/acknowledge
```

## 🌍 Deployment

### Docker
```bash
docker-compose up -d
```

### Kubernetes
```bash
kubectl apply -f infrastructure/kubernetes/
```

### Cloud (AWS/GCP/Azure)
See [DEPLOYMENT.md](docs/DEPLOYMENT.md) for detailed instructions.

## 📱 Mobile App Features

- ✅ Real-time location tracking
- ✅ Live safety score ring animation
- ✅ Route deviation simulator
- ✅ Emergency SOS button (pulsing animation)
- ✅ Safety heatmap visualization
- ✅ Community incident feed
- ✅ Trusted contacts management
- ✅ Historical incident data
- ✅ Dark mode (designed for night safety)
- ✅ Offline mode support

## 🎨 Design System

**Color Palette:**
- Deep Violet: `#1A0A2E` (Primary)
- Electric Magenta: `#E91E8C` (Accent)
- Soft Lavender: `#C4A8FF` (Secondary)
- White: `#FFFFFF` (Text/Background)
- Danger Red: `#FF3B5C` (Alerts)

**Typography:**
- Display/Headings: Space Grotesk
- Body: Inter

## 📚 Documentation

- [API Documentation](docs/API.md)
- [Architecture Design](ARCHITECTURE.md)
- [Deployment Guide](docs/DEPLOYMENT.md)
- [Contributing Guidelines](CONTRIBUTING.md)

## 🤝 Contributing

Contribution guidelines coming soon!

## 📝 License

MIT License © 2024 Sakhi-Safe

## 🏅 Hackathon Submission

**Project:** Sakhi-Safe  
**Category:** AI/ML + Safety + Social Impact  
**Status:** 🚀 Live & Demo-Ready  
**Repository:** https://github.com/ShamrithaGS/sakhi-safe

---

**Let's build a safer future together. 🛡️**
