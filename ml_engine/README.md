# Sakhi-Safe ML Engine

Python Flask API for AI-powered safety scoring.

## 🚀 Quick Start

```bash
pip install -r requirements.txt
python app.py
```

Server runs on `http://localhost:5000`

## 📚 Endpoints

- `GET /health` - Health check
- `POST /predict` - Calculate safety score
- `POST /analyze-blind-spots` - Analyze route blind spots
- `GET /heatmap` - Get safety heatmap

## 🧠 Models

Pre-trained models are stored in `models/` directory:
- `safety_model.pkl` - Main safety scoring model
- `scaler.pkl` - Feature scaler

## 🐳 Docker

```bash
docker build -t sakhi-safe-ml .
docker run -p 5000:5000 sakhi-safe-ml
```

## 📝 License

MIT
