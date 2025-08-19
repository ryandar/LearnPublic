
NOTE:
- Swagger url:
  http://localhost:8080/swagger-ui/index.html
- API
  http://localhost:8080/api/hello



# Hello World Spring Boot API (Gradle) with Swagger

A minimal Spring Boot project that opens Swagger UI and exposes a single `GET /api/hello` endpoint.

## Run in IntelliJ (do-nothing friendly) 
1. **Open** the folder in IntelliJ (File → Open → select `build.gradle`).
2. IntelliJ will auto-import Gradle. Once synced, you can **Run** the `Application` class.
3. When the app starts, open: `http://localhost:8080/` → it redirects to **Swagger UI** at `/swagger`.
   - The Swagger UI will show the **Hello** tag and the `GET /api/hello` operation.
   - Try it out → **Execute** to see `"Hello, World!"`.

> Notes
> - Java 17+ is recommended (project sets the toolchain to 17).
> - No extra config needed—just click **Run** on `Application`.
