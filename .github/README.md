# GitHub Workflows Setup

Configuración automática de releases con versionamiento semántico y changelog generado por commits.

## 📦 Archivos Creados

```
.github/
├── workflows/
│   ├── release.yml                 # Workflow recomendado ⭐
│   ├── release-alternative.yml     # Versión alternativa
│   └── RELEASE_GUIDE.md            # Guía del workflow
├── COMMIT_CONVENTION.md            # Convención de commits
└── README.md                       # Este archivo
```

## 🚀 Quick Start

### 1. Elegir Workflow

**`release.yml`** (Recomendado)
- ✅ Análisis bash nativo
- ✅ Sin dependencias externas
- ✅ Rápido y eficiente
- ✅ Mejor para este proyecto

**`release-alternative.yml`** (Alternativa)
- ✅ Más robusto
- ✅ Mejor manejo de edge cases
- ✅ Logging detallado
- ✅ Para proyectos complejos

### 2. Configuración

El workflow está listo para usar, solo necesita que:
- Estés en un repositorio de GitHub
- Tengas permisos de push
- Los commits sigan la convención (ver COMMIT_CONVENTION.md)

### 3. Primer Release

```bash
# Asegúrate de que haya commits en main
git log --oneline

# El workflow creará automáticamente:
# - Tag: v1.0.0 (primer release)
# - GitHub Release con changelog
# - Descripción categorizada con emojis
```

## 📋 Convención de Commits

Todos los ejemplos usan **Conventional Commits**:

```
feat:      Nueva característica      → MINOR version bump (1.0.0 → 1.1.0)
fix:       Bug fix                   → PATCH version bump (1.0.0 → 1.0.1)
BREAKING:  Breaking change           → MAJOR version bump (1.0.0 → 2.0.0)
docs:      Documentación             → Sin bump
chore:     Mantenimiento             → Sin bump
perf:      Performance               → MINOR
refactor:  Refactorización           → MINOR
ci:        CI/CD                     → Sin bump
```

## 📝 Ejemplos de Uso

### Ejemplo 1: Feature Release

```bash
# Commits
git commit -m "feat: add snacks.nvim picker"
git commit -m "feat(lsp): add typescript server"
git commit -m "fix: terminal initialization bug"

# Resultado
# - Versión: v1.1.0 (MINOR bump)
# - Changelog:
#   ✨ Features
#   - ✨ add snacks.nvim picker
#   - ✨ add typescript server
#   🐛 Fixes
#   - 🐛 terminal initialization bug
```

### Ejemplo 2: Breaking Change

```bash
# Commits
git commit -m "BREAKING: rewrite plugin system"
git commit -m "feat: new plugin API"
git commit -m "docs: update migration guide"

# Resultado
# - Versión: v2.0.0 (MAJOR bump)
# - Changelog:
#   ⚠️ BREAKING CHANGES
#   - ❌ rewrite plugin system
#   ✨ Features
#   - ✨ new plugin API
#   📝 Documentation
#   - 📝 update migration guide
```

### Ejemplo 3: Plugin Management

```bash
# Agregar plugin
git commit -m "feat: add treesitter plugin"

# Remover plugin
git commit -m "chore: remove deprecated plugin"

# Resultado
# - Versión: v1.1.0
# - Changelog:
#   🎉 New Plugins
#   - 🎉 add treesitter plugin
#   🗑️ Removed Plugins
#   - 🗑️ remove deprecated plugin
```

## 🎨 Emojis en Release

| Emoji | Tipo | Ejemplo |
|-------|------|---------|
| ✨ | Feature | `feat: add new plugin` |
| 🐛 | Fix | `fix: bug in lsp` |
| 🎉 | Plugin Nuevo | `feat: add treesitter` |
| 🗑️ | Plugin Removido | `chore: remove plugin` |
| ⚠️ | Breaking | `BREAKING: change API` |
| ⚡ | Performance | `perf: optimize startup` |
| 📝 | Docs | `docs: update readme` |
| 🔄 | Refactor | `refactor: code structure` |
| 🔧 | Chores | `chore: update deps` |
| ❌ | Critical | `BREAKING: drop support` |

## 🔄 Workflow Completo

```
┌─────────────────────────────────────────┐
│  Haces push a main                      │
└────────────────┬────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────┐
│  GitHub Actions se dispara              │
│  - Fetch commits desde último tag       │
│  - Analiza tipos de commits             │
│  - Calcula nueva versión                │
└────────────────┬────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────┐
│  Genera changelog                       │
│  - Agrupa por tipo (feat, fix, etc)     │
│  - Añade emojis                         │
│  - Formatea para legibilidad            │
└────────────────┬────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────┐
│  Crea Git Tag                           │
│  - nombre: vX.Y.Z                       │
│  - mensaje: Release vX.Y.Z              │
│  - push a origin                        │
└────────────────┬────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────┐
│  Crea GitHub Release                    │
│  - Tag: vX.Y.Z                          │
│  - Título: Release vX.Y.Z               │
│  - Body: Changelog formateado           │
│  - Visible en GitHub                    │
└────────────────┬────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────┐
│  ✅ Completo!                           │
│  - Tag creado                           │
│  - Release publicado                    │
│  - Changelog visible                    │
└─────────────────────────────────────────┘
```

## 📊 Versionamiento Automático

El workflow calcula automáticamente la versión según los commits:

**v0.0.0 → v0.1.0**
```
feat: add feature
fix: bug fix
```
→ MINOR bump (hay feature)

**v1.0.0 → v1.0.1**
```
fix: bug fix
docs: update readme
```
→ PATCH bump (solo fixes/docs)

**v1.0.0 → v2.0.0**
```
BREAKING: change api
feat: new system
```
→ MAJOR bump (hay breaking change)

## 📝 Logs y Debugging

Puedes ver los logs del workflow en:
1. GitHub → Actions (tab)
2. Selecciona el workflow "Create Release"
3. Haz click en la ejecución
4. Expande cada paso para ver los detalles

## ✅ Verificación

Para verificar que todo está funcionando:

```bash
# 1. Ver si el workflow existe
ls -la .github/workflows/

# 2. Hacer un commit de prueba
git commit -m "feat: test release workflow"
git push origin main

# 3. Ir a GitHub → Actions
# 4. Ver si "Create Release" aparece ejecutándose
# 5. Ir a Releases para ver el resultado
```

## 🔐 Permisos Necesarios

El workflow necesita permisos de:
- ✅ `contents: write` - Para crear tags y releases
- ✅ `GITHUB_TOKEN` - Token automático (no requiere configuración)

Esto ya está configurado en el archivo `.yml`.

## 🐛 Troubleshooting

### El workflow no se ejecuta

**Solución:**
1. Verifica que estés en rama `main`
2. Revisa que el archivo esté en `.github/workflows/release.yml`
3. Ve a Actions y verifica si hay errores
4. Asegúrate de que el YAML tenga syntax correcto

### Los commits no se detectan

**Solución:**
1. Verifica el formato: `feat: description` (sin typos)
2. Asegúrate de que el `:` esté presente
3. Usa `git log --oneline` para ver los commits
4. Revisa que los commits estén después del último tag

### El tag ya existe

**Solución:**
```bash
# Eliminar tag local y remoto
git tag -d v1.0.0
git push origin :v1.0.0

# El próximo push recreará el tag
```

## 📚 Más Información

- **Conventional Commits**: Ver `COMMIT_CONVENTION.md`
- **Guía del Workflow**: Ver `workflows/RELEASE_GUIDE.md`
- **Semantic Versioning**: https://semver.org/
- **GitHub Workflows Docs**: https://docs.github.com/en/actions

## 🎯 Próximos Pasos

1. ✅ Archivos creados
2. ⏳ Haz push a main
3. ⏳ El workflow se ejecutará automáticamente
4. ⏳ Verifica el Release en GitHub

## 📋 Resumen

| Característica | Status |
|---|---|
| Versionamiento automático | ✅ Implementado |
| Análisis de commits | ✅ Bash nativo |
| Changelog categorizado | ✅ Con emojis |
| GitHub Releases | ✅ Automático |
| Git tags | ✅ Automático |
| Breaking changes | ✅ Detectados |
| Plugin tracking | ✅ Distinguido |

---

**Versión**: 1.0
**Última actualización**: 2025-12-31
**Compatible con**: GitHub (public/private repos)

¡Listo para crear releases automáticos! 🚀