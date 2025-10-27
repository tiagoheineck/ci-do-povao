#!/bin/sh
###################################################################
# Register a GitLab Runner inside the dockerized runner container.
# Usage:
#   ./gitlab-runner-register.sh <registration_token> <gitlab_url>
#
# Examples:
#   ./gitlab-runner-register.sh XXXXXXXXXXXXXXXXXXX https://gitlab.localhost
#
# You can also provide the values via environment variables:
#   REGISTRATION_TOKEN and GITLAB_URL
#
# To find the registration token, open GitLab UI: Settings > CI/CD > Runners
###################################################################

# default container name (matches docker-compose)
CONTAINER_NAME="gitlab-runner1"

# fallback defaults (kept for reference — script will prefer params or env vars)
FALLBACK_TOKEN="XXXXXXXXXXXXXXXXXXX"
FALLBACK_URL="https://git-url"

# Determine token and URL: positional args > env vars > fallbacks
if [ -n "$1" ] && [ -n "$2" ]; then
  registration_token="$1"
  url="$2"
else
  if [ -n "$REGISTRATION_TOKEN" ] && [ -n "$GITLAB_URL" ]; then
    registration_token="$REGISTRATION_TOKEN"
    url="$GITLAB_URL"
  else
    # If fallbacks are real values, you may want to allow them — currently require explicit values
    echo "Usage: $0 <registration_token> <gitlab_url>"
    echo "Or set REGISTRATION_TOKEN and GITLAB_URL environment variables."
    exit 1
  fi
fi

echo "Registering runner with token: ${registration_token} to URL: ${url} (container: ${CONTAINER_NAME})"

docker exec -it "${CONTAINER_NAME}" \
  gitlab-runner register \
    --non-interactive \
    --registration-token "${registration_token}" \
    --locked=false \
    --description docker-stable \
    --url "${url}" \
    --executor docker \
    --docker-image docker:stable \
    --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" \
    --docker-network-mode devops-povao

echo "Registration command executed. Check container logs or GitLab UI to confirm."