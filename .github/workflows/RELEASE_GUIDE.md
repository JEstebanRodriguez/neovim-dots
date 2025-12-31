# GitHub Actions Release Workflow

Este workflow crea automáticamente releases con versionamiento semántico cuando se hace push a la rama `main`.

## 🚀 Cómo Funciona

1. **Trigger**: Se dispara cuando hay un push a `main`
2. **Análisis**: Analiza los commits desde el último tag
3. **Versionamiento**: Calcula la versión según Semantic Versioning:
   - `BREAKING` o `!` → Major (v1.0.0 → v2.0.0)
   - `feat:` → Minor (v1.0.0 → v1.1.0)
   - `fix:` → Patch (v1.0.0 → v1.0.1)

4. **Changelog**: Genera changelog categorizado con emojis
5. **Release**: Crea un tag de release y una GitHub Release

## 📝 Formato de Commits

Para que el workflow funcione correctamente, usa estos prefijos:

```
feat: descripción          # Nueva característica → Minor
fix: descripción           # Bug fix → Patch
docs: descripción          # Documentación
chore: descripción         # Tareas de mantenimiento
perf: descripción          # Mejora de performance
refactor: descripción      # Refactorización
ci: descripción            # Cambios en CI/CD
BREAKING: descripción      # Breaking change → Major
```

## 📦 Ejemplos de Commits

```bash
# Feature - Nuevo plugin
git commit -m "feat: add treesitter plugin"

# Fix
git commit -m "fix: LSP initialization bug"

# Plugin removido
git commit -m "feat: remove unused plugin"

# Breaking change
git commit -m "BREAKING: change keybinding structure"

# Performance
git commit -m "perf: optimize startup time"

# Documentación
git commit -m "docs: update README with new plugins"
```

## 🎯 Resultado del Workflow

### Versión 0.1.0 → 0.2.0

Si los commits son:
```
feat: add snacks picker
feat: add plugin management
fix: lsp initialization
docs: update readme
```

El changelog será:

```
# Release v0.2.0

## 📋 Resumen de Cambios

### ✨ Nuevas Características
- ✨ add snacks picker
- ✨ add plugin management
- 📝 update readme

### 🐛 Fixes
- 🐛 lsp initialization

---
Made with ❤️
```

## 🎨 Emojis Usados

| Emoji | Significado |
|-------|-----------|
| ✨ | Nuevas características |
| 🐛 | Bug fixes |
| 🎉 | Nuevos plugins |
| 🗑️ | Plugins removidos |
| ⚠️ | Breaking changes |
| ⚡ | Performance |
| 📝 | Documentación |
| 🔄 | Refactorización |
| 🔧 | Chores/Maintenance |
| ❌ | Cambios críticos |

## 🔧 Configuración

El workflow está configurado para:
- Activarse automáticamente en push a `main`
- Crear tags de forma automática
- Crear GitHub Releases
- Incluir historial completo de commits

## ⚙️ Variables Necesarias

El workflow usa:
- `secrets.GITHUB_TOKEN` - Token automático de GitHub (no necesita configuración)
- Git history del repositorio

## 📌 Primer Release

Para el primer release, el workflow detectará que no hay tags previos y:
- Creará la versión `v1.0.0`
- Incluirá todos los commits desde el inicio
- Generará el changelog completo

## 🚨 Notas Importantes

1. **Convenciones de commits**: El workflow depende de que sigas el formato `type: description`
2. **Main branch**: El workflow solo funciona en pushes a `main`
3. **Permisos**: Asegúrate de que el token de GitHub tiene permiso de `contents: write`
4. **Primeras ejecuciones**: La primera vez que se ejecuta crea v1.0.0

## 📊 Visualizar Releases

Los releases se verán en:
- GitHub: `https://github.com/tu-usuario/repo/releases`
- Tags: `https://github.com/tu-usuario/repo/tags`

Cada release contendrá:
- Versión semántica (v1.2.3)
- Changelog categorizado
- Tags con todos los commits

## 🔄 Cómo Comenzar

1. Asegúrate de que el archivo `.github/workflows/release.yml` esté en el repo
2. Haz push a `main` con commits que sigan el formato
3. El workflow se ejecutará automáticamente
4. Revisa el tab de "Actions" para ver el progreso
5. Una vez completado, ve a "Releases" para ver el release creado

## 📝 Ejemplo Completo

```bash
# Rama feature
git checkout -b add-new-features
git commit -m "feat: add new plugin support"
git commit -m "feat: add configuration UI"
git commit -m "fix: LSP timeout issue"
git push origin add-new-features

# Merge a main
gh pr create
gh pr merge

# Después del merge, el workflow:
# 1. Detecta commits en main
# 2. Calcula v1.1.0 (feat = minor bump)
# 3. Crea tag v1.1.0
# 4. Genera changelog con:
#    ✨ Nuevas Características
#    🐛 Fixes
# 5. Publica GitHub Release
```

## 🐛 Troubleshooting

**El workflow no se ejecuta:**
- Verifica que el archivo esté en `.github/workflows/release.yml`
- Asegúrate de hacer push a `main`, no a otra rama
- Revisa que el archivo YAML tenga syntax correcto

**El tag ya existe:**
- El workflow intentará sobrescribir si la versión coincide
- Puedes eliminar el tag con `git push origin :v1.0.0`

**Commits no se detectan:**
- Asegúrate de usar el formato correcto: `feat:`, `fix:`, etc.
- El prefijo debe ir antes del `:` sin espacios

---

¡Disfruta tus releases automáticos! 🚀
