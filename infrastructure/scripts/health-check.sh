#!/bin/bash

# Health check script for Sakhi-Safe services

echo "Checking Sakhi-Safe services health..."

# Backend health check
echo -n "Backend: "
if curl -s http://localhost:3000/health > /dev/null 2>&1; then
    echo "✓ Healthy"
else
    echo "✗ Unhealthy"
    exit 1
fi

# ML Engine health check
echo -n "ML Engine: "
if curl -s http://localhost:5000/health > /dev/null 2>&1; then
    echo "✓ Healthy"
else
    echo "✗ Unhealthy"
    exit 1
fi

# PostgreSQL health check
echo -n "PostgreSQL: "
if pg_isready -h localhost -p 5432 > /dev/null 2>&1; then
    echo "✓ Healthy"
else
    echo "✗ Unhealthy"
    exit 1
fi

# Redis health check
echo -n "Redis: "
if redis-cli -h localhost -p 6379 ping > /dev/null 2>&1; then
    echo "✓ Healthy"
else
    echo "✗ Unhealthy"
    exit 1
fi

echo ""
echo "✓ All services are healthy!"
