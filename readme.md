# Python Web App

This is a simple Python web app built with Flask. It has two endpoints:
1. `/` - Displays "Hello World".
2. `/error` - Logs an error and returns a "Bad Request" HTTP code (400).

## How to Deploy

1. Clone the repository:
    ```bash
    git clone <repository-url>
    cd python-webapp
    ```

2. Run the deployment script:
    ```bash
    sudo bash deploy.sh
    ```

3. After the script completes, access the app at `http://localhost:5000`.

## Logs

- The app logs HTTP requests and errors.
- Set up log rotation to manage log file sizes.

## Troubleshooting

- If port 5000 is already in use, the `deploy.sh` script will automatically stop and remove any existing container using the port before deploying the new one.
