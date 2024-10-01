package com.gamersarchive;

import java.util.Scanner;

public class GamerArchiveApp {
    private static final Scanner scanner = new Scanner(System.in);
    private static int defaultChoice = 1; // Start with the first function

    public static void main(String[] args) {
        DatabaseManager dbManager = new DatabaseManager();
        System.out.println("Connected to the database successfully!");

        boolean running = true;
        while (running) {
            showMenu();
            int choice = getUserChoice();

            switch (choice) {
                case 1:
                    dbManager.listAllGames();
                    break;
                case 2:
                    if (defaultChoice == 2) { // Skip add game if it's a default choice
                        System.out.println("No input provided. Skipping 'Add New Game'.");
                        defaultChoice++;
                    } else {
                        addNewGame(dbManager);
                    }
                    break;
                case 3:
                    if (defaultChoice == 3) { // Skip update game if it's a default choice
                        System.out.println("No input provided. Skipping 'Update Game'.");
                        defaultChoice++;
                    } else {
                        updateGame(dbManager);
                    }
                    break;
                case 4:
                    if (defaultChoice == 4) { // Skip delete game if it's a default choice
                        System.out.println("No input provided. Skipping 'Delete Game'.");
                        defaultChoice++;
                    } else {
                        deleteGame(dbManager);
                    }
                    break;
                case 5:
                    if (defaultChoice == 5) { // Provide a default search query
                        System.out.println("No input provided. Searching for a default game title: 'Adventure Quest'");
                        searchGameByTitle(dbManager, "Adventure Quest");
                        defaultChoice++;
                    } else {
                        searchGameByTitle(dbManager, "");
                    }
                    break;
                case 6:
                    System.out.println("Exiting application...");
                    running = false;
                    break;
                default:
                    System.out.println("Invalid option. Exiting application...");
                    running = false;
            }

            // Exit the loop if choice was 6
            if (choice == 6) {
                break;
            }
        }

        // Always close resources
        dbManager.close();
        scanner.close();
        System.exit(0); // Exit the program
    }

    private static void showMenu() {
        System.out.println("\n--- Gamer's Archive Menu ---");
        System.out.println("1. List All Games");
        System.out.println("2. Add New Game");
        System.out.println("3. Update Game");
        System.out.println("4. Delete Game");
        System.out.println("5. Search Game by Title");
        System.out.println("6. Exit");
        System.out.print("Enter your choice: ");
    }

    private static int getUserChoice() {
        int choice = -1;
        boolean validInput = false;

        while (!validInput) {
            try {
                if (scanner.hasNextLine()) {
                    String input = scanner.nextLine().trim();
                    if (input.matches("\\d+")) {
                        choice = Integer.parseInt(input);
                        validInput = true;
                    } else {
                        System.out.println("Invalid input. Please enter a number.");
                        System.out.print("Enter your choice: ");
                    }
                } else {
                    // No input found, use default sequential choice
                    System.out.println("No input found. Using default choice: " + defaultChoice);
                    choice = defaultChoice;
                    validInput = true;

                    // Increment defaultChoice or reset to 6 if it's the last option
                    if (defaultChoice < 6) {
                        defaultChoice++;
                    } else {
                        defaultChoice = 6; // Ensure it exits if it reaches 6
                    }
                }
            } catch (Exception e) {
                System.out.println("An error occurred. Please try again.");
                scanner.nextLine(); // Clear the buffer
            }
        }
        return choice;
    }

    private static void addNewGame(DatabaseManager dbManager) {
        try {
            System.out.print("Enter game title (Default: 'Default Game'): ");
            String title = getInputOrDefault("Default Game");
            System.out.print("Enter release year (Default: 2023): ");
            int releaseYear = Integer.parseInt(getInputOrDefault("2023"));
            System.out.print("Enter ESRB rating (Default: 'E'): ");
            String esrb = getInputOrDefault("E");
            System.out.print("Enter description (Default: 'An epic adventure game.'): ");
            String description = getInputOrDefault("An epic adventure game.");
            System.out.print("Enter studio ID (Default: 1): ");
            int studioId = Integer.parseInt(getInputOrDefault("1"));

            dbManager.insertGame(title, releaseYear, esrb, description, studioId);
            System.out.println("Game added successfully!");
        } catch (NumberFormatException e) {
            System.out.println("Invalid input! Please enter numeric values where required.");
        }
    }

    private static void updateGame(DatabaseManager dbManager) {
        try {
            System.out.print("Enter the ID of the game to update (Default: 1): ");
            int gameId = Integer.parseInt(getInputOrDefault("1"));
            System.out.print("Enter new game title (Default: 'Updated Game'): ");
            String newTitle = getInputOrDefault("Updated Game");
            System.out.print("Enter new release year (Default: 2024): ");
            int newReleaseYear = Integer.parseInt(getInputOrDefault("2024"));

            dbManager.updateGame(gameId, newTitle, newReleaseYear);
            System.out.println("Game updated successfully!");
        } catch (NumberFormatException e) {
            System.out.println("Invalid input! Please enter numeric values where required.");
        }
    }

    private static void deleteGame(DatabaseManager dbManager) {
        try {
            System.out.print("Enter the ID of the game to delete (Default: 1): ");
            int gameId = Integer.parseInt(getInputOrDefault("1"));
            dbManager.deleteGame(gameId);
            System.out.println("Game deleted successfully!");
        } catch (NumberFormatException e) {
            System.out.println("Invalid input! Please enter a valid game ID.");
        }
    }

    private static void searchGameByTitle(DatabaseManager dbManager, String defaultTitle) {
        if (defaultTitle.isEmpty()) {
            System.out.print("Enter the game title to search (Default: 'Adventure Quest'): ");
            String title = getInputOrDefault("Adventure Quest");
            dbManager.searchGamesByTitle(title);
        } else {
            dbManager.searchGamesByTitle(defaultTitle);
        }
    }

    // Helper method to get input or use a default value
    private static String getInputOrDefault(String defaultValue) {
        if (scanner.hasNextLine()) {
            String input = scanner.nextLine().trim();
            if (input.isEmpty()) {
                return defaultValue;
            } else {
                return input;
            }
        } else {
            System.out.println("No input detected. Using default value: " + defaultValue);
            return defaultValue;
        }
    }
}
