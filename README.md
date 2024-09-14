
# APIForge

**APIForge** es una solución para la creación, simulación y prueba de APIs basadas en OpenAPI. Proporciona un entorno fácilmente desplegable con Swagger UI para la documentación y Prism para simular respuestas de las APIs.

## Estructura del Proyecto

```bash
apiForge/
├── collections/                 # Colecciones de Postman
│   └── apiforge.postman_collection.json  # Colección de Postman para pruebas
├── swagger/                     # Definiciones de las APIs
│   ├── api-test.yaml            # API principal para simulaciones CRUD
│   ├── other-api.yaml           # API adicional de productos
│   └── swagger-config.yaml      # Configuración para Swagger UI
├── tests/                       # Scripts de pruebas automatizadas
│   └── test_api.sh              # Script para pruebas con curl
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

2. **Levantar los servicios con Docker Compose**:

   Ejecuta el siguiente comando para iniciar **Swagger UI** y el **Prism Mock Server**:

   ```bash
   docker-compose up -d
   ```

   - **Swagger UI** estará disponible en `http://localhost:8080`.
   - **Prism Mock Server** estará en `http://localhost:4010`.

3. **Verificar los logs**:

   Si deseas ver los logs del servidor mock, puedes ejecutar el siguiente comando:

   ```bash
   docker logs prism-mock > ./logs/prism.log
   ```

## Uso de los Servicios

### Swagger UI

Puedes acceder a la documentación interactiva de tu API en **Swagger UI** desde la siguiente URL:

- [http://localhost:8080](http://localhost:8080)

En esta interfaz, podrás visualizar y probar los diferentes endpoints definidos en los archivos de API.

### Mock Server (Prism)

El servidor mock está disponible en `http://localhost:4010`. Puedes hacer solicitudes a los endpoints definidos en `api-test.yaml` y `other-api.yaml`.

Por ejemplo, puedes probar los siguientes endpoints:

```bash
curl http://localhost:4010/resources
```

```bash
curl http://localhost:4010/products
```

### Tests Automatizados

En la carpeta `tests/` se encuentra el script Bash `test_api.sh` para ejecutar pruebas automatizadas. Puedes ejecutarlo con el siguiente comando:

```bash
bash tests/test_api.sh
```

Este script realizará varias pruebas en la API, incluyendo operaciones **GET**, **POST**, **PUT** y **DELETE**.

### Colección de Postman

En la carpeta `collections/` se encuentra una colección predefinida para **Postman**. Puedes importarla directamente en **Postman** para realizar pruebas interactivas.

## Contribuciones

Si tienes ideas para mejorar **APIForge** o encuentras algún problema, no dudes en abrir un issue o enviar un pull request.

## Licencia

Este proyecto está bajo la licencia MIT. Puedes consultar el archivo [LICENSE](LICENSE) para más detalles.
