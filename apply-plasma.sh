#!/usr/bin/env bash
# ==============================================================================
# apply-plasma.sh - Aplica el tema de iconos en KDE Plasma 6 y GTK
# ==============================================================================
set -euo pipefail

THEME_NAME="${1:-macOS-GoldenGate}"

echo "==> Configurando tema de iconos '$THEME_NAME' en KDE Plasma 6 y GTK..."
kwriteconfig6 --file kdeglobals --group Icons --key Theme "$THEME_NAME"
mkdir -p "${HOME}/.config/kdedefaults"
kwriteconfig6 --file "${HOME}/.config/kdedefaults/kdeglobals" --group Icons --key Theme "$THEME_NAME"

# Configurar temas GTK 3 y 4 y xsettingsd
mkdir -p "${HOME}/.config/gtk-3.0" "${HOME}/.config/gtk-4.0"
sed -i "s/^gtk-icon-theme-name=.*/gtk-icon-theme-name=${THEME_NAME}/" "${HOME}/.config/gtk-3.0/settings.ini" 2>/dev/null || true
sed -i "s/^gtk-icon-theme-name=.*/gtk-icon-theme-name=${THEME_NAME}/" "${HOME}/.config/gtk-4.0/settings.ini" 2>/dev/null || true
sed -i "s/Net\/IconThemeName .*/Net\/IconThemeName \"${THEME_NAME}\"/" "${HOME}/.config/xsettingsd/xsettingsd.conf" 2>/dev/null || true

# Reconstruir base de datos binaria de tipos MIME y servicios KDE (KSycoca)
if command -v kbuildsycoca6 >/dev/null 2>&1; then
    echo "==> Reconstruyendo base de datos de servicios de KDE (kbuildsycoca6)..."
    kbuildsycoca6 --noincremental >/dev/null 2>&1 || true
fi

# Recargar plasmashell si está en ejecución
if systemctl --user is-active --quiet plasma-plasmashell.service; then
    echo "==> Recargando plasma-plasmashell.service..."
    systemctl --user restart plasma-plasmashell.service
fi

# Recargar macos-dock si está en ejecución
if systemctl --user is-active --quiet macos-dock.service; then
    echo "==> Recargando macos-dock.service..."
    systemctl --user restart macos-dock.service
fi

echo "==> Tema de iconos '$THEME_NAME' aplicado correctamente."
