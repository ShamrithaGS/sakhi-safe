# Sakhi-Safe: System Architecture

## 🏗️ High-Level Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                  CLIENT LAYER                               │
├─────────────────────────────────────────────────────────────┤
│  Mobile App (React Native)  │  Web Dashboard (React/Vite)   │
│  - iOS                      │  - Admin Panel                │
│  - Android                  │  - Analytics                  │
└─────────────────────────────────────────────────────────────┘
                         ▼
┌─────────────────────────────────────────────────────────────┐
│              API GATEWAY LAYER (Node.js)                    │
├─────────────────────────────────────────────────────────────┤
│  - Authentication (JWT)                                     │
│  - Authorization (Role-based)                               │
│  - Rate Limiting                                            │
│  - WebSocket Server (Socket.io)                             │
│  - Request Validation                                       │
└─────────────────────────────────────────────────────────────┘
                         ▼
┌─────────────────────────────────────────────────────────────┐
│            MICROSERVICES LAYER                              │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────────┐ ┌──────────────┐ ┌──────────────┐       │
│  │ Safety       │ │ Location &   │ │ Community    │       │
│  │ Service      │ │ Route Svc    │ │ Service      │       │
│  │              │ │              │ │              │       │
│  │ - Scoring    │ │ - Routing    │ │ - Incidents  │       │
│  │ - Prediction │ │ - Tracking   │ │ - Heatmap    │       │
│  │ - Alerts     │ │ - Deviation  │ │ - Stats      │       │
│  └──────────────┘ └──────────────┘ └──────────────┘       │
│                                                             │
│  ┌──────────────┐ ┌──────────────┐                        │
│  │ Alert        │ │ User         │                        │
│  │ Service      │ │ Service      │                        │
│  │              │ │              │                        │
│  │ - Notif.     │ │ - Auth       │                        │
│  │ - SOS        │ │ - Profile    │                        │
│  │ - Emergency  │ │ - Contacts   │                        │
│  └──────────────┘ └──────────────┘                        │
│                                                             │
└─────────────────────────────────────────────────────────────┘
                         ▼
┌─────────────────────────────────────────────────────────────┐
│            ML INFERENCE LAYER (Python/Flask)               │
├─────────────────────────────────────────────────────────────┤
│  - Safety Scoring Model (Random Forest/XGBoost)             │
│  - Incident Prediction (Neural Network)                     │
│  - Geospatial Analysis                                      │
│  - Crowding Density Estimation                              │
└─────────────────────────────────────────────────────────────┘
                         ▼
┌─────────────────────────────────────────────────────────────┐
│            DATA LAYER                                       │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────────┐ ┌──────────────┐ ┌──────────────┐       │
│  │ PostgreSQL   │ │ Redis        │ │ Firebase     │       │
│  │ (Persistent) │ │ (Cache)      │ │ (Real-time)  │       │
│  │              │ │              │ │              │       │
│  │ - Users      │ │ - Sessions   │ │ - Events     │       │
│  │ - Routes     │ │ - Hot data   │ │ - Analytics  │       │
│  │ - Incidents  │ │ - Tokens     │ │ - Messaging  │       │
│  │ - Alerts     │ │              │ │              │       │
│  └──────────────┘ └──────────────┘ └──────────────┘       │
│                                                             │
└─────────────────────────────────────────────────────────────┘
```

## 🤖 AI Safety Engine Architecture

### 6-Factor Safety Scoring Algorithm

```python
Safety_Score = (0.25 × Location_Risk) +
               (0.20 × Time_Risk) +
               (0.20 × Crowd_Risk) +
               (0.15 × Lighting_Risk) +
               (0.15 × Historical_Risk) +
               (0.05 × Driver_Risk)

# Output: 0-100 (100 = Safest)
```

### Factor Definitions

**1. Location Risk (25% weight)**
- Geofencing dangerous zones
- Crime hotspot data
- Infrastructure quality
- Isolation score

**2. Time Risk (20% weight)**
- Hour of day (peak vs off-peak)
- Day of week (weekday vs weekend)
- Seasonal patterns
- Event-based anomalies

**3. Crowd Risk (20% weight)**
- Pedestrian density
- Vehicle density
- Event data (concerts, protests)
- Evacuation alerts

**4. Lighting Risk (15% weight)**
- Street lighting status
- Natural light (day/night)
- Weather conditions
- Emergency lighting

**5. Historical Incident Risk (15% weight)**
- Past 30-day incidents
- Incident type distribution
- Trend analysis
- Seasonal patterns

**6. Driver Risk (5% weight)**
- Driver rating (1-5 stars)
- Safety violations
- Trip history
- Verification status

## 📊 Data Flow Architecture

```
┌──────────────┐
│ User Location│
│ (GPS Track) │
└────────┬─────┘
         │
         ▼
    ┌────────────────┐
    │ Location Service│
    │ - Validate GPS  │
    │ - Geocode      │
    │ - Map match    │
    └────────┬───────┘
             │
             ▼
    ┌────────────────────┐
    │ Safety Scorer      │
    │ - Extract features │
    │ - Query Redis      │
    │ - Call ML Engine   │
    └────────┬───────────┘
             │
             ▼
    ┌────────────────┐
    │ Risk Assessment│
    │ - Score < 60?  │
    │ - Trend check  │
    └────────┬───────┘
             │
         ┌───┴───┐
         │       │
         ▼       ▼
      Safe    Risky
      │         │
      │         ▼
      │    ┌────────────┐
      │    │ Alert Gen  │
      │    │ - Type     │
      │    │ - Severity │
      │    │ - Targets  │
      │    └────────┬───┘
      │             │
      ├─────────────┤
      │             │
      ▼             ▼
  ┌─────────────────────┐
  │ Notification Service│
  │ - WebSocket emit    │
  │ - Push notif        │
  │ - SMS/Email         │
  │ - In-app alert      │
  └─────────────────────┘
```

## 🗄️ Database Schema

### Core Tables

```sql
-- Users Table
CREATE TABLE users (
    id UUID PRIMARY KEY,
    phone_number VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(255),
    email VARCHAR(255),
    password_hash VARCHAR(255),
    avatar_url VARCHAR(500),
    verification_status VARCHAR(50),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- Routes Table
CREATE TABLE routes (
    id UUID PRIMARY KEY,
    user_id UUID REFERENCES users(id),
    start_location POINT NOT NULL,
    end_location POINT NOT NULL,
    waypoints JSONB,
    safety_score DECIMAL(5,2),
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT NOW()
);

-- Incidents Table
CREATE TABLE incidents (
    id UUID PRIMARY KEY,
    location POINT NOT NULL,
    incident_type VARCHAR(100),
    severity INT (1-5),
    description TEXT,
    reporter_id UUID REFERENCES users(id),
    verified BOOLEAN DEFAULT FALSE,
    timestamp TIMESTAMP DEFAULT NOW()
);

-- Alerts Table
CREATE TABLE alerts (
    id UUID PRIMARY KEY,
    user_id UUID REFERENCES users(id),
    alert_type VARCHAR(100),
    message TEXT,
    severity VARCHAR(50),
    status VARCHAR(50),
    triggered_at TIMESTAMP DEFAULT NOW(),
    acknowledged_at TIMESTAMP
);

-- Trusted Contacts Table
CREATE TABLE trusted_contacts (
    id UUID PRIMARY KEY,
    user_id UUID REFERENCES users(id),
    name VARCHAR(255),
    phone_number VARCHAR(20),
    relationship VARCHAR(100),
    is_emergency BOOLEAN DEFAULT FALSE,
    auto_share BOOLEAN DEFAULT TRUE
);
```

## 🔐 Security Architecture

### Authentication Flow

```
User Login
    │
    ▼
[Phone OTP Verification]
    │
    ▼
[JWT Token Generation]
    ├─ Access Token (15 min)
    └─ Refresh Token (30 days)
    │
    ▼
[Token Stored in Secure Storage]
    │
    ▼
[Requests Include Bearer Token]
    │
    ▼
[JWT Validation Middleware]
    ├─ Signature Check
    ├─ Expiry Check
    └─ User Status Check
    │
    ▼
[Grant/Deny Access]
```

### Encryption Strategy

- **Location Data**: AES-256 encryption at rest
- **User Contacts**: TDE (Transparent Data Encryption)
- **Communications**: TLS 1.3 in transit
- **Sensitive Fields**: Hashing with bcrypt (rounds: 10)

## 📈 Scalability Strategy

### Horizontal Scaling

1. **API Layer**: Multiple Node.js instances behind Load Balancer
2. **ML Engine**: Multiple Python workers for inference
3. **Database**: Read replicas for reporting
4. **Cache**: Redis cluster for distributed caching

### Performance Optimization

1. **Caching Strategy**
   - Redis for session data (TTL: 24h)
   - Safety scores cached (TTL: 5 min)
   - Heatmap data cached (TTL: 1h)

2. **Database Optimization**
   - Indexing on frequently queried fields
   - Partitioning incidents table by date
   - Connection pooling

3. **API Optimization**
   - Rate limiting (100 req/15 min per user)
   - Request batching
   - Response compression (gzip)

## 🚀 Deployment Architecture

### Local Development
- Docker Compose (4 services)
- PostgreSQL + Redis + Backend + ML Engine

### Production
- Kubernetes Cluster
- Horizontal Pod Autoscaling
- Service mesh (optional: Istio)
- Ingress controller for routing
- Persistent volumes for databases
- StatefulSets for databases
- ConfigMaps for configuration
- Secrets for sensitive data

## 📡 Real-Time Communication

### WebSocket Events

```
Client                          Server
  │                              │
  ├─────[connect]─────────────────>
  │                              │
  ├─────[subscribe_location]────────>
  │                      <──[ack]───┤
  │                              │
  │                    [location_update]
  │                      <─────────────┤
  │                              │
  ├─────[update_location]─────────────>
  │                              │
  │                    [safety_alert]
  │                      <─────────────┤
  │                              │
  │                    [route_deviation]
  │                      <─────────────┤
  │                              │
  ├─────[acknowledge_alert]────────────>
  │                              │
  ├─────[disconnect]──────────────────>
  │                              │
```

## 🎯 API Rate Limiting

- **Default**: 100 requests per 15 minutes
- **Authenticated**: 1000 requests per hour
- **Admin**: Unlimited
- **Sliding window algorithm**
- **Redis-backed** for distributed systems

## 📊 Monitoring & Observability

### Metrics Collection
- Prometheus for metrics
- Grafana for visualization
- ELK Stack for logging
- Sentry for error tracking

### Key Metrics
- API response time (p50, p95, p99)
- ML inference latency
- Database query performance
- Cache hit ratio
- Error rates by endpoint
- Alert delivery time
- User active sessions

---

**This architecture is designed for performance, security, and scalability in a production environment.**
