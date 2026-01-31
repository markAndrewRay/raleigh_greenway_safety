# Raleigh Greenway Safety Analysis

## Environment Setup
This project is optimized for **GitHub Codespaces** or **VS Code Dev Containers**. 

### Automated Setup
When you open this project in a container, the following are configured automatically via `.devcontainer/devcontainer.json`:
* **Git LFS**: Installed and initialized to manage large datasets.
* **Python 3.11**: Pre-configured environment with all necessary libraries.
* **Data Ingestion**: Large files are automatically pulled from storage.

### Manual System Tools (Optional)
If you wish to use the DuckDB Command Line Interface (CLI) directly in the terminal, it was installed during the initial setup. If you are running this in a fresh local environment, you can install the CLI with:
```bash
wget [https://github.com/duckdb/duckdb/releases/download/v1.1.3/duckdb_cli-linux-amd64.zip](https://github.com/duckdb/duckdb/releases/download/v1.1.3/duckdb_cli-linux-amd64.zip)
unzip duckdb_cli-linux-amd64.zip
sudo mv duckdb /usr/local/bin/


## Data Pipeline Notes

### Raleigh Incidents CSV
- **Issue**: The raw `raleigh_incidents.csv` contains a UTF-8 BOM (Byte Order Mark) and CRLF line endings that break the DuckDB auto-parser.
- **Pre-processing**: The file must be sanitized before ingestion using:
  `sed '1s/^\xef\xbb\xbf//; s/\r$//' data/raleigh_incidents.csv > data/cleaned_incidents.csv`
- **Ingestion**: Use `ignore_errors=true` and `strict_mode=false` in the `read_csv` function to bypass structural inconsistencies in the government data.

### Development Environment
To run the analysis notebook, ensure the virtual environment is active and launch Jupyter Lab:

```bash
# Activate venv
source .venv/bin/activate

# Launch Jupyter
python3 -m jupyter lab --ip=0.0.0.0 --port=8888 --no-browser