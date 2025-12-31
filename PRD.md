# Product Requirements Document - Neovim Dotfile

## Visión General

Configuración de Neovim personalizada diseñada para proporcionar un entorno de desarrollo moderno, eficiente y altamente personalizable. La configuración prioriza la productividad, la estética y la integración con herramientas de desarrollo modernas.

## Objetivos Principales

1. **Productividad**: Proporcionar atajos y características que aceleren el flujo de trabajo de desarrollo
2. **Estética**: Mantener una interfaz visual coherente y agradable
3. **Extensibilidad**: Permitir fácil integración de nuevos plugins y características
4. **Rendimiento**: Optimizar tiempos de carga y responsividad
5. **Integración**: Conectar con herramientas externas modernas (Docker, SQL, AI, Git)

## Características Principales

### 1. Core Editor (`xjergx/core/`)
- **Options**: Configuración base de Neovim (indentación, búsqueda, etc.)
- **Lazy Loading**: Gestión eficiente de plugins con lazy.nvim
- **Keymaps**: Atajos personalizados organizados por categoría
- **Autocmds**: Comandos automáticos para eventos específicos

### 2. Interfaz de Usuario (`ui.lua`)
- Dashboard personalizado con Snacks.nvim
- Lualine con secciones dinámicas
- Incline para nombres de archivo en ventanas
- Notificaciones con Snacks
- Integración con tmux-status

### 3. Búsqueda y Navegación (`ui.lua`)
- Smart file picker con Snacks
- Grep integrado
- Git file navigation
- LSP symbol search
- Buffer management
- File explorer con Oil

### 4. Desarrollo y LSP (`lsp.lua`)
- Configuración de lenguajes múltiples
- Mason para gestión de LSP servers
- Hover documentation
- Code actions con tiny-code-action
- Diagnostic display

### 5. Completitud (`completion.lua`)
- Autocompletión con nvim-cmp
- Snippets
- Integración con LSP

### 6. Formateador (`formatter.lua`)
- Formateo automático de código
- Integración con prettier, black, etc.

### 7. Comentarios (`comment.lua`)
- Mini.comment para comentar líneas
- Treesitter context awareness
- Soporte multi-lenguaje

### 8. Terminal y Tools (`editor.lua`)
- Floating terminal con neoterm
- Lazydocker para gestión de containers
- LazySQL para queries de base de datos
- Claude Code integration

### 9. Git Integration (`git.lua`)
- Lazygit integration
- Git diff and staging
- GitHub integration (issues, PRs)

### 10. Debugging (`dap.lua`)
- Debug Adapter Protocol
- Breakpoints y stepping

### 11. Temas (`colorscheme.lua`, `transparent.lua`)
- Soporte para múltiples colorschemes
- Modo transparente opcional
- Catppuccin como tema principal

### 12. AI & Suggestions (`ai.lua`, `ai-suggestion.lua`)
- Integración con Claude Code
- Sugerencias de código
- Completitud asistida por IA

### 13. Utilidades
- Which-key para descubrimiento de atajos
- Todo comments
- Goto preview
- Smear cursor
- Inline diagnostics

## Estructura de Archivos

```
~/.config/nvim/
├── init.lua                          # Punto de entrada
├── lua/xjergx/
│   ├── core/
│   │   ├── options.lua              # Configuración base
│   │   ├── lazy.lua                 # Gestión de plugins
│   │   ├── keymap.lua               # Keymaps globales
│   │   └── autocmds.lua             # Autocmds
│   └── plugins/
│       ├── ui.lua                   # Snacks, lualine, incline
│       ├── lsp.lua                  # LSP configuration
│       ├── completion.lua           # Autocompletion
│       ├── formatter.lua            # Code formatting
│       ├── comment.lua              # Comment management
│       ├── editor.lua               # Terminal, tools
│       ├── git.lua                  # Git integration
│       ├── dap.lua                  # Debugging
│       ├── mason.lua                # LSP server management
│       ├── colorscheme.lua          # Theme configuration
│       ├── transparent.lua          # Transparency
│       ├── ai.lua                   # AI integration
│       ├── ai-suggestion.lua        # AI suggestions
│       ├── hover.lua                # Documentation hover
│       ├── whichkey.lua             # Key binding discovery
│       ├── opencode.lua             # External tools
│       └── utils.lua                # Utilities
└── lazy-lock.json                   # Plugin versions lock
```

## Especificaciones Técnicas

### Requisitos
- Neovim >= 0.9
- Treesitter para syntax highlighting
- Ripgrep para búsqueda
- Git para integración
- Node.js para LSP servers

### Plugins Externos
- **Gestor de plugins**: lazy.nvim
- **UI**: Snacks.nvim, lualine, incline, noice
- **Búsqueda**: Snacks picker
- **LSP**: nvim-lspconfig, mason
- **Completitud**: nvim-cmp
- **Terminal**: neoterm, Snacks terminal
- **Git**: lazygit integrations
- **Debugging**: nvim-dap
- **AI**: AI suggestion plugins
- **Otros**: 15+ plugins de utilidad

## Flujos de Trabajo Soportados

1. **Edición General**: Navegación, búsqueda, edición con comentarios
2. **Desarrollo Web**: LSP, formateador, git integration
3. **Debugging**: Breakpoints, stepping, variables
4. **DevOps**: Lazydocker, terminal flotante
5. **Database**: LazySQL
6. **AI-Assisted**: Sugerencias de código, completitud
7. **Git Workflow**: Staging, commits, diffs, branches

## Atajos Principales

### Navegación
- `<leader><space>`: Smart file finder
- `<leader>,`: Buffer list
- `<leader>e`: File explorer
- `<leader>/`: Search in buffer

### Git
- `<leader>gb`: Git branches
- `<leader>gl`: Git log
- `<leader>gs`: Git status
- `<leader>gg`: Lazygit

### LSP
- `gd`: Go to definition
- `gr`: References
- `gI`: Go to implementation
- `gy`: Go to type definition

### Terminal
- `<C-\>`: Toggle floating terminal
- `<leader>tc`: Toggle Claude Code terminal
- `<leader>ld`: Lazydocker

### Debug
- Configuración en `dap.lua`

## Consideraciones de Rendimiento

- Lazy loading de plugins para startup rápido
- Carga condicional de plugins según eventos
- Optimización de Treesitter
- Lazy loading de LSP servers

## Roadmap Futuro

1. Mejorar configuración de DAP
2. Expandir soporte de lenguajes
3. Personalización de colorscheme
4. Performance profiling
5. Documentación adicional

## Mantenimiento

- Actualizar plugins regularmente con `Lazy update`
- Revisar logs de error en Neovim
- Mantener coherencia en keybindings
- Documentar cambios nuevos

## Contacto & Feedback

Esta configuración es un trabajo en progreso. Los cambios se realizan según necesidades del desarrollador.

---

**Versión**: 1.0
**Última actualización**: 2025-12-31
**Estado**: En desarrollo activo