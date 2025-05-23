

# Ensure vcs is installed
if ! command -v vcs &> /dev/null; then
  echo "🔧 Installing vcstool..."

  # Add ROS 2 apt repo (for GitHub Actions runners or bare images)
  sudo apt update
  sudo apt install -y curl gnupg lsb-release

  sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] \
    http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" \
    | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null

  sudo apt update
  sudo apt install -y python3-vcstool
fi

# Switch to workspace root
cd "$MAIN_DIR"

# Check repos.list
REPOS_LIST="repos.list"
if [ ! -f "$REPOS_LIST" ]; then
  echo "❌ Error: '$REPOS_LIST' not found in root directory."
  exit 1
fi



vcs import . < "../$REPOS_LIST"


# Add COLCON_IGNORE to simulation/testing packages
touch "${MAIN_DIR}/src/cartesian_controllers/cartesian_controller_simulation/COLCON_IGNORE" || true
touch "${MAIN_DIR}/src/cartesian_controllers/cartesian_controller_tests/COLCON_IGNORE" || true
