#!/bin/bash

# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)

. /etc/profile

[ ! -f /storage/roms/savestates/PPSSPPSDL/PSP/SYSTEM/ppsspp.ini ] && mkdir -p /storage/roms/savestates/PPSSPPSDL/PSP/SYSTEM && cp -Rf /usr/config/ppsspp/PSP/SYSTEM/ppsspp.ini /storage/roms/savestates/PPSSPPSDL/PSP/SYSTEM/ppsspp.ini

[ ! -f /storage/roms/savestates/PPSSPPSDL/PSP/SYSTEM/controls.ini ] && cp -Rf /usr/config/ppsspp/PSP/SYSTEM/ppsspp.ini /storage/roms/savestates/PPSSPPSDL/PSP/SYSTEM/controls.ini

if [ ! -d "/storage/roms/savestates/PPSSPPSDL/PSP/Cheats" ] || [ -z "$(ls -A /storage/roms/savestates/PPSSPPSDL/PSP/Cheats 2>/dev/null)" ]; then
    cp -Rf /usr/config/ppsspp/PSP/Cheats/. /storage/roms/savestates/PPSSPPSDL/PSP/Cheats
fi
ppssppcheevos.sh

AUTOGP=$(get_ee_setting ppsspp_auto_gamepad)
if [[ "${AUTOGP}" == "1" ]]; then
	set_ppsspp_joy.sh
fi

ARG=${1//[\\]/}
export SDL_AUDIODRIVER=alsa          
PPSSPPSDL --fullscreen "${ARG}"
