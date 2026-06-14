#!/bin/bash
set -e

echo "🚀 Sakhi-Safe Deployment Script"

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check prerequisites
echo "${YELLOW}Checking prerequisites...${NC}"

if ! command -v docker &> /dev/null; then
    echo "${RED}Docker not found. Please install Docker.${NC}"
    exit 1
fi

if ! command -v kubectl &> /dev/null; then
    echo "${RED}kubectl not found. Please install kubectl.${NC}"
    exit 1
fi

echo "${GREEN}✓ Prerequisites met${NC}"

# Build Docker images
echo "${YELLOW}Building Docker images...${NC}"
docker-compose build
echo "${GREEN}✓ Docker images built${NC}"

# Deploy to Kubernetes
echo "${YELLOW}Deploying to Kubernetes...${NC}"
kubectl apply -f infrastructure/kubernetes/postgres-statefulset.yaml
kubectl apply -f infrastructure/kubernetes/backend-deployment.yaml
kubectl apply -f infrastructure/kubernetes/ml-deployment.yaml
kubectl apply -f infrastructure/kubernetes/redis-deployment.yaml
echo "${GREEN}✓ Kubernetes deployment complete${NC}"

# Wait for services to be ready
echo "${YELLOW}Waiting for services to be ready...${NC}"
kubectl wait --for=condition=ready pod -l app=sakhi-safe --timeout=300s
echo "${GREEN}✓ All services are ready${NC}"

echo "${GREEN}🎉 Deployment successful!${NC}"
echo "${YELLOW}Access the application:${NC}"
echo "kubectl port-forward svc/backend-service 3000:80"
