#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add feed sources
echo "src-git lienol https://github.com/Lienol/openwrt-package" >> "feeds.conf.default"

# Svn checkout packages from immortalwrt's repository
git clone --depth=1 -b openwrt-23.05 https://github.com/immortalwrt/packages
git clone --depth=1 -b openwrt-23.05 https://github.com/immortalwrt/luci

# Add luci-theme-argon
pushd ./luci/themes
rm -rf ./luci-theme-argon
git clone --depth=1 https://github.com/SamShum-June/luci-theme-argon #https://github.com/jerrykuku/luci-theme-argon

pushd ./luci-theme-argon
rm -rf ./RELEASE_ZH.md RELEASE.md README_ZH.md README.md LICENSE .gitignore .git .github
popd
popd
mkdir -p ./package/feeds/luci/
ln -sf ../../../luci/themes/luci-theme-argon ./package/feeds/luci/
ln -sf ../../../luci/themes/luci-theme-bootstrap-mod ./package/feeds/luci/
ln -sf ../../../luci/applications/luci-app-autoreboot ./package/feeds/luci/
ln -sf ../../../luci/applications/luci-app-cifs-mount ./package/feeds/luci/
ln -sf ../../../luci/applications/luci-app-rclone ./package/feeds/luci/
ln -sf ../../../luci/applications/luci-app-webadmin ./package/feeds/luci/           
ln -sf ../../../luci/applications/luci-app-zerotier ./package/feeds/luci/
ln -sf ../../../packages/net/dns-forwarder ./package/feeds/luci/
