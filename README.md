
# Gamer's Archive

Gamer's Archive is a Java-based application that provides a command-line interface (CLI) for managing a video game database. The application connects to a MySQL database and allows users to perform CRUD (Create, Read, Update, Delete) operations on video games, studios, genres, players, and reviews. The project uses Gradle as the build tool to manage dependencies and build the project.

## Project Structure

```
GAMER'S ARCHIVE/
│
├── README.md                          # Main documentation file for the overall project
│
├── java_app/                          # Gradle project root
│   ├── build.gradle                   # Gradle build file
│   ├── gradle/                        # Gradle wrapper files
│   ├── gradlew                        # Gradle wrapper script (Linux/Mac)
│   ├── gradlew.bat                    # Gradle wrapper script (Windows)
│   ├── src/
│   │   ├── main/
│   │   │   └── java/
│   │   │       └── com/
│   │   │           └── gamersarchive/
│   │   │               ├── DatabaseManager.java    # Java class for database management
│   │   │               └── GamerArchiveApp.java    # Main Java application class
│   └── build/                        # Gradle-generated directory for compiled files
│
└── sql_scripts/                      # Folder containing SQL scripts
    ├── project-GamersArchive_team-23_create.sql    # SQL script to create tables
    ├── project-GamersArchive_team-23_insert.sql    # SQL script to insert sample data
    ├── project-GamersArchive_team-23_select.sql    # SQL script for queries
    └── ReadMe_Database.md                          # Database-specific readme
```

## Getting Started

### Prerequisites

- Java 8 or later
- MySQL Server
- Gradle (if not using the Gradle Wrapper included with this project)

### Setting Up the Database

1. **Start MySQL** and create a new database:
   ```sql
   CREATE DATABASE gamers_archive;
   USE gamers_archive;
   ```
2. **Run SQL scripts** to set up the database tables and insert sample data:
   ```bash
   mysql -u root -p gamers_archive < sql_scripts/project-GamersArchive_team-23_create.sql
   mysql -u root -p gamers_archive < sql_scripts/project-GamersArchive_team-23_insert.sql
   ```
   
### Building the Project
1.  Navigate to the `java_app` directory:
    ```bash
    cd java_app
    ```
    
2.  Build the project using the Gradle Wrapper:
   
-   On **Windows**:
    ```bash
    gradlew build
    ```
    
-   On **Mac/Linux**:
    ```bash
    ./gradlew build
    ```

### Running the Application

You can run your application using the Gradle Wrapper:

-   On **Windows**:
    ```bash
    gradlew run
    ```
    
-   On **Mac/Linux**:
    ```bash
    ./gradlew run
    ```
    
### Application Features

The application provides the following functionalities:

- **List All Games**: Display all video games with their corresponding studios and release years.
- **Add New Game**: Add a new video game to the database, with default values used if no input is provided.
- **Update Game**: Update the details of an existing video game with optional user input.
- **Delete Game**: Remove a video game from the database.
- **Search Game by Title**: Search for video games based on their title, defaulting to "Adventure Quest" if no input is provided.
- **Exit**: Exits the application gracefully.

### Configuration

- The database connection details are specified in `DatabaseManager.java`. Ensure your MySQL database URL, username, and password are correctly configured:
```java
private final String DB_URL = "jdbc:mysql://localhost:3306/gamers_archive";
private final String DB_USER = "root";
private final String DB_PASSWORD = "yourpassword"; 
```

### SQL Scripts

- **project-GamersArchive_team-23_create.sql**: Contains SQL statements to create all the necessary tables.
- **project-GamersArchive_team-23_insert.sql**: Inserts sample data into the database.
- **project-GamersArchive_team-23_select.sql**: Contains SQL queries to demonstrate various data retrieval functionalities.

### Troubleshooting

- Ensure MySQL is running, and the database is set up correctly.
- Verify that you have set up the correct database credentials in `DatabaseManager.java`.
- If Gradle fails to download dependencies, check your internet connection and try running `gradlew clean build` again.

## Additional Resources

- [MySQL Connector/J Documentation](https://dev.mysql.com/doc/connector-j/en/)
- [Gradle Official Documentation](https://docs.gradle.org/current/userguide/userguide.html)
- [Java SE Documentation](https://docs.oracle.com/en/java/)

## License

This project is licensed under the MIT License - see the LICENSE file for details.
