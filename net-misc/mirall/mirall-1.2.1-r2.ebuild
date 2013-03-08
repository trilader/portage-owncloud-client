# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4
inherit eutils cmake-utils

DESCRIPTION="OwnCloud build of Mirall. Directories on the local machine are going to be synced to OwnCloud."
HOMEPAGE="http://owncloud.org/"
SRC_URI="http://download.owncloud.com/download/${P}.tar.bz2"
#S="${WORKDIR}/${PN}-version"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="virtual/latex-base
	dev-texlive/texlive-latexextra"
RDEPEND=">=net-misc/ocsync-0.70.4
    >=x11-misc/qtkeychain-0.1.0
	>=dev-qt/qtcore-4.7
	>=dev-qt/qtgui-4.7
	>=dev-qt/qttest-4.7"

src_configure() {
	mycmakeargs=(
		-DCMAKE_BUILD_TYPE="Debug"
		-DCSYNC_INCLUDE_PATH=/usr/include/ocsync
		)
	cmake-utils_src_configure
}

src_install() {
	cmake-utils_src_install
	insinto /usr/share/applications
	doins "${FILESDIR}"/ownCloud.desktop
	insinto /usr/share/pixmaps
	doins "${D}"/usr/share/icons/hicolor/48x48/apps/owncloud.png
}
