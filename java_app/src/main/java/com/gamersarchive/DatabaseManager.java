package com.gamersarchive;

import java.sql.*;

public class DatabaseManager {
    private Connection connection;

    // Database connection details
    private final String DB_URL = "jdbc:mysql://localhost:3306/gamers_archive"; // Update database URL if needed
    private final String DB_USER = "root"; // Your MySQL username
    private final String DB_PASSWORD = "YOURPASSWORD!!"; // Your MySQL password

    // Constructor: Establish connection
    public DatabaseManager() {
        try {
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            System.out.println("Connected to the database successfully!");
        } catch (SQLException e) {
            System.err.println("Error connecting to the database: " + e.getMessage());
            System.exit(1);
        }
    }

    // Insert a new game
    public void insertGame(String title, int releaseYear, String esrb, String description, int studioId) {
        String query = "INSERT INTO Video_Game (title, release_year, esrb, description, studio_id) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, title);
            pstmt.setInt(2, releaseYear);
            pstmt.setString(3, esrb);
            pstmt.setString(4, description);
            pstmt.setInt(5, studioId);
            pstmt.executeUpdate();
            System.out.println("Game added successfully.");
        } catch (SQLException e) {
            System.err.println("Error inserting game: " + e.getMessage());
        }
    }

    // Display all games
    public void listAllGames() {
        String query = "SELECT vg.title, s.studio_name, vg.release_year FROM Video_Game vg JOIN Studio s ON vg.studio_id = s.studio_id";
        try (Statement stmt = connection.createStatement(); ResultSet rs = stmt.executeQuery(query)) {
            System.out.printf("%-30s %-20s %-10s%n", "Game Title", "Studio", "Release Year");
            System.out.println("-------------------------------------------------------------");
            while (rs.next()) {
                System.out.printf("%-30s %-20s %-10d%n", rs.getString("title"), rs.getString("studio_name"),
                        rs.getInt("release_year"));
            }
        } catch (SQLException e) {
            System.err.println("Error retrieving game list: " + e.getMessage());
        }
    }

    // Update game information
    public void updateGame(int gameId, String newTitle, int newReleaseYear) {
        String query = "UPDATE Video_Game SET title = ?, release_year = ? WHERE game_id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, newTitle);
            pstmt.setInt(2, newReleaseYear);
            pstmt.setInt(3, gameId);
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Game updated successfully.");
            } else {
                System.out.println("Game not found.");
            }
        } catch (SQLException e) {
            System.err.println("Error updating game: " + e.getMessage());
        }
    }

    // Delete a game by ID
    public void deleteGame(int gameId) {
        String query = "DELETE FROM Video_Game WHERE game_id = ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, gameId);
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                System.out.println("Game deleted successfully.");
            } else {
                System.out.println("Game not found.");
            }
        } catch (SQLException e) {
            System.err.println("Error deleting game: " + e.getMessage());
        }
    }

    // Search for games by title
    public void searchGamesByTitle(String title) {
        String query = "SELECT vg.game_id, vg.title, s.studio_name, vg.release_year FROM Video_Game vg JOIN Studio s ON vg.studio_id = s.studio_id WHERE vg.title LIKE ?";
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setString(1, "%" + title + "%");
            try (ResultSet rs = pstmt.executeQuery()) {
                if (!rs.isBeforeFirst()) {
                    System.out.println("No games found matching the title.");
                } else {
                    System.out.printf("%-10s %-30s %-20s %-10s%n", "ID", "Title", "Studio", "Release Year");
                    System.out.println("-------------------------------------------------------------");
                    while (rs.next()) {
                        System.out.printf("%-10d %-30s %-20s %-10d%n", rs.getInt("game_id"), rs.getString("title"),
                                rs.getString("studio_name"), rs.getInt("release_year"));
                    }
                }
            }
        } catch (SQLException e) {
            System.err.println("Error searching games: " + e.getMessage());
        }
    }

    // Close the database connection
    public void close() {
        if (connection != null) {
            try {
                if (!connection.isClosed()) {
                    connection.close();
                    System.out.println("Disconnected from the database.");
                }
            } catch (SQLException e) {
                System.err.println("Error closing the database connection: " + e.getMessage());
            }
        }
    }
}
