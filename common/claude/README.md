# CLAUDE

## Claude Code CLI reference

Complete reference for Claude Code command-line interface, including commands and flags.

### CLI commands

claude : Start interactive REPL: claude
claude "query" :  Start REPL with initial prompt:claude "explain this project"
claude -p "query" :  Query via SDK, then exit:claude -p "explain this function"
cat file | claude -p "query" : Process piped content:cat logs.txt | claude -p "explain"
claude -c :  Continue most recent conversation:claude -c
claude -c -p "query" :  Continue via SDK:claude -c -p "Check for type errors"
claude -r "<session-id>" "query" :  Resume session by ID:claude -r "abc123" "Finish this PR"
claude update :  Update to latest version:claude update
claude mcp :  Configure Model Context Protocol (MCP) servers:See the Claude Code MCP documentation

### CLI flags

Customize Claude Code’s behavior with these command-line flags:

Flag:Description:Example
--add-dir :  Add additional working directories for Claude to access (validates each path exists as a directory):claude --add-dir ../apps ../lib
--allowedTools :  A list of tools that should be allowed without prompting the user for permission, in addition to settings.json files:"Bash(git log:*)" "Bash(git diff:*)" "Read"
--disallowedTools :  A list of tools that should be disallowed without prompting the user for permission, in addition to settings.json files:"Bash(git log:*)" "Bash(git diff:*)" "Edit"
--print, -p:Print -- response without interactive mode (see SDK documentation for programmatic usage details):claude -p "query"
--output-format :  Specify output format for print mode (options: text, json, stream-json):claude -p "query" --output-format json
--input-format :  Specify input format for print mode (options: text, stream-json):claude -p --output-format json --input-format stream-json
--verbose :  Enable verbose logging, shows full turn-by-turn output (helpful for debugging in both print and interactive modes):claude --verbose
--max-turns :  Limit the number of agentic turns in non-interactive mode:claude -p --max-turns 3 "query"
--model :  Sets the model for the current session with an alias for the latest model (sonnet or opus) or a model’s full name:claude --model claude-sonnet-4-20250514
--permission-mode :  Begin in a specified permission mode:claude --permission-mode plan
--permission-prompt-tool :  Specify an MCP tool to handle permission prompts in non-interactive mode:claude -p --permission-prompt-tool mcp_auth_tool "query"
--resume :  Resume a specific session by ID, or by choosing in interactive mode:claude --resume abc123 "query"
--continue :  Load the most recent conversation in the current directory:claude --continue
--dangerously-skip-permissions :  Skip permission prompts (use with caution):claude --dangerously-skip-permissions

The --output-format json flag is particularly useful for scripting and automation, allowing you to parse Claude’s responses programmatically.

For detailed information about print mode (-p) including output formats, streaming, verbose logging, and programmatic usage, see the SDK documentation.

## claude --help

Usage: claude [options] [command] [prompt]

Claude Code - starts an interactive session by default, use -p/--print for
non-interactive output

Arguments:
  prompt                           Your prompt

Options:
  -d, --debug                      Enable debug mode
  --verbose                        Override verbose mode setting from config
  -p, --print                      Print response and exit (useful for pipes)
  --output-format <format>         Output format (only works with --print):
                                   "text" (default), "json" (single result), or
                                   "stream-json" (realtime streaming) (choices:
                                   "text", "json", "stream-json")
  --input-format <format>          Input format (only works with --print):
                                   "text" (default), or "stream-json" (realtime
                                   streaming input) (choices: "text",
                                   "stream-json")
  --mcp-debug                      [DEPRECATED. Use --debug instead] Enable MCP
                                   debug mode (shows MCP server errors)
  --dangerously-skip-permissions   Bypass all permission checks. Recommended
                                   only for sandboxes with no internet access.
  --allowedTools <tools...>        Comma or space-separated list of tool names
                                   to allow (e.g. "Bash(git:*) Edit")
  --disallowedTools <tools...>     Comma or space-separated list of tool names
                                   to deny (e.g. "Bash(git:*) Edit")
  --mcp-config <configs...>        Load MCP servers from JSON files or strings
                                   (space-separated)
  --append-system-prompt <prompt>  Append a system prompt to the default system
                                   prompt
  --permission-mode <mode>         Permission mode to use for the session
                                   (choices: "acceptEdits",
                                   "bypassPermissions", "default", "plan")
  -c, --continue                   Continue the most recent conversation
  -r, --resume [sessionId]         Resume a conversation - provide a session ID
                                   or interactively select a conversation to
                                   resume
  --model <model>                  Model for the current session. Provide an
                                   alias for the latest model (e.g. 'sonnet' or
                                   'opus') or a model's full name (e.g.
                                   'claude-sonnet-4-20250514').
  --fallback-model <model>         Enable automatic fallback to specified model
                                   when default model is overloaded (only works
                                   with --print)
  --settings <file-or-json>        Path to a settings JSON file or a JSON
                                   string to load additional settings from
  --add-dir <directories...>       Additional directories to allow tool access
                                   to
  --ide                            Automatically connect to IDE on startup if
                                   exactly one valid IDE is available
  --strict-mcp-config              Only use MCP servers from --mcp-config,
                                   ignoring all other MCP configurations
  --session-id <uuid>              Use a specific session ID for the
                                   conversation (must be a valid UUID)
  -v, --version                    Output the version number
  -h, --help                       Display help for command

Commands:
  config                           Manage configuration (eg. claude config set
                                   -g theme dark)
  mcp                              Configure and manage MCP servers
  migrate-installer                Migrate from global npm installation to
                                   local installation
  setup-token                      Set up a long-lived authentication token
                                   (requires Claude subscription)
  doctor                           Check the health of your Claude Code
                                   auto-updater
  update                           Check for updates and install if available
  install [options] [target]       Install Claude Code native build. Use
                                   [target] to specify version (stable, latest,
                                   or specific version)

---

## claude config --help

Usage: claude config [options] [command]

Manage configuration (eg. claude config set -g theme dark)

Options:
  -h, --help                             Display help for command

Commands:
  get [options] <key>                    Get a config value
  set [options] <key> <value>            Set a config value
  remove|rm [options] <key> [values...]  Remove a config value or items from a config array
  list|ls [options]                      List all config values
  add [options] <key> <values...>        Add items to a config array (space or comma separated)
  help [command]                         display help for command

---

## claude mcp --help

Usage: claude mcp [options] [command]

Configure and manage MCP servers

Options:
  -h, --help                                     Display help for command

Commands:
  serve [options]                                Start the Claude Code MCP server
  add [options] <name> <commandOrUrl> [args...]  Add a server
  remove [options] <name>                        Remove an MCP server
  list                                           List configured MCP servers
  get <name>                                     Get details about an MCP server
  add-json [options] <name> <json>               Add an MCP server (stdio or SSE) with a JSON string
  add-from-claude-desktop [options]              Import MCP servers from Claude Desktop (Mac and WSL only)
  reset-project-choices                          Reset all approved and rejected project-scoped (.mcp.json) servers within this project
  help [command]                                 display help for command

---

## claude migrate-installer --help

Usage: claude migrate-installer [options]

Migrate from global npm installation to local installation

Options:
  -h, --help  Display help for command

---

## claude setup-token --help

Usage: claude setup-token [options]

Set up a long-lived authentication token (requires Claude subscription)

Options:
  -h, --help  Display help for command

---

## claude doctor --help

Usage: claude doctor [options]

Check the health of your Claude Code auto-updater

Options:
  -h, --help  Display help for command

---

## claude update --help

Usage: claude update [options]

Check for updates and install if available

Options:
  -h, --help  Display help for command

---

## claude install  --help

Usage: claude install [options] [target]

Install Claude Code native build. Use [target] to specify version (stable,
latest, or specific version)

Options:
  --force     Force installation even if already installed
  -h, --help  Display help for command

---

