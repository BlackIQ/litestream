# LiteStream

This Docker image is built to serve static files using **Nginx**. You can use it to quickly serve files from a specific directory, with directory listing enabled, using Docker.

## Features

- Based on **nginx:alpine** for a lightweight and efficient image.
- Auto-indexing of directories enabled by default.
- Simple and configurable through a Docker volume.

## How to Use

### Pull the Image

First, you need to pull the Docker image from DockerHub:

```bash
docker pull blackiq/litestream:1.0.0
```

### Run the Container

To run the container and serve your files, use the following `docker run` command:

```bash
docker run -p 8080:80 -v /path/to/your/files:/media --rm --name file-server blackiq/litestream:1.0.0
```

- **8080:80**: Maps port `80` in the container to port `8080` on your host machine. You can adjust this as needed.
- **/path/to/your/files**: Replace this with the path to the directory you want to serve. The directory will be mounted to `/media` in the container.
- **--rm**: Automatically removes the container after stopping it.
- **file-server**: The name of the container. You can customize this.

After running the command, you can visit `http://ip:8080` (or the port you specified) to access your files.

### Example

```bash
docker run -p 10000:80 -v ~/movies:/media --rm --name movies-server blackiq/litestream:1.0.0
```

This will serve the files in the `~/movies` directory and make them accessible via `http://localhost:10000`.

## Configuration

This image uses a custom Nginx configuration (`default.conf`) to serve files with directory listing enabled. The following is the default configuration used in the container:

```nginx
server {
    listen 80;
    listen [::]:80;

    location / {
        root /media;
        
        autoindex on;
    }
}
```

If you want to customize the configuration, you can modify the `default.conf` and rebuild the image.

## Contribute



### Building the Image

If you want to build the image yourself, use the following steps:

1. Clone the repository:
    ```bash
    git clone https://github.com/blackiq/litestream.git
    cd litestream
    ```

2. Build the Docker image:
    ```bash
    docker build -t my-litestream .
    ```

3. Run the container:
    ```bash
    docker run -p 8080:80 -v /path/to/your/files:/media --rm --name my-litestream-container my-litestream
    ```

---

## Publishing to DockerHub and GitHub

### DockerHub

1. Build the Docker image:
   ```bash
   docker build -t my-litestream:latest .
   ```

2. Tag the image for DockerHub:
   ```bash
   docker tag my-litestream <your-dockerhub-username>/my-litestream:latest
   ```

3. Push the image to DockerHub:
   ```bash
   docker push <your-dockerhub-username>/my-litestream:latest
   ```

> Remember to login before push with `docker login` command.

### Git

You can now push it into your Git server or any other Git services like **GitHub**, **GitLab** and others.

1. Initialize a Git repository (if not already):
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   ```

2. Add the remote repository:
   ```bash
   git remote add origin https://github.com/<your-github-username>/my-litestream.git
   ```

3. Push the code to GitHub:
   ```bash
   git push -u origin main
   ```

## License

This project is licensed under the MIT License.

---

Let me know if you need any further modifications or help with publishing!
