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
sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package'


# Svn checkout packages from immortalwrt's repository
git clone --depth=1 -b openwrt-23.05 https://github.com/immortalwrt/packages
git clone --depth=1 -b openwrt-23.05 https://github.com/immortalwrt/luci

#test
# Add luci-theme-argon
pushd ./luci/themes
rm -rf ./luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon
pushd ./luci-theme-argon
rm -rf ./RELEASE_ZH.md RELEASE.md README_ZH.md README.md LICENSE .gitignore .git .github
popd
popd

sed -i '$a src-git helloworld https://github.com/fw876/helloworld'
sed -i '$a src-git openwrt-passwall https://github.com/xiaorouji/openwrt-passwall'
