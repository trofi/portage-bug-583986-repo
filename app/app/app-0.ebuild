EAPI=6

IUSE="lib1"
DEPEND="
	lib1? ( lib/lib:0/1 )
	!lib1? ( lib/lib:0/2 )
"
RDEPEND=${DEPEND}
SLOT=0

src_unpack() {
	mkdir "${S}" || die
	cat >>"${S}"/foo.c<<EOF
	extern int a;
	int main() { return a; }
EOF
}

src_install() {
	local lib_dep=()
	if use lib1; then
		lib_dep+=(
			-Wl,-rpath=/usr/lib/lib-1
			-L/usr/lib/lib-1
			-llib-1
		)
	else
		lib_dep+=(
			-Wl,-rpath=/usr/lib/lib-2
			-L/usr/lib/lib-2
			-llib-2
		)
	fi
	mkdir -p "${ED}"/usr/bin
	gcc foo.c -o "${ED}"/usr/bin/${PF} "${lib_dep[@]}" || die
}
