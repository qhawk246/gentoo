# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
ROS_REPO_URI="https://github.com/RobotWebTools/rosbridge_suite"
KEYWORDS="~amd64"
ROS_SUBDIR=${PN}

inherit ros-catkin

DESCRIPTION="JSON API to ROS functionality for non-ROS programs"
LICENSE="BSD"
SLOT="0"
IUSE=""

RDEPEND="
	dev-ros/rosapi
	dev-ros/rosbridge_library
	dev-ros/rosbridge_server
	"
DEPEND=""
