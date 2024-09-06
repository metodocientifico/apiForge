#!/bin/bash

# Test para obtener lista de recursos con un token Bearer correcto
echo "Probando API de recursos con token Bearer correcto..."
curl -H "Authorization: Bearer VALID_JWT_TOKEN" http://localhost:4010/resources

# Test para obtener lista de recursos sin token (debería devolver 401)
echo "Probando API de recursos sin token..."
curl http://localhost:4010/resources

# Test para obtener lista de recursos con API Key correcta
echo "Probando API de recursos con API Key correcta..."
curl -H "X-API-Key: VALID_API_KEY" http://localhost:4010/resources

# Test para obtener lista de recursos con API Key incorrecta (debería devolver 401)
echo "Probando API de recursos con API Key incorrecta..."
curl -H "X-API-Key: INVALID_API_KEY" http://localhost:4010/resources

# Fin del script de pruebas
echo "Pruebas finalizadas."
