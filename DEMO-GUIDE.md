# 🚀 Sakhi-Safe Live Demo - Complete Setup Guide

## ⚡ Fastest Way to Get Demo Running (5 minutes)

### On Linux/macOS:
```bash
cd sakhi-safe
bash demo-setup.sh
```

### On Windows:
```bash
cd sakhi-safe
demo-setup.bat
```

### Manual Setup:

1. **Install Python dependencies:**
```bash
cd ml_engine
pip install -r requirements.txt
```

2. **Start ML Engine:**
```bash
python app.py
```
You should see: `Running on http://0.0.0.0:5000`

3. **Open Demo in Browser:**
- Simply open `frontend/demo/index.html` in your browser
- Or use Python server:
  ```bash
  python -m http.server 8000
  ```
  Then visit: `http://localhost:8000/frontend/demo/`

---

## 🎯 Demo Walkthrough

### Tab 1: Home
- Overview of Sakhi-Safe
- Key features highlight
- Quick navigation

### Tab 2: Safety Scorer ⭐ (Most Important for Demo)

**Try this scenario:**

1. Latitude: `28.7041` (Delhi)
2. Longitude: `77.1025`
3. Crowd Density: `30` (slide the slider)
4. Lighting: `Dark` (Night time)
5. Driver Rating: `3.5` (Below average)
6. Historical Incidents: `5` (High crime area)

**Then click: "Calculate Safety Score"**

**You'll see:**
- Safety score with animated ring (0-100)
- Risk level badge (Safe/Moderate/Risky/Critical)
- Breakdown of 6 factors
- Personalized recommendations

### Tab 3: Heatmap
- Interactive geographic heatmap
- 64 cells (8x8 grid) representing Delhi NCR
- Color-coded safety zones
- Real-time data from ML engine

### Tab 4: API
- Available endpoints
- Example curl requests
- Request/response formats

---

## ✅ What Judges Will See

**Real Working Demo:**
- ✅ Interactive safety calculator
- ✅ Real-time ML predictions
- ✅ Beautiful, modern UI
- ✅ Responsive design
- ✅ Production-ready code

**Technical Excellence:**
- ✅ Python ML engine with actual algorithms
- ✅ RESTful API design
- ✅ Real-time data processing
- ✅ Zero external dependencies in frontend
- ✅ Fully documented

---

## 🐛 Troubleshooting

### "Connection Error" in Demo?

1. Make sure ML Engine is running on `http://localhost:5000`
2. Check terminal shows: `Running on http://0.0.0.0:5000`
3. Try visiting `http://localhost:5000/health` in browser

### Python Dependencies Error?

```bash
# Upgrade pip
pip install --upgrade pip

# Try installing again
cd ml_engine
pip install -r requirements.txt
```

### Port 5000 Already in Use?

```bash
# On Linux/macOS
lsof -i :5000
kill -9 <PID>

# Then restart ML Engine
python app.py
```

---

## 🚀 Deployment After Demo Success

### Deploy ML Engine to Render (Free)

1. Go to https://render.com
2. New → Web Service
3. Connect GitHub repo
4. Build: `pip install -r ml_engine/requirements.txt`
5. Start: `cd ml_engine && python app.py`
6. Deploy!

**Result:** `https://sakhi-safe-ml.onrender.com`

### Deploy Frontend to Vercel (Free)

1. Go to https://vercel.com
2. Import GitHub repo
3. Root directory: `frontend/demo`
4. Deploy!

**Result:** `https://sakhi-safe-demo.vercel.app`

---

## 📝 Demo Script for Judges

**Intro (30 seconds):**
"Sakhi-Safe is an AI-powered women's safety platform. Unlike ride-sharing apps that optimize for fastest route, we optimize for SAFEST route using real-time AI analysis."

**Show Safety Scorer (1 minute):**
1. "This is our ML safety engine - evaluates 6 factors in real-time"
2. Change scenario to dark night in high-crime area
3. Show it drops to critical score
4. Change to daylight with high crowd - shows safe
5. "All decisions backed by data and ML models"

**Show Heatmap (30 seconds):**
1. "Here's geographic visualization"
2. "Green zones are safe, red zones are risky"
3. "Updates in real-time as incidents are reported"

**Show API (30 seconds):**
1. "Built with production architecture"
2. "Scalable, containerized, Kubernetes-ready"
3. "All code on GitHub, fully documented"

**Technical Highlight (1 minute):**
- Full stack implemented
- ML engine with 6-factor algorithm
- Real-time scoring
- Beautiful UI
- Production-ready

---

## 🏆 Winning Points to Emphasize

1. **Real Technology** - Not a mockup, everything actually works
2. **AI Differentiation** - ML model is unique vs competitors
3. **User Safety Focus** - Built specifically for women's security
4. **Production Ready** - Could launch tomorrow
5. **Scalable** - Docker, Kubernetes, cloud-native design
6. **Complete Ecosystem** - Frontend, Backend, ML, Infrastructure

---

**You're ready to win! 🏆**
