# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils multilib-minimal

MY_PV="${PV/_alpha/alpha}"
MY_P="${PN}-${MY_PV}"

DESCRIPTION="A library for Microsoft compression formats"
HOMEPAGE="https://www.cabextract.org.uk/libmspack/"
SRC_URI="https://www.cabextract.org.uk/libmspack/libmspack-${MY_PV}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~alpha amd64 ~arm hppa ia64 ~ppc ppc64 ~sparc x86"
IUSE="debug doc static-libs utils"

DEPEND=""
RDEPEND="
	utils? ( !app-arch/mscompress )
"

PATCHES=(
	"${FILESDIR}/${P}-fix-tests.patch"
)

S="${WORKDIR}/${MY_P}"

multilib_src_configure() {
	ECONF_SOURCE="${S}" econf \
		$(use_enable debug) \
		$(use_enable static-libs static)
}

multilib_src_test() {
	if multilib_is_native_abi; then
		default
		cd "${S}"/test && "${BUILD_DIR}"/test/cabd_test || die
	fi
}

multilib_src_install_all() {
	DOCS=(AUTHORS ChangeLog NEWS README TODO)
	prune_libtool_files --all
	use doc && HTML_DOCS=(doc/*)
	default_src_install
	if use doc; then
		rm "${ED}"/usr/share/doc/"${PF}"/html/{Makefile*,Doxyfile*} || die
	fi
	if ! use utils; then
		rm "${ED}"/usr/bin/* || die
	fi
}
