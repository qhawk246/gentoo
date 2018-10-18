# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

# ebuild generated by hackport 0.5.1.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour test-suite"
inherit haskell-cabal

DESCRIPTION="Snap: A Haskell Web Framework (core interfaces and types)"
HOMEPAGE="http://snapframework.com/"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="amd64 x86"
IUSE="debug portable"

RDEPEND=">=dev-haskell/attoparsec-0.12:=[profile?] <dev-haskell/attoparsec-0.14:=[profile?]
	>=dev-haskell/bytestring-builder-0.10.4:=[profile?] <dev-haskell/bytestring-builder-0.11:=[profile?]
	>=dev-haskell/case-insensitive-1.1:=[profile?] <dev-haskell/case-insensitive-1.3:=[profile?]
	>=dev-haskell/hunit-1.2:=[profile?] <dev-haskell/hunit-2:=[profile?]
	>=dev-haskell/io-streams-1.3:=[profile?] <dev-haskell/io-streams-1.4:=[profile?]
	>=dev-haskell/lifted-base-0.1:=[profile?] <dev-haskell/lifted-base-0.3:=[profile?]
	>=dev-haskell/monad-control-1.0:=[profile?] <dev-haskell/monad-control-1.1:=[profile?]
	>=dev-haskell/mtl-2.0:=[profile?] <dev-haskell/mtl-2.3:=[profile?]
	>=dev-haskell/random-1:=[profile?] <dev-haskell/random-2:=[profile?]
	>=dev-haskell/readable-0.1:=[profile?] <dev-haskell/readable-0.4:=[profile?]
	>=dev-haskell/regex-posix-0.95:=[profile?] <dev-haskell/regex-posix-1:=[profile?]
	>=dev-haskell/text-0.11:=[profile?] <dev-haskell/text-1.3:=[profile?]
	>=dev-haskell/transformers-base-0.4:=[profile?] <dev-haskell/transformers-base-0.5:=[profile?]
	>=dev-haskell/unix-compat-0.3:=[profile?] <dev-haskell/unix-compat-0.5:=[profile?]
	>=dev-haskell/unordered-containers-0.1.4.3:=[profile?] <dev-haskell/unordered-containers-0.3:=[profile?]
	>=dev-haskell/vector-0.6:=[profile?] <dev-haskell/vector-0.12:=[profile?]
	>=dev-lang/ghc-7.8.2:=
	portable? ( >=dev-haskell/time-locale-compat-0.1:=[profile?] <dev-haskell/time-locale-compat-0.2:=[profile?] )
	!portable? ( >=dev-haskell/old-locale-1:=[profile?] <dev-haskell/old-locale-2:=[profile?] )
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.18.1.3
	test? ( dev-haskell/hashable
		>=dev-haskell/parallel-3 <dev-haskell/parallel-4
		>=dev-haskell/quickcheck-2.3.0.2 <dev-haskell/quickcheck-3
		>=dev-haskell/test-framework-0.8.0.3 <dev-haskell/test-framework-0.9
		>=dev-haskell/test-framework-hunit-0.2.7 <dev-haskell/test-framework-hunit-0.4
		>=dev-haskell/test-framework-quickcheck2-0.2.12.1 <dev-haskell/test-framework-quickcheck2-0.4
		>=dev-haskell/zlib-0.5 <dev-haskell/zlib-0.7 )
"

src_configure() {
	haskell-cabal_src_configure \
		$(cabal_flag debug debug) \
		$(cabal_flag portable portable)
}
