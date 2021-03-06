# $Header: $

EAPI=5

DESCRIPTION="TODO"
HOMEPAGE="http://software.intel.com/en-us/articles/intel-manycore-platform-software-stack-mpss"
#SRC_URI="http://registrationcenter.intel.com/irc_nas/5017/mpss-src-${PV}.tar"
SRC_URI="http://registrationcenter.intel.com/irc_nas/6253/mpss-src-3.4.3.tar"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="app-text/asciidoc"
DEPEND="=dev-util/gen-symver-map-${PV} =sys-libs/mpss-headers-${PV}"

src_unpack() {
	unpack ${A}
	unpack ./mpss-${PV}/src/${P}.tar.bz2
	unpack ./mpss-${PV}/src/mpss-metadata-${PV}.tar.bz2
	cp mpss-metadata-${PV}/* ${P}
}

src_prepare() {
	sed -i -e 's/TARGET_ARCH := .*/TARGET_ARCH := k1om/' Makefile || die "Sed failed!"
}
