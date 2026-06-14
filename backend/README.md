# Sakhi-Safe Backend

Node.js + Express API Server for Sakhi-Safe platform.

## 🚀 Quick Start

```bash
npm install
npm run dev
```

Server runs on `http://localhost:3000`

## 📁 Project Structure

```
src/
├── api/
│   ├── routes/           # Express route handlers
│   └── controllers/       # Request handlers
├── services/             # Business logic
├── middleware/           # Express middleware
├── models/               # TypeScript interfaces
├── config/               # Configuration
├── utils/                # Helper functions
└── app.ts               # Main application
```

## 🛠️ Available Scripts

- `npm run dev` - Start development server with hot reload
- `npm run build` - Build TypeScript
- `npm start` - Start production server
- `npm test` - Run tests
- `npm run lint` - Run ESLint
- `npm run format` - Format code with Prettier

## 📚 API Documentation

See [API.md](../docs/API.md) for complete API documentation.

## 🔐 Environment Variables

Copy `.env.example` to `.env` and fill in values:

```bash
cp .env.example .env
```

## 🐳 Docker

```bash
docker build -t sakhi-safe-backend .
docker run -p 3000:3000 --env-file .env sakhi-safe-backend
```

## 📝 License

MIT
