
# APIForge

**APIForge** is a solution for creating, simulating, and testing APIs based on OpenAPI. It provides an easily deployable environment with Swagger UI for documentation and Prism for simulating API responses.

## Project Structure

```bash
apiForge/
├── collections/                 # Postman/Insomnia collections
│   └── api-test.collection.json # Postman/Insomnia collection for api-test.yaml
├── swagger/                     # API definitions
│   ├── api-test.yaml            # Main API for CRUD simulations
│   ├── other-api.yaml           # Additional API for products
│   └── swagger-config.yaml      # Configuration for Swagger UI
├── tests/                       # Automated test scripts
│   └── test_api.sh              # Script for tests using curl
├── docker-compose.yaml          # Docker Compose configuration
├── LICENSE                      # Project license
└── README.md                    # Project documentation
```

## Requirements

Make sure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Setup and Execution

1. **Clone the repository**:

   ```bash
   git clone https://github.com/your_user/apiforge.git
   cd apiforge
   ```

2. **Start the services with Docker Compose**:

   Run the following command to start **Swagger UI**, **Prism Mock Server**, and **Swagger Editor**:

   ```bash
   docker-compose up -d
   ```

   - **Swagger UI** will be available at `http://localhost:8080`.
   - **Prism Mock Server** will be available at `http://localhost:4010`.
   - **Swagger Editor** will be available at `http://localhost:8081` (configured to load `api-test.yaml` by default).

3. **Verify the logs**:

   To check the logs of the mock server, you can run:

   ```bash
   docker logs prism-mock > ./logs/prism.log
   ```

## Usage of Services

### Swagger UI

You can access the interactive documentation of your API in **Swagger UI** via:

- [http://localhost:8080](http://localhost:8080)

Here, you can visualize and test the different endpoints defined in your API files.

### Mock Server (Prism)

The mock server is available at `http://localhost:4010`. You can send requests to the endpoints defined in `api-test.yaml` and `other-api.yaml`.

Example:

```bash
curl http://localhost:4010/resources
```

```bash
curl http://localhost:4010/products
```

### Automated Tests

The `tests/` folder contains the Bash script `test_api.sh` for running automated tests. You can execute it with the following command:

```bash
bash tests/test_api.sh
```

This script performs several operations on the API, including **GET**, **POST**, **PUT**, and **DELETE**.

### Postman Collection

The `collections/` folder contains a pre-defined Postman collection that you can import directly into **Postman** for interactive testing.

## Swagger Editor

Swagger Editor has been added to the project to allow direct editing of the API YAML files from a web interface. By default, it loads the `api-test.yaml` file.

You can access Swagger Editor at:

- [http://localhost:8081](http://localhost:8081)

For now, Swagger Editor is configured to load `api-test.yaml` by default. If you need to switch to another file, you can modify the `docker-compose.yml` or add multiple instances of Swagger Editor.

## Contributions

If you have ideas to improve **APIForge** or encounter any issues, feel free to open an issue or send a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
