pkg_name=my-blog
pkg_origin=rsertelon
pkg_maintainer="Romain Sertelon <romain@sertelon.fr>"
pkg_license=('CC-BY-SA-4.0')
pkg_deps=(
  rsertelon/thttpd
)
pkg_build_deps=(
  core/coreutils
  core/gcc
  core/make
  core/ruby
)

pkg_version() {
  date +%s
}

do_before() {
  update_pkg_version

  gem install jekyll redcarpet
}

do_build() {
  jekyll build --safe --config "${PLAN_CONTEXT}/../_config.yml" -s "${PLAN_CONTEXT}/.." -d "${pkg_prefix}"
}

do_install() {
  chmod -x "${pkg_prefix}/css/main.css"
}
