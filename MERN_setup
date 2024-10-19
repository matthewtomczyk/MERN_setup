#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to check if a command exists
command_exists () {
    command -v "$1" >/dev/null 2>&1 ;
}

# Check if an argument (project name) is provided
if [ -z "$1" ]; then
    echo "Error: No project name provided."
    echo "Usage: $0 <project_name>"
    exit 1
fi

# Set the project name from the argument
PROJECT_NAME="$1"
PROJECT_DIR="$HOME/$PROJECT_NAME"

# 1. Install Homebrew if not installed
if ! command_exists brew ; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# 2. Update Homebrew
echo "Updating Homebrew..."
brew update

# 3. Install Node.js and npm (via Homebrew)
if ! command_exists node || ! command_exists npm ; then
    echo "Installing Node.js and npm..."
    brew install node
else
    echo "Node.js and npm are already installed."
fi

# 4. Verify Node.js and npm installation
echo "Node version: $(node -v)"
echo "npm version: $(npm -v)"

# 5. Install MongoDB (Community Edition) using Homebrew
if ! command_exists mongod ; then
    echo "Installing MongoDB..."
    brew tap mongodb/brew
    brew install mongodb-community@6.0
else
    echo "MongoDB is already installed."
fi

# 6. Start MongoDB as a service
echo "Starting MongoDB..."
brew services start mongodb/brew/mongodb-community@6.0

# 7. Install global npm packages for MERN development
echo "Installing global npm packages for MERN stack development..."
npm install -g express-generator create-react-app nodemon

# 8. Create a new directory for the MERN project
echo "Creating a new MERN project directory at $PROJECT_DIR..."
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"

# 9. Set up Express backend
echo "Setting up Express backend in $PROJECT_NAME/backend..."
express --no-view backend
cd backend
npm install
cd ..

# 10. Set up React frontend
echo "Setting up React frontend in $PROJECT_NAME/frontend..."
npx create-react-app frontend
cd frontend
npm install
cd ..

# 11. Starting MongoDB in the background
echo "MongoDB service is running in the background."

# 12. Run the backend server
echo "To run the backend, go to $PROJECT_DIR/backend and use: 'npm start' or 'nodemon'."
echo "To run the frontend, go to $PROJECT_DIR/frontend and use: 'npm start'."

# 13. Success message
echo "MERN stack setup for $PROJECT_NAME is complete! Happy coding!"
