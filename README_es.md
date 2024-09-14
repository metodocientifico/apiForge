
# APIForge

**APIForge** es una solución para la creación, simulación y prueba de APIs basadas en OpenAPI. Proporciona un entorno fácilmente desplegable con Swagger UI para la documentación y Prism para simular respuestas de las APIs.

## Estructura del Proyecto

```bash
apiForge/
├── collections/                 # Colecciones de Postman/Insomnia
│   └── api-test.collection.json # Colección de Postman/Insomnia para api-test.yaml
├── swagger/                     # Definiciones de las APIs
│   ├── api-test.yaml            # API principal para simulaciones CRUD
│   ├── other-api.yaml           # API adicional para productos
│   └── swagger-config.yaml      # Configuración para Swagger UI
├── tests/                       # Scripts de pruebas automatizadas
│   └── test_api.sh              # Script para pruebas usando curl
├── docker-compose.yaml          # Configuración de Docker Compose
├── LICENSE                      # Licencia del proyecto
└── README.md                    # Documentación del proyecto
```

## Requisitos

Asegúrate de tener instalados los siguientes requisitos:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Configuración y Ejecución

1. **Clonar el repositorio**:

   ```bash
   git clone https://github.com/tu_usuario/apiforge.git
   cd apiforge
   ```

2. **Iniciar los servicios con Docker Compose**:

   Ejecuta el siguiente comando para iniciar **Swagger UI**, **Prism Mock Server** y **Swagger Editor**:

   ```bash
   docker-compose up -d
   ```

   - **Swagger UI** estará disponible en `http://localhost:8080`.
   - **Prism Mock Server** estará disponible en `http://localhost:4010`.
   - **Swagger Editor** estará disponible en `http://localhost:8081` (configurado para cargar `api-test.yaml` por defecto).

3. **Verificar los logs**:

   Para revisar los logs del servidor mock, puedes ejecutar:

   ```bash
   docker logs prism-mock > ./logs/prism.log
   ```

## Uso de los Servicios

### Swagger UI

Puedes acceder a la documentación interactiva de tu API en **Swagger UI** vía:

- [http://localhost:8080](http://localhost:8080)

Aquí, podrás visualizar y probar los diferentes endpoints definidos en tus archivos de API.

### Mock Server (Prism)

El servidor mock está disponible en `http://localhost:4010`. Puedes enviar solicitudes a los endpoints definidos en `api-test.yaml` y `other-api.yaml`.

Ejemplo:

```bash
curl http://localhost:4010/resources
```

```bash
curl http://localhost:4010/products
```

### Pruebas Automatizadas

La carpeta `tests/` contiene el script Bash `test_api.sh` para ejecutar pruebas automatizadas. Puedes ejecutarlo con el siguiente comando:

```bash
bash tests/test_api.sh
```

Este script realiza varias operaciones en la API, incluyendo **GET**, **POST**, **PUT**, y **DELETE**.

### Colección de Postman

La carpeta `collections/` contiene una colección predefinida para **Postman** que puedes importar directamente en **Postman** para pruebas interactivas.

## Swagger Editor

Se ha agregado **Swagger Editor** al proyecto para permitir la edición directa de los archivos YAML de la API desde una interfaz web. Por defecto, carga el archivo `api-test.yaml`.

Puedes acceder a Swagger Editor en:

- [http://localhost:8081](http://localhost:8081)

Por el momento, Swagger Editor está configurado para cargar `api-test.yaml` por defecto. Si necesitas cambiar a otro archivo, puedes modificar el archivo `docker-compose.yml` o agregar múltiples instancias de Swagger Editor.

## Contribuciones

Si tienes ideas para mejorar **APIForge** o encuentras algún problema, no dudes en abrir un issue o enviar un pull request.

## Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.
