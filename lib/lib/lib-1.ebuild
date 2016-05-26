EAPI=6

SLOT=0/${PV}

src_unpack() {
	mkdir "${S}" || die
	cat >>"${S}"/libfoo.c<<EOF
	int a = 42;
EOF
}

src_install() {
	mkdir -p "${ED}"/usr/lib/${PF}
	gcc \
		-fPIC \
		libfoo.c \
		-shared -Wl,-soname,lib${PF}.so \
		-o "${ED}"/usr/lib/${PF}/lib${PF}.so || die
}
