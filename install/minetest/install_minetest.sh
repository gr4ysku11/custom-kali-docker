#!/usr/bin/env bash
set -ex
apt-get update
apt-get install -y minetest

# Add desktop icon
cp /usr/share/applications/net.minetest.minetest.desktop $HOME/Desktop/
chmod +x $HOME/Desktop/net.minetest.minetest.desktop

# Wrap game bin for VGL support
cat >/usr/bin/minetest <<EOL
#!/usr/bin/env bash
if [ -f /opt/VirtualGL/bin/vglrun ] && [ ! -z "\${KASM_EGL_CARD}" ] && [ ! -z "\${KASM_RENDERD}" ] && [ -O "\${KASM_RENDERD}" ] && [ -O "\${KASM_EGL_CARD}" ] ; then
    echo "Starting Minetest with GPU Acceleration on EGL device \${KASM_EGL_CARD}"
    vglrun -d "\${KASM_EGL_CARD}" /usr/games/minetest "\$@"
else
    echo "Starting Minetest"
    /usr/games/minetest "\$@"
fi
EOL
chmod +x /usr/bin/minetest

# Cleanup
apt-get autoclean
rm -rf \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*
