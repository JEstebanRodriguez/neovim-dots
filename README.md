# Neovim Configuration - xjergx Setup

Configuración personalizada de Neovim 0.11+ con 50+ plugins optimizados para desarrollo moderno. Arquitectura limpia basada en lazy.nvim con namespace `xjergx`.

## 📋 Tabla de Contenidos

- [Requisitos](#requisitos)
- [Instalación](#instalación)
- [Plugins](#plugins)
- [Keybindings](#keybindings)
- [Estructura](#estructura)
- [Troubleshooting](#troubleshooting)

---

## Requisitos

### Mínimos
- **Neovim** ≥ 0.11
- **Git** (clonar plugins)
- **Node.js** (LSP para TypeScript/JavaScript)

### Recomendado
- **ripgrep** - Búsqueda rápida (`brew install ripgrep`)
- **fd** - Find alternative (`brew install fd`)
- **lazygit** - Git TUI (`brew install lazygit`)
- **Ghostty** - Terminal emulator

---

## Instalación

### 1. Instalar Neovim

**macOS:**
```bash
brew install neovim
```

**Linux (Ubuntu/Debian):**
```bash
sudo apt install neovim
```

**Windows (WSL2):**
```bash
sudo apt install neovim
```

### 2. Clonar/Vincular esta configuración

```bash
# Opción A: Reemplazar configuración existente
rm -rf ~/.config/nvim
ln -s /ruta/a/esta/carpeta ~/.config/nvim

# Opción B: Copiar directamente
cp -r /ruta/a/esta/carpeta ~/.config/nvim
```

### 3. Iniciar Neovim

```bash
nvim
```

**Primera ejecución:**
- lazy.nvim se auto-instala
- Todos los plugins se descargan
- Mason instala los language servers automáticamente
- Espera ~2 minutos en primera ejecución

### 4. Verificar Instalación

```bash
# Dentro de Neovim:
:Lazy          # Ver estado de plugins
:Mason         # Ver language servers
:checkhealth   # Diagnóstico completo
```

---

## Plugins

### 🎨 UI & Navigation (10 plugins)
| Plugin | Función |
|--------|---------|
| **snacks.nvim** | Framework UI: pickers, explorer, terminal, git |
| **noice.nvim** | Enhanced command & message UI |
| **lualine.nvim** | Status line personalizada |
| **which-key.nvim** | Descubrir keybindings |
| **incline.nvim** | Window title con iconos |
| **smear-cursor.nvim** | Cursor animado |
| **nui.nvim** | UI components library |
| **mini.nvim** | Colección de plugins mini útiles |
| **mini.icons** | Iconos para UI |
| **nvim-web-devicons** | File type icons |

### ✏️ Editor & Editing (10 plugins)
| Plugin | Función |
|--------|---------|
| **oil.nvim** | File explorer intuitivo |
| **Comment.nvim** | Toggle comentarios |
| **flash.nvim** | Navegación rápida (sneak-like) |
| **autoclose.nvim** | Auto-cierre brackets/quotes |
| **conform.nvim** | Code formatter |
| **nvim-colorizer.lua** | Visualizar colores |
| **todo-comments.nvim** | Highlight TODO/FIXME |
| **grug-far.nvim** | Find & replace avanzado |
| **nvim-rip-substitute** | Substitución con preview |
| **nvim-ts-context-commentstring** | Comentarios contextuales |

### 🌳 Treesitter (5 plugins)
| Plugin | Función |
|--------|---------|
| **nvim-treesitter** | Parser incremental |
| **nvim-treesitter-context** | Contexto en top del buffer |
| **nvim-ts-autotag** | Auto-rename HTML/Vue tags |
| **ts-comments.nvim** | Comentarios TypeScript mejorados |
| **nvim-treesitter-context** | Context scope highlight |

### 🔌 LSP & Completion (10 plugins)
| Plugin | Función |
|--------|---------|
| **nvim-lspconfig** | Configuración LSP |
| **mason.nvim** | Package manager para LSP |
| **mason-lspconfig.nvim** | Integración Mason+LSP |
| **blink.cmp** | Autocompletion moderna |
| **nvim-cmp** | Engine de completions |
| **friendly-snippets** | Snippets pre-hechos |
| **lsp_signature.nvim** | Signature help |
| **goto-preview.nvim** | Preview sin cambiar buffer |
| **hover.nvim** | Enhanced hover docs |
| **tiny-code-action.nvim** | Code actions UI |

### 🐛 Debugging (4 plugins)
| Plugin | Función |
|--------|---------|
| **nvim-dap** | Debug Adapter Protocol |
| **debugmaster.nvim** | DAP UI |
| **mason-nvim-dap.nvim** | Auto-install debug adapters |
| **one-small-step-for-vimkind** | Lua debugging |

### 🔧 Git Integration (2 plugins)
| Plugin | Función |
|--------|---------|
| **gitsigns.nvim** | Git signs en gutter |
| **diffview.nvim** | Diff viewer mejorado |

### 🎨 Colorschemes (3 plugins)
| Plugin | Función |
|--------|---------|
| **catppuccin** | Catppuccin theme (default) |
| **vague.nvim** | Vague theme |
| **transparent.nvim** | Transparent background |

### 🤖 AI & Tools (3 plugins)
| Plugin | Función |
|--------|---------|
| **claudecode.nvim** | Claude Code integration |
| **opencode.nvim** | Open en editor externo |
| **windsurf.nvim** | Windsurf editor integration |

### 📦 Utilities (5+ plugins)
- **plenary.nvim** - Utils library
- **vim-tmux-navigator** - tmux/vim navigation
- **neoterm** - Terminal embebido
- **lazydocker.nvim** - Docker TUI
- **logger.nvim** - Debug logger
- **diffview.nvim** - Diff viewer

### 🔤 Language Servers (Auto-instalados)
- **lua_ls** - Lua & Neovim API
- **ts_ls** - TypeScript/JavaScript
- **jsonls** - JSON/JSONC
- **omnisharp** - C#/.NET

### 🎯 Debug Adapters (Auto-instalados)
- **netcoredbg** - C#/.NET debugging

---

## Keybindings

### Leader Keys
- **Leader**: `<Space>`
- **Local Leader**: `\`

### Core Navigation
```
-               Toggle Oil explorer
<C-s>           Save file (Normal + Insert)
<C-a>           Select all
<C-/>           Toggle terminal
```

### Smart Find (Snacks)
```
<leader><space>  Smart file finder
<leader>,        Buffer picker
<leader>/        Grep/Buffer lines
<leader>:        Command history
<leader>ff       Find files
<leader>fc       Config files
<leader>fg       Git files
<leader>fr       Recent files
<leader>fb       Buffers
```

### Git Operations
```
<leader>gb       Git branches
<leader>gl       Git log
<leader>gL       Git log (line)
<leader>gs       Git status
<leader>gS       Git stash
<leader>gd       Git diff
<leader>gf       Git log (file)
<leader>gg       Lazygit
<leader>gB       Browse GitHub
```

### GitHub Integration
```
<leader>gi       Issues (open)
<leader>gI       Issues (all)
<leader>gp       PRs (open)
<leader>gP       PRs (all)
```

### Search & Grep
```
<leader>sg       Grep all files
<leader>sw       Grep word/selection
<leader>sb       Buffer lines
<leader>sB       Grep open buffers
<leader>s/       Search history
<leader>sc       Command history
<leader>sC       Commands
<leader>sd       Diagnostics
<leader>sD       Buffer diagnostics
<leader>sh       Help pages
<leader>sM       Man pages
<leader>sk       Keymaps
<leader>sl       Location list
<leader>sm       Marks
<leader>sq       Quickfix list
<leader>su       Undo history
```

### LSP
```
gd               Goto definition
gD               Goto declaration
gI               Goto implementation
gr               References
gy               Type definition
gai              Incoming calls
gao              Outgoing calls
<leader>ss       LSP symbols
<leader>sS       Workspace symbols
K                Hover
<C-k>            Signature help
<leader>ca       Code actions
<leader>lr       Rename
<leader>lf       Format
<leader>ld       Diagnostics
[d / ]d          Prev/Next diagnostic
```

### Debugging
```
<leader>db       Toggle breakpoint
<leader>dB       Conditional breakpoint
<leader>dc       Continue
<leader>di       Step into
<leader>do       Step over
<leader>dO       Step out
<leader>dt       Terminate
<leader>dr       REPL
<leader>dh       Hover inspection
<leader>dd       Toggle Debugmaster UI
```

### UI Toggles
```
<leader>us       Spelling
<leader>uw       Wrap
<leader>uL       Relative line numbers
<leader>ul       Line numbers
<leader>ud       Diagnostics
<leader>uT       Treesitter
<leader>ub       Dark/Light background
<leader>uh       Inlay hints
<leader>ug       Indent guides
<leader>uD       Dim inactive window
<leader>uc       Conceal level
```

### Other
```
<leader>z        Zen mode (fullscreen)
<leader>Z        Zoom window
<leader>.        Scratch buffer
<leader>S        Select scratch
<leader>bd       Delete buffer
<leader>cR       Rename file
<leader>un       Dismiss notifications
<leader>uC       Colorschemes
<leader>N        Neovim news
[[/]]            Prev/Next reference
```

---

## Estructura

```
nvim/
├── init.lua                      # Bootstrap
│
├── lua/xjergx/
│   ├── core/
│   │   ├── lazy.lua             # lazy.nvim setup
│   │   ├── keymap.lua           # Global keybindings
│   │   ├── options.lua          # Vim options
│   │   └── autocmds.lua         # Autocommands
│   │
│   └── plugins/
│       ├── ui.lua               # snacks.nvim + UI
│       ├── lsp.lua              # nvim-lspconfig
│       ├── mason.lua            # Mason + DAP
│       ├── completion.lua       # blink.cmp + nvim-cmp
│       ├── treesitter.lua       # Treesitter setup
│       ├── git.lua              # Git integration
│       ├── editor.lua           # Editor plugins
│       ├── formatter.lua        # conform.nvim
│       ├── dap.lua              # Debugging
│       ├── colorscheme.lua      # Themes
│       ├── comment.lua          # Comment.nvim
│       ├── hover.lua            # Hover info
│       ├── utils.lua            # oil, autoclose
│       ├── whichkey.lua         # which-key
│       ├── ai.lua               # AI tools
│       ├── opencode.nvim        # Open external
│       ├── ai-suggestion.lua    # AI suggestions
│       └── transparent.lua      # Transparency
│
└── README.md                     # Este archivo
```

---

## Primeros Pasos

### 1. Verificar Instalación

```bash
nvim
:Lazy
:Mason
:checkhealth
```

### 2. Instalar Language Servers Faltantes

```bash
# Dentro de Neovim:
:Mason
# Navegar con j/k, presionar 'i' para instalar
```

### 3. Explorar Keybindings

```bash
# Dentro de Neovim:
<leader>sk     # Ver todos los keybindings
<leader>ss     # LSP symbols
<leader>ff     # Buscar archivos
```

### 4. Actualizar Plugins

```bash
# Dentro de Neovim:
:Lazy update
:Lazy clean

# Desde terminal:
nvim +Lazy! +q
```

---

## Configuración Avanzada

### Agregar Nuevo Language Server

**1. Archivo `lua/xjergx/plugins/mason.lua`:**
```lua
ensure_installed = {
  "lua_ls",
  "ts_ls",
  "python",  -- Agregar aquí
}
```

**2. Archivo `lua/xjergx/plugins/lsp.lua`:**
```lua
vim.lsp.config("pyright", {
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py" },
})
```

### Agregar Nuevo Plugin

**Crear `lua/xjergx/plugins/myfeature.lua`:**
```lua
return {
  "autor/nombre-plugin",
  event = "VeryLazy",
  opts = {
    -- Opciones
  },
  keys = {
    { "<leader>x", function() require("myplugin").action() end, desc = "Mi Acción" }
  }
}
```

Lazy.nvim lo importará automáticamente.

### Cambiar Colorscheme

En `lua/xjergx/plugins/colorscheme.lua`:
```lua
return {
  "catppuccin/nvim",  -- Cambiar aquí
  lazy = false,
  priority = 1000,
  config = function()
    vim.cmd.colorscheme "catppuccin"  -- O el tema que prefieras
  end,
}
```

---

## Troubleshooting

### LSP no funciona
```bash
nvim +Mason           # Instalar servers
:checkhealth vim.lsp  # Diagnosticar
```

### Plugins no cargan
```bash
rm -rf ~/.local/share/nvim/lazy
nvim  # Reinstalar todo
```

### Terminal no funciona
```bash
echo $TERM
export TERM=xterm-256color
```

### Colors incorrectos
```lua
-- En lua/xjergx/core/options.lua:
vim.opt.termguicolors = true
```

### Mason descarga lenta
- Primera ejecución es normal (~2-5 minutos)
- Descarga en background mientras trabajas
- Usa `:Mason` para ver progreso

---

## Performance

- ✅ **Lazy loading** - Plugins cargan bajo demanda
- ✅ **Auto-install** - Language servers automáticos
- ✅ **Treesitter** - Solo compila lo necesario
- ✅ **Checker desactivado** - Mejor startup

---

## Comandos Útiles

```bash
# Actualizar plugins
nvim +Lazy! update +q

# Limpiar plugins no usados
nvim +Lazy! clean +q

# Instalar plugins faltantes
nvim +Lazy! install +q

# Diagnóstico completo
nvim +checkhealth +q
```

---

## Requisitos por Funcionalidad

| Funcionalidad | Requisito | Instalación |
|---|---|---|
| **LSP Lua** | lua-language-server | Auto (Mason) |
| **LSP TypeScript** | ts_ls | Auto (Mason) |
| **LSP JSON** | jsonls | Auto (Mason) |
| **LSP C#** | omnisharp | Auto (Mason) |
| **Debugging C#** | netcoredbg | Auto (Mason-DAP) |
| **Fuzzy Find** | ripgrep, fd | Manual |
| **Git** | git | Manual |
| **Terminal** | Cualquiera | N/A |

---

## Soporte

- `:help` - Documentación de Neovim
- `:h snacks` - snacks.nvim
- `:h mason` - Mason
- `:h lsp` - LSP

---

**Versión**: 1.0  
**Neovim**: ≥ 0.11  
**Última actualización**: 2025-12-31
