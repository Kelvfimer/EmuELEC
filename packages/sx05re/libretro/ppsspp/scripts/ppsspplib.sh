#!/bin/bash

# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2024-present Héctor C.M. (github.com/kelvfimer)

#!/bin/bash

DEST_DIR="/storage/roms/savestates/ppsspp"
SRC_ASSETS="/storage/.config/ppsspp/assets"
COMPAT_FILE="$DEST_DIR/compat.ini"
FLASH_DIR="$DEST_DIR/flash0"

# Crear el directorio destino si no existe
if [ ! -d "$DEST_DIR" ]; then
    mkdir -p "$DEST_DIR"
    echo "Directorio creado: $DEST_DIR"
fi

# Verificar que la carpeta de origen existe
if [ ! -d "$SRC_ASSETS" ]; then
    echo "⚠️  Carpeta de origen no encontrada: $SRC_ASSETS"
    exit 1
fi

# Si faltan compat.ini o flash0, copiar el contenido de assets
if [ ! -f "$COMPAT_FILE" ] || [ ! -d "$FLASH_DIR" ]; then
    cp -r "$SRC_ASSETS/"* "$DEST_DIR/"
    echo "Contenido de assets copiado a $DEST_DIR"
else
    echo "compat.ini y flash0 ya existen en $DEST_DIR, no se copia nada."
fi
