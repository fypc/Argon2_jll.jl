cd ${WORKSPACE}/srcdir/phc-winner-argon2
[[ "${target}" == *-mingw* ]]
make CC="${CC}" OPTTARGET="" LIBRARY_EXT="${dlext}"
[[ "${target}" == *-apple-* ]]
install -Dm755 libargon2.so.1 "${libdir}/libargon2.so.1"
install -Dm755 libargon2.so.1 "${libdir}/libargon2.so.1"
install -Dm755 libargon2.so.1 "${libdir}/libargon2.so.1"
