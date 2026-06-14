# Sakhi-Safe API Documentation

## Base URL

```
http://localhost:3000/api
```

## Authentication

All endpoints (except `/auth/*`) require Bearer token in Authorization header:

```
Authorization: Bearer <access_token>
```

## Endpoints

### Authentication

#### Register
```
POST /auth/register
Content-Type: application/json

{
  "phone_number": "+91XXXXXXXXXX",
  "name": "Jane Doe",
  "email": "jane@example.com"
}

Response: 201 Created
{
  "id": "uuid",
  "phone_number": "+91XXXXXXXXXX",
  "name": "Jane Doe",
  "access_token": "jwt_token",
  "refresh_token": "refresh_token"
}
```

#### Login
```
POST /auth/login
Content-Type: application/json

{
  "phone_number": "+91XXXXXXXXXX",
  "otp": "123456"
}

Response: 200 OK
{
  "access_token": "jwt_token",
  "refresh_token": "refresh_token"
}
```

### Safety

#### Get Safety Score
```
GET /safety/score?latitude=28.7041&longitude=77.1025

Response: 200 OK
{
  "score": 82,
  "risk_level": "safe",
  "factors": {
    "location_risk": 25,
    "time_risk": 15,
    "crowd_risk": 20,
    "lighting_risk": 18,
    "historical_risk": 10,
    "driver_risk": 5
  },
  "recommendations": [
    "Area is generally safe",
    "Good crowd presence"
  ],
  "timestamp": "2024-01-15T10:30:00Z"
}
```

#### Get Safety Heatmap
```
GET /safety/heatmap?north=28.8&south=28.6&east=77.2&west=77.0

Response: 200 OK
{
  "data": [
    {
      "lat": 28.7,
      "lng": 77.1,
      "safety_score": 82,
      "risk_level": "safe"
    },
    ...
  ],
  "bounds": {
    "north": 28.8,
    "south": 28.6,
    "east": 77.2,
    "west": 77.0
  }
}
```

#### Report Incident
```
POST /safety/report-incident
Content-Type: application/json

{
  "latitude": 28.7041,
  "longitude": 77.1025,
  "incident_type": "harassment",
  "severity": 3,
  "description": "Verbal harassment at station"
}

Response: 201 Created
{
  "id": "uuid",
  "status": "reported",
  "timestamp": "2024-01-15T10:30:00Z"
}
```

### Routes

#### Calculate Safe Route
```
POST /routes/calculate
Content-Type: application/json

{
  "start": {
    "latitude": 28.7041,
    "longitude": 77.1025
  },
  "end": {
    "latitude": 28.7050,
    "longitude": 77.1035
  }
}

Response: 200 OK
{
  "route": {
    "waypoints": [...],
    "distance": 1.2,
    "duration": 5,
    "safety_score": 85,
    "risk_zones": []
  }
}
```

### Alerts

#### Trigger SOS
```
POST /alerts/sos
Content-Type: application/json

{
  "latitude": 28.7041,
  "longitude": 77.1025,
  "message": "Emergency - need help"
}

Response: 201 Created
{
  "alert_id": "uuid",
  "status": "active",
  "contacts_notified": 3,
  "authorities_contacted": true
}
```

#### Get Active Alerts
```
GET /alerts/active

Response: 200 OK
[
  {
    "id": "uuid",
    "type": "route_deviation",
    "severity": "high",
    "message": "You have deviated from planned route",
    "created_at": "2024-01-15T10:30:00Z"
  },
  ...
]
```

### Community

#### Get Nearby Incidents
```
GET /community/incidents?latitude=28.7041&longitude=77.1025&radius=2

Response: 200 OK
[
  {
    "id": "uuid",
    "location": {"latitude": 28.7041, "longitude": 77.1025},
    "type": "harassment",
    "severity": 3,
    "timestamp": "2024-01-15T10:00:00Z",
    "verified": true
  },
  ...
]
```

## Error Responses

### 400 Bad Request
```json
{
  "error": "Invalid parameters",
  "details": "latitude is required"
}
```

### 401 Unauthorized
```json
{
  "error": "Unauthorized",
  "details": "Invalid or expired token"
}
```

### 404 Not Found
```json
{
  "error": "Not found",
  "details": "Resource not found"
}
```

### 500 Internal Server Error
```json
{
  "error": "Internal server error",
  "details": "Error processing request"
}
```

## Rate Limiting

- **Default**: 100 requests per 15 minutes
- **Headers**: 
  - `X-RateLimit-Limit`: Total requests allowed
  - `X-RateLimit-Remaining`: Requests remaining
  - `X-RateLimit-Reset`: Timestamp when limit resets

## WebSocket Events

### Connect
```javascript
socket.on('connect', () => {
  console.log('Connected to server');
});
```

### Subscribe to Location Updates
```javascript
socket.emit('subscribe_location_updates', userId);
socket.on('location_update', (data) => {
  console.log('Location updated:', data);
});
```

### Subscribe to Alerts
```javascript
socket.emit('subscribe_alerts', userId);
socket.on('safety_alert', (alert) => {
  console.log('Alert received:', alert);
});
```

---

For more information, visit: https://github.com/ShamrithaGS/sakhi-safe
