# MERN Setup Script

This is a shell script to automatically set up a new MERN (MongoDB, Express, React, Node.js) project on macOS. The script installs the required dependencies and creates the folder structure for both the frontend (React) and backend (Express). It populates the data with default values, consistent with the command npm init -y. 

## Features

- Automatically installs Homebrew (if not already installed).
- Installs Node.js, npm, and MongoDB.
- Sets up an Express backend and a React frontend.
- Configures a MongoDB service.
- Installs global npm packages required for MERN stack development.
- Allows custom project directory names by passing a name as an argument.

## Prerequisites

- macOS
- Internet connection for downloading dependencies.
- The script installs the following:
  - [Homebrew](https://brew.sh/)
  - [Node.js](https://nodejs.org/)
  - [npm](https://www.npmjs.com/)
  - [MongoDB](https://www.mongodb.com/)
  - Global npm packages: `express-generator`, `create-react-app`, `nodemon`

## Usage

### 1. Clone the Repository or Download the Script

You can either clone this repository or download the script directly:

git clone https://github.com/matthewtomczyk/MERN_setup

Or download the script file manually.

### 2. Make the Script Executable

Ensure the script has executable permissions:

chmod +x MERN_setup.sh

### 3. Run the Script

Run the script with a project name as an argument:

./MERN_setup.sh <Project_Name>

For example:

./MERN_setup.sh MyMERNApp

This will create a new folder `MyMERNApp` in your home directory and set up the MERN stack in that folder.

### 4. Project Structure

The script will create the following directory structure:

```
MyMERNApp/
│
├── backend/      # Express.js application
│   └── ...       # Backend setup with npm packages installed
│
└── frontend/     # React.js application
    └── ...       # Frontend setup with npm packages installed
```

### 5. Running the Project

- **Backend**: Navigate to the backend folder and start the server:

    ```bash
    cd ~/MyMERNApp/backend
    npm start
    ```

- **Frontend**: Navigate to the frontend folder and start the React app:

    cd ~/MyMERNApp/frontend
    npm start

## Notes

- The MongoDB service will be running in the background once installed. You can manage it using `brew services` commands, e.g., to stop MongoDB, run:

  brew services stop mongodb/brew/mongodb-community@6.0

- If Homebrew or other dependencies are already installed, the script will skip the installation steps for those components.

## Image 

Screenshop of browser after running the npm start command in the frontend

![npm start image](https://github.com/matthewtomczyk/MERN_setup/blob/main/Image.png)

## Troubleshooting

- Ensure that you have the necessary permissions to install Homebrew and system-wide npm packages.
- If you encounter issues with MongoDB installation or services, refer to the [MongoDB documentation](https://www.mongodb.com/docs/).

## License

This project is open-source and licensed under the MIT License. Feel free to contribute or modify it for your needs.

---
