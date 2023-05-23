# CI/CD Deployment of GoLang Server 

This repository showcases the deployment of a GoLang server with continuous integration and continuous deployment (CI/CD) using GitHub Actions and AWS services. The server listens on port 8080 and responds with a "Hello, world!" message.

## Structure

The repository contains the following key files:

- **Dockerfile**: This file builds the Docker image for our application. It includes two stages, a builder stage for compiling the Go code into a binary, and a final stage for running the application.
  
- **go.mod**: This is the Go module file that lists all the dependencies for our application.

- **main.go**: This is the Go application file that contains the server logic.

- **main_test.go**: This file contains the tests for the Go application.

The repository also contains two GitHub workflows in the `.github/workflows/` directory:

1. **go-lint-and-test-on-push.yml**: This workflow runs whenever there's a push to any branch other than main. It lints and tests the Go code across different platforms and Go versions.

2. **build-publish-deploy.yml**: This workflow is triggered when a pull request is closed (merged) into the main branch. It builds a Docker image, pushes it to DockerHub, deploys the updated application to AWS Elastic Beanstalk, and runs a smoke test to ensure the application is functioning correctly.

## Getting Started

To run the Go server locally, you'll need Docker installed on your machine. Use the following command to build and run the Docker image:

```bash
docker build -t ci-cd . 
docker run -p 8080:8080 ci-cd

## Accessing the Server

You should now be able to access the server at `localhost:8080` and see the "Hello, world!" message.

## Contributions

Please feel free to contribute to this project by opening issues or submitting pull requests. All contributions are welcome!

## License

This project is open-source and available under the MIT License.
