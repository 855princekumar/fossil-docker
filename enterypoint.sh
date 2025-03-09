#!/bin/sh

# Ensure the repository directory exists
mkdir -p ${FOSSIL_REPO_LOC}
chmod -R 777 ${FOSSIL_REPO_LOC}

# Set a default Fossil user
export USER="admin"

# Check if first-repo.fossil exists, if not, create it
if [ ! -f ${FOSSIL_REPO_LOC}/first-repo.fossil ]; then
    echo "Creating initial Fossil repository..."
    fossil init --user "$USER" ${FOSSIL_REPO_LOC}/first-repo.fossil
fi

# Start the Fossil server on port 9090
echo "Starting Fossil server on port 9090..."
exec fossil server --port 9090 --repolist ${FOSSIL_REPO_LOC}
