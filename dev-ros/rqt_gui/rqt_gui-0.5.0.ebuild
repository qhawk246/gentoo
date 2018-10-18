# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

ROS_REPO_URI="https://github.com/ros-visualization/rqt"
KEYWORDS="~amd64"
PYTHON_COMPAT=( python{2_7,3_4,3_5} )
ROS_SUBDIR=${PN}

inherit ros-catkin

DESCRIPTION="Main to start an instance of the ROS integrated graphical user interface provided by qt_gui"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="
	>=dev-ros/qt_gui-0.3.0[${PYTHON_USEDEP}]
	dev-libs/boost:="
DEPEND="${RDEPEND}"
PATCHES=( "${FILESDIR}/gentoo.patch" )
