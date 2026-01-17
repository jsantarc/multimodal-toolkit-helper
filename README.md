# Multimodal Toolkit Helper

A helper repo for setting up and running [multimodal-transformers](https://github.com/georgian-io/Multimodal-Toolkit) with compatible dependencies.

Includes a demo: Training a BertWithTabular Model for Clothing Review Recommendation Prediction.

## Requirements

- Python 3.10 or 3.11 (Python 3.12+ not supported)
- pip or conda

## Installation

Choose one of the following methods:

### Option 1: Anaconda (Recommended)

```bash
chmod +x setup_env_anaconda.sh
./setup_env_anaconda.sh
```

Then activate and run:
```bash
conda activate multimodal-toolkit
jupyter notebook
```

### Option 2: Docker (CPU only)

Note: Docker on Mac cannot access the GPU (MPS). Use Option 1 (Anaconda) for GPU acceleration on Apple Silicon.

```bash
# Build
docker build -t multimodal-toolkit .

# Run (with 8GB memory for training)
docker run -p 8888:8888 --memory=8g multimodal-toolkit
```

Open the URL shown in the terminal.

**Troubleshooting Docker:**
- If the kernel dies during training, reduce `per_device_train_batch_size` in the notebook (try 4 or 2)
- Increase Docker memory in Docker Desktop: Settings > Resources > Memory (12-16GB recommended)

### Option 3: Manual Installation

```bash
# Create environment with Python 3.10
conda create -n multimodal-toolkit python=3.10 -y
conda activate multimodal-toolkit

# Install dependencies
pip install -r requirements.txt

# Or use pyproject.toml
pip install -e .

# Register Jupyter kernel
python -m ipykernel install --user --name multimodal-toolkit --display-name "Python 3.10 (multimodal-toolkit)"
```

## Usage

1. Activate your environment
2. Run `jupyter notebook`
3. Open `text_w_tabular_classification.ipynb`
4. Select the "Python 3.10 (multimodal-toolkit)" kernel
5. Run all cells

## Files

| File | Description |
|------|-------------|
| `text_w_tabular_classification.ipynb` | Main notebook for training |
| `pyproject.toml` | Project dependencies (for `pip install -e .`) |
| `requirements.txt` | Dependencies (for `pip install -r`) |
| `setup_env_anaconda.sh` | Anaconda setup script |
| `Dockerfile` | Docker setup |
| `check_versions.py` | Verify installed package versions |

## Troubleshooting

### Import errors with multimodal-transformers
Make sure you're using Python 3.10 or 3.11. Check with:
```bash
python --version
```

### Kernel not showing in Jupyter
Register it manually:
```bash
python -m ipykernel install --user --name multimodal-toolkit --display-name "Python 3.10 (multimodal-toolkit)"
```

### VS Code not finding kernel
1. Open Command Palette (Cmd+Shift+P)
2. Type "Python: Select Interpreter"
3. Choose the multimodal-toolkit environment
