FROM ghcr.io/kube-kaptain/kaptain/kaptain-deploy-scripts:1.0.2 AS KAPTAIN_DEPLOY_SCRIPTS
# Easy way to pull in the scripts for now and maybe forever

FROM ghcr.io/kube-kaptain/image/image-environment-base-trixie-slim:1.33.4
# Always use the most explicit version you can find for what you need

# All the scripts come in this way
COPY --from=KAPTAIN_DEPLOY_SCRIPTS /scripts /run/bin

# Environment build responsibilities:
# * Place manifests in /run/manifests
# * Place secrets in /run/secrets
# * Change to non-root user after copying all files in
# * Configure all required environment variables
#
# Required environment variables:
# * DEPLOY_MODE 
# * ENVIRONMENT
# * VERSION
# * TOKEN_DELIMITER_STYLE
# * TOKEN_NAME_STYLE
#
# Deploy using a manifest set that:
# * Provides a secret with an environmentPassphrase key whose value matches the bundled secrets
# * Provides cluster-admin permissions or a smaller set for the namespace only - depends on cluster scoped resources
# * Sets terminationGracePeriod to a large value, at least 14400 seconds / 4 hours - add as many zeros as you want - it's well behaved
