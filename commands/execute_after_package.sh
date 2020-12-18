#!/bin/bash -i 

############################################################################################################################
# This script is a post-step for packaging stage, and its purpose is copying the config file into output folder, 
# to be provided to runtime image later.
############################################################################################################################

step="PACKAGE STEP"

# Ensure the current directory is root application path
goto_repo_root

# Let's copy config files into output folder
config_path="./config"

log_info "[$step] Executing command: 'cp -R $config_path /output/'"

cp -R $config_path /output/
result=$?

# Validate the build operation result
if [[ $result -ne 0 ]]; then
    log_error "[$step] Packaging application with command: 'cp -R $config_path /output/'"
    exit $result
fi

log_success "[$step] Config files were copied to output folder successfully!"
