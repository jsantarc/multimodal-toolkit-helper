#!/bin/bash

# Setup script for multimodal-transformers environment

ENV_NAME="multimodal-toolkit"

echo "Creating conda environment '$ENV_NAME' with Python 3.10..."
conda create -n $ENV_NAME python=3.10 -y

echo "Activating environment..."
eval "$(conda shell.bash hook)"
conda activate $ENV_NAME

echo "Installing dependencies..."
pip install -e .

echo "Registering Jupyter kernel..."
python -m ipykernel install --user --name $ENV_NAME --display-name "Python 3.10 ($ENV_NAME)"

echo ""
echo "Done! To use:"
echo "  conda activate $ENV_NAME"
echo "  jupyter notebook"
