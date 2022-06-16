# Contributor: Stuart Cardall <developer@it-offshore.co.uk>
# Contributor: Oleg Titov <oleg.titov@gmail.com>
# Maintainer: Stuart Cardall <developer@it-offshore.co.uk>
pkgname=cython
pkgver=0.29.24
pkgrel=0
pkgdesc="Cython is an optimising static compiler for both the Python & the extended"
url="https://cython.org/"
arch="all"
license="Apache-2.0"
makedepends="py3-setuptools python3-dev"
depends="python3"
subpackages="cython-doc"
com="9341e73aceface39dd7b48bf46b3f376cde33296"
source="cython-$pkgver.tar.gz::https://github.com/cython/cython/archive/$com.tar.gz"

# compatible fix for removing dev subpkg from apkbuild
# cython is not a library but a compiler and does not need a dev subpackage
provides=cython-dev

build() {
        ls
        cp -r ./cython-9341e73aceface39dd7b48bf46b3f376cde33296/* .
        python3 setup.py build
}

check() {
        python3 runtests.py -j${JOBS:-$(nproc)}
}

package() {
        python3 setup.py install --prefix=/usr --root="/home/appuser/src/"

        install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/cython/license"
        install -Dm 644 README.rst "$pkgdir/usr/share/doc/cython/readme.rst"
}	
