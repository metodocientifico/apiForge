
#!/bin/bash

# Test: Obtener lista de recursos
echo "Probando: Obtener lista de recursos (GET)"
curl -X GET "http://localhost:4010/resources" -H "accept: application/json"
echo -e "\n"

# Test: Crear un nuevo recurso
echo "Probando: Crear un nuevo recurso (POST)"
curl -X POST "http://localhost:4010/resources" -H "Content-Type: application/json" -d '{"nombre": "Recurso 3", "descripcion": "Descripción del recurso 3"}'
echo -e "\n"

# Test: Obtener un recurso por ID (GET)
echo "Probando: Obtener un recurso por ID (GET)"
curl -X GET "http://localhost:4010/resources/1" -H "accept: application/json"
echo -e "\n"

# Test: Actualizar un recurso por ID (PUT)
echo "Probando: Actualizar un recurso por ID (PUT)"
curl -X PUT "http://localhost:4010/resources/1" -H "Content-Type: application/json" -d '{"nombre": "Recurso actualizado", "descripcion": "Descripción actualizada del recurso"}'
echo -e "\n"

# Test: Eliminar un recurso por ID (DELETE)
echo "Probando: Eliminar un recurso por ID (DELETE)"
curl -X DELETE "http://localhost:4010/resources/1"
echo -e "\n"

echo "Pruebas completadas."
