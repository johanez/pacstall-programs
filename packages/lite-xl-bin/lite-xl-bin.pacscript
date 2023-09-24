name="lite-xl-bin"
pkgname="lite-xl"
pkgver="2.1.1"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-deb" "${pkgname}-app")
replace=("${pkgname}")
gives="${pkgname}"
pkgdesc="A lightweight text editor written in Lua, adapted from lite."
maintainer="Johannes Eberenz(johanez) <johannes@latlon.dev>"
hash="2975b8a4ba39717517a6ba0a394634e37ef32bd354409ea30afb8c00e6f51512"
url="https://github.com/lite-xl/lite-xl/releases/download/v2.1.1/${pkgname}-v${pkgver}-addons-linux-x86_64-portable.tar.gz"

package() {
  sudo mkdir -p "${pkgdir}/usr/bin"
  sudo install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  # install plugins, fonts etc
  sudo mkdir -p ${pkgdir}/usr/share/lite-xl
  sudo cp -r data/* ${pkgdir}/usr/share/lite-xl/
}

post_remove() {
  rm -rf ${pkgdir}/usr/share/lite-xl
}
