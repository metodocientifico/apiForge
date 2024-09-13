
# APIForge

**APIForge** es una solución completa para la creación, simulación y prueba de APIs basadas en OpenAPI. Proporciona un entorno fácilmente desplegable con Swagger UI para la documentación, un servidor mock con Prism para simular las respuestas de las APIs, y herramientas para pruebas automáticas e interactivas con Postman/Insomnia.

## Características

- **Swagger UI**: Interfaz gráfica para visualizar y probar tus APIs.
- **Prism Mock Server**: Simula las respuestas de tus APIs basadas en tus archivos OpenAPI.
- **Soporte para múltiples APIs**: Usa múltiples archivos OpenAPI (.yaml) con configuración de `SWAGGER_URLS`.
- **Pruebas automatizadas**: Scripts Bash para ejecutar pruebas básicas de API.
- **Integración con Postman/Insomnia**: Colecciones para pruebas interactivas.
- **Logs**: Logs detallados de las solicitudes mockeadas para depuración.

## Estructura del Proyecto

```bash
apiforge/
├── docker-compose.yml         # Definición de servicios Docker
├── swagger/                   # Carpeta para los archivos OpenAPI y configuración de Swagger
│   ├── api1.yaml              # Definición de la primera API en formato OpenAPI
│   └── api2.yaml              # Definición de la segunda API en formato OpenAPI
├── tests/                     # Scripts de pruebas automatizadas
│   └── test_api.sh            # Script Bash para pruebas de API
├── collections/               # Colecciones de Postman/Insomnia para pruebas interactivas
│   └── apiforge.postman_collection.json  # Colección Postman
├── logs/                      # Carpeta donde se almacenan los logs del mock server
│   └── prism.log              # Archivo de log del mock server
└── README.md                  # Este archivo de documentación
```

## Requisitos

Antes de comenzar, asegúrate de tener instalados los siguientes requisitos:

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

   Puedes revisar los logs de las solicitudes mockeadas en `logs/prism.log`.

## Uso de los Servicios

### Swagger UI

Puedes acceder a la documentación interactiva de tus APIs en **Swagger UI** desde la siguiente URL:

- [http://localhost:8080](http://localhost:8080)

En esta interfaz, podrás visualizar y probar los diferentes endpoints definidos en los archivos YAML (`api1.yaml`, `api2.yaml`, etc.).

### Mock Server (Prism)

El servidor mock está disponible en `http://localhost:4010`. Puedes hacer solicitudes a los endpoints definidos en `api1.yaml` y `api2.yaml` y obtener respuestas simuladas.

Ejemplo de uso:

```bash
curl http://localhost:4010/api1/resources
```

### Tests Automatizados

En la carpeta `tests/` hay un script Bash para ejecutar pruebas automatizadas. Puedes ejecutarlo con el siguiente comando:

```bash
bash tests/test_api.sh
```

Este script realizará pruebas con diferentes combinaciones de tokens JWT y claves API para verificar el comportamiento de la API mockeada.

### Colección de Postman/Insomnia

En la carpeta `collections/` encontrarás una colección predefinida para **Postman** o **Insomnia**. Puedes importarla directamente en cualquiera de las herramientas para realizar pruebas interactivas.

- **Postman**: Importa el archivo `apiforge.postman_collection.json`.
- **Insomnia**: También puedes importar el archivo de colección para probar los endpoints de manera gráfica.

## Personalización

Puedes modificar los archivos `api1.yaml`, `api2.yaml`, etc., en la carpeta `swagger/` para ajustar las APIs a tus necesidades. Luego, vuelve a levantar el contenedor de Prism para reflejar los cambios:

```bash
docker-compose restart prism-mock
```

## Detalles Técnicos

### `docker-compose.yml`

El archivo `docker-compose.yml` incluye los siguientes servicios:

- **swagger-ui**: Servicio que expone Swagger UI en el puerto `8080` para visualizar la documentación de la API.
- **prism-mock**: Servicio que ejecuta Prism en el puerto `4010`, simulando los endpoints definidos en los archivos YAML (`api1.yaml`, `api2.yaml`).

### Archivos OpenAPI

Los archivos YAML (`api1.yaml`, `api2.yaml`) contienen la definición de la API siguiendo el estándar **OpenAPI 3.0**. Aquí defines los endpoints, los esquemas de datos, y las políticas de seguridad (como autenticación con JWT o claves API).

## Extensión y Funcionalidades Futuras

- **Persistencia de datos**: Si necesitas simular operaciones más complejas, podrías extender este entorno añadiendo contenedores como MongoDB o MySQL.
- **Autenticación avanzada**: Puedes agregar más validaciones de seguridad en Prism o integrar autenticación real usando servicios de terceros.
- **Test Automation**: Implementa más scripts de pruebas para validar los flujos completos de tu API.

## Ejemplo de uso

1. Ejecuta Swagger UI y Prism mock server con `docker-compose`.
2. Abre el navegador y accede a [http://localhost:8080](http://localhost:8080) para visualizar la documentación de la API.
3. Simula una solicitud a uno de los endpoints mockeados:

   ```bash
   curl http://localhost:4010/api1/resources
   ```

4. Verifica el log de las solicitudes mockeadas en `logs/prism.log`.

## Contribuciones

Si tienes ideas para mejorar **APIForge** o encuentras algún problema, no dudes en abrir un issue o enviar un pull request.

## Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.
