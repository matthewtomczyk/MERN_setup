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

# 3. Check for NVM installation
if [ -z "$NVM_DIR" ] || ! command_exists nvm ; then
    echo "NVM not found. Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

    # Load NVM into the current shell session
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

    echo "NVM installed successfully."
else
    echo "NVM is already installed."
fi

# 4. Install Node.js via NVM
if ! command_exists node || ! command_exists npm ; then
    echo "Installing Node.js via NVM..."
    nvm install --lts
    nvm use --lts
else
    echo "Node.js and npm are already installed."
fi

# 5. Verify Node.js and npm installation
echo "Node version: $(node -v)"
echo "npm version: $(npm -v)"

# 6. Install MongoDB (Community Edition) using Homebrew
if ! command_exists mongod ; then
    echo "Installing MongoDB..."
    brew tap mongodb/brew
    brew install mongodb-community@6.0
else
    echo "MongoDB is already installed."
fi

# 7. Start MongoDB as a service
echo "Starting MongoDB..."
brew services start mongodb/brew/mongodb-community@6.0

# 8. Install global npm packages for MERN development
echo "Installing global npm packages for MERN stack development..."
npm install -g express-generator nodemon

# 9. Create a new directory for the MERN project
echo "Creating a new MERN project directory at $PROJECT_DIR..."
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"

# 10. Initialize Git repository
echo "Initializing a Git repository..."
git init
echo "# $PROJECT_NAME" > README.md
git add .
git commit -m "Initial commit for $PROJECT_NAME MERN stack project"

# 11. Set up Express backend
echo "Setting up Express backend in $PROJECT_NAME/backend..."
express --no-view backend
cd backend
npm install
cd ..

# 12. Set up Vite React frontend
echo "Setting up Vite React frontend in $PROJECT_NAME/frontend..."
npm create vite@latest frontend -- --template react
cd frontend
npm install
cd ..

# 13. Starting MongoDB in the background
echo "MongoDB service is running in the background."

# 14. Run instructions
echo "To run the backend, go to $PROJECT_DIR/backend and use: 'npm start' or 'nodemon'."
echo "To run the frontend, go to $PROJECT_DIR/frontend and use: 'npm run dev'."

# 15. Success message
echo "MERN stack setup for $PROJECT_NAME is complete! Happy coding!"
