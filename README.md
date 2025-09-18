# bash-completions

A unified bash completion management utility that automatically generates intelligent tab-completion files for shell scripts using Claude AI.

**Repository:** https://github.com/Open-Technology-Foundation/bash_completions

## Features

- **AI-Powered Generation** - Uses Claude AI to analyze scripts and generate context-aware completions
- **Batch Processing** - Scan entire directory trees and process multiple scripts at once
- **Symlink Integration** - Works seamlessly with `.symlink` files for organized script management
- **System Installation** - Automatically installs completions to `/etc/bash_completion.d/`
- **Smart Detection** - Only generates completions for scripts that don't already have them

## Installation

```bash
# Clone the repository
git clone https://github.com/Open-Technology-Foundation/bash_completions bash-completions
cd bash-completions

# Make the script executable
chmod +x bash-completions

# Optional: Add to PATH
sudo ln -s "$(pwd)/bash-completions" /usr/local/bin/

# Generate completion for the tool itself
./bash-completions generate bash-completions

# Install the completion system-wide
sudo cp .bash_completion /etc/bash_completion.d/bash-completions

# Load the completion in current session
source /etc/bash_completion
```

## Usage

The `bash-completions` command provides three subcommands for different workflows:

### Generate Command

Generate bash completion files for specific scripts using Claude AI.

```bash
bash-completions generate [OPTIONS] SCRIPT [SCRIPT...]
```

**Options:**
- `-d, --directory DIR` - Directory containing the scripts (default: current directory)
- `-v, --verbose` - Show detailed output including Claude's analysis
- `-q, --quiet` - Suppress non-error output
- `-h, --help` - Show help message

**Examples:**
```bash
# Generate completion for a single script
bash-completions generate myscript

# Generate for multiple scripts in a specific directory
bash-completions generate -d /path/to/scripts script1 script2 script3

# Verbose mode to see Claude's analysis
bash-completions generate -v complex-script
```

### Symlink Command

Batch process directory trees by scanning for `.symlink` files and generating completions for all listed executables.

```bash
bash-completions symlink [OPTIONS] [DIRECTORY]
```

**Options:**
- `-f, --force` - Regenerate existing completion files
- `-n, --dry-run` - Preview changes without making them
- `-s, --skip-install` - Generate completions but don't install system-wide
- `-q, --quiet` - Suppress non-error output
- `-v, --verbose` - Enable verbose output
- `-h, --help` - Show help message

**Examples:**
```bash
# Process current directory and install completions
bash-completions symlink

# Scan entire directory tree
bash-completions symlink /ai/scripts

# Preview what would be done
bash-completions symlink -n /ai/scripts

# Force regeneration of all completions
bash-completions symlink -f /ai/scripts

# Generate without installing
bash-completions symlink -s /ai/scripts
```

### Copy Command

Install completion files to the system directory.

```bash
bash-completions copy [OPTIONS] [DIRECTORY]
```

**Options:**
- `-y, --yes` - Non-interactive mode (overwrite without prompting)
- `-h, --help` - Show help message

**Examples:**
```bash
# Interactive installation (prompts before overwriting)
bash-completions copy /ai/scripts

# Non-interactive installation (force overwrite)
bash-completions copy -y /ai/scripts

# Copy from current directory
bash-completions copy
```

## File Structure

### Input Files

**`.symlink` files** - Lists executable names that need completions (one per line):
```
script1
script2
# This is a comment
script3
```

### Output Files

- **`.bash_completion`** - Generated completion file in each script's directory
- **`/etc/bash_completion.d/<dirname>`** - System-wide installation location

## Workflow Examples

### Single Script Workflow

```bash
# 1. Navigate to your script's directory
cd ~/my-scripts

# 2. Generate completion
bash-completions generate my-awesome-script

# 3. Test the completion locally
source .bash_completion
my-awesome-script <TAB>

# 4. Install system-wide
sudo bash-completions copy
```

### Project-Wide Workflow

```bash
# 1. Create .symlink files in each directory listing the scripts
echo "build" > project/.symlink
echo "deploy" >> project/.symlink
echo "test" >> project/.symlink

# 2. Process the entire project tree
bash-completions symlink ~/project

# 3. All completions are generated and installed automatically
```

### Development Workflow

```bash
# Preview what would be generated
bash-completions symlink -n ~/dev

# Generate without installing (for testing)
bash-completions symlink -s ~/dev

# Force regenerate after script updates
bash-completions symlink -f ~/dev

# Install when ready
bash-completions copy ~/dev
```

## How It Works

1. **Script Analysis** - The tool passes your script to Claude AI along with any README or documentation files in the same directory
2. **Intelligent Generation** - Claude analyzes the script's options, arguments, and patterns to create appropriate completion logic
3. **Local Storage** - Completions are saved as `.bash_completion` in the script's directory
4. **System Installation** - Files are copied to `/etc/bash_completion.d/` with the directory name as the filename

## Exit Codes

### Generate Command
- `0` - Success
- `1` - No scripts specified
- `2` - Directory access error
- `3` - Script not found
- `4` - Generation failed

### Symlink Command
- `0` - Success
- `1` - Invalid arguments
- `2` - Directory not accessible
- `3` - Generation errors occurred
- `4` - Installation failed

### Copy Command
- `0` - Success
- Non-zero - Copy operation failed

## Requirements

- **Bash** 5.0 or higher
- **Claude CLI** - Must be installed and configured
- **Standard Unix Tools** - `find`, `readlink`, `grep`, `sort`
- **Sudo Access** - Required for system-wide installation

## Best Practices

1. **Documentation** - Include clear help text in your scripts for better completion generation
2. **Testing** - Always test generated completions before system-wide installation
3. **Dry Run** - Use `-n` flag to preview changes before applying them
4. **Version Control** - Commit `.bash_completion` files to track changes
5. **Review** - Check generated completions for accuracy, especially for complex scripts

## Integration with Symlink

This tool is designed to work with the [symlink](https://github.com/Open-Technology-Foundation/symlink) utility. To use the `.symlink` facility for batch processing, you need the symlink program installed from https://github.com/Open-Technology-Foundation/symlink.

1. Run `symlink --scan-symlink` to identify scripts needing symlinks
2. Run `bash-completions symlink` to generate completions for all symlinked scripts
3. Both tools use the same `.symlink` file format

## Security Considerations

- The tool uses `--dangerously-skip-permissions` flag with Claude CLI after validating directory access
- Scripts are analyzed locally - no code is sent to external services beyond Claude AI
- Always review generated completions before installation
- Ensure scripts come from trusted sources

## Troubleshooting

### Completions not working

```bash
# Reload bash completions
source /etc/bash_completion

# Or source directly in current session
source /path/to/.bash_completion
```

### Permission denied

```bash
# Ensure scripts are executable
chmod +x your-script

# Use sudo for system installation
sudo bash-completions copy
```

### Claude command not found

Ensure the Claude CLI is installed and in your PATH:
```bash
which claude || echo "Claude CLI not found"
```

### Generation fails

Use verbose mode to debug:
```bash
bash-completions generate -v problematic-script
```

## License

This project is licensed under the GNU General Public License v3.0 (GPL-3.0) - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please ensure:
1. Code follows the project's bash coding style
2. All changes are tested
3. Documentation is updated as needed

## Author

Open Technology Foundation

---

Generated with bash-completions