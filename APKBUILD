# Contributor: Stuart Cardall <developer@it-offshore.co.uk>
# Contributor: Oleg Titov <oleg.titov@gmail.com>
# Maintainer: Stuart Cardall <developer@it-offshore.co.uk>
pkgname=cython
pkgver=0.29.24
pkgrel=0
pkgdesc="Cython is an optimising static compiler for both the Python & the extended Cython programming languages."
url="https://cython.org/"
arch="all"
license="Apache-2.0"
makedepends="py3-setuptools python3-dev"
depends="python3"
subpackages="cython-doc"
source="cython-$pkgver.tar.gz::cython-$pkgver.tar.gz"

# compatible fix for removing dev subpkg from apkbuild
# cython is not a library but a compiler and does not need a dev subpackage
provides=cython-dev

build() {
	python3 setup.py build
}

check() {
	python3 runtests.py -j${JOBS:-$(nproc)}
}

package() {
	ls
	python3 setup.py install --prefix=/usr --root="$pkgdir"

	install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/cython/license"
	install -Dm 644 README.rst "$pkgdir/usr/share/doc/cython/readme.rst"
}
