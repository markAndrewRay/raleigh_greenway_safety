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