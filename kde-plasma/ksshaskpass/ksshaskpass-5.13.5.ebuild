# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit kde5

DESCRIPTION="KDE implementation of ssh-askpass with Kwallet integration"
HOMEPAGE="https://cgit.kde.org/ksshaskpass.git"
KEYWORDS="amd64 ~arm ~x86"
IUSE=""

DEPEND="
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kwallet)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_qt_dep qtwidgets)
"
RDEPEND="
	${DEPEND}
	!kde-plasma/ksshaskpass:4
"

src_install() {
	kde5_src_install

	insinto /etc/plasma/startup
	doins "${FILESDIR}/05-ksshaskpass.sh"
}

pkg_postinst() {
	kde5_pkg_postinst

	elog ""
	elog "In order to have ssh-agent start at kde startup,"
	elog "edit /etc/plasma/startup/10-agent-startup.sh and uncomment"
	elog "the lines enabling ssh-agent."
	elog
	elog "If you do so, do not forget to uncomment the respective"
	elog "lines in /etc/plasma/shutdown/10-agent-shutdown.sh to"
	elog "properly kill the agent when the session ends."
	elog
	elog "${PN} has been installed as your default askpass application"
	elog "for Plasma 5 sessions."
	elog "If that's not desired, select the one you want to use in"
	elog "/etc/plasma/startup/05-ksshaskpass.sh"
	elog ""
}
