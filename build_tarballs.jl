# BinaryBuilder.jl recipe for argon2 v20190702
#
# Run this script to build platform-specific tarballs and generate the real
# Artifacts.toml entries with correct sha256 and git-tree-sha1 values:
#
#   julia --project build_tarballs.jl --deploy=local
#
# For a full deployment to GitHub Releases (requires GITHUB_TOKEN):
#   julia --project build_tarballs.jl --deploy

using BinaryBuilder

name = "argon2"
version = v"20190702.1"

sources = [
    GitSource(
        "https://github.com/P-H-C/phc-winner-argon2.git",
        "62358ba2123abd17fccf2a108a301d4b52c01a7c",  # tag: 20190702
    ),
]

script = raw"""
cd ${WORKSPACE}/srcdir/phc-winner-argon2

# Build shared library
if [[ "${target}" == *-mingw* ]]; then
    make CC="${CC}" OPTTARGET="" LIBRARY_EXT=".dll"
    install -Dm755 libargon2.dll "${libdir}/libargon2.dll"
elif [[ "${target}" == *-apple-* ]]; then
    make CC="${CC}" OPTTARGET="" LIBRARY_EXT="${dlext}"
    install -Dm755 libargon2.1.dylib "${libdir}/libargon2.1.dylib"
    ln -sf libargon2.1.dylib "${libdir}/libargon2.dylib"
    # Fix install name so the library is relocatable
    install_name_tool -id "@rpath/libargon2.1.dylib" "${libdir}/libargon2.1.dylib"
elif [[ "${target}" == *-freebsd* ]]; then
    # FreeBSD: argon2 Makefile produces libargon2.so without a soversion suffix
    make CC="${CC}" OPTTARGET="" LIBRARY_EXT="${dlext}"
    install -Dm755 libargon2.so "${libdir}/libargon2.so"
else
    # Linux: produces libargon2.so.1 with soversion suffix
    make CC="${CC}" OPTTARGET="" LIBRARY_EXT="${dlext}"
    install -Dm755 libargon2.so.1 "${libdir}/libargon2.so.1"
    ln -sf libargon2.so.1 "${libdir}/libargon2.so"
fi
"""

platforms = [
    Platform("aarch64", "macos"),
    Platform("x86_64",  "macos"),
    Platform("aarch64", "linux"; libc="glibc"),
    Platform("aarch64", "linux"; libc="musl"),
    Platform("aarch64", "freebsd"),
    Platform("armv6l",  "linux"; libc="glibc", call_abi="eabihf"),
    Platform("armv6l",  "linux"; libc="musl",  call_abi="eabihf"),
    Platform("armv7l",  "linux"; libc="glibc", call_abi="eabihf"),
    Platform("armv7l",  "linux"; libc="musl",  call_abi="eabihf"),
    Platform("i686",    "linux"; libc="glibc"),
    Platform("i686",    "linux"; libc="musl"),
    Platform("i686",    "windows"),
    Platform("powerpc64le", "linux"; libc="glibc"),
    Platform("x86_64",  "linux"; libc="glibc"),
    Platform("x86_64",  "linux"; libc="musl"),
    Platform("x86_64",  "freebsd"),
    Platform("x86_64",  "windows"),
]

products = [
    LibraryProduct("libargon2", :libargon2),
]

dependencies = Dependency[]

build_tarballs(
    ARGS, name, version, sources, script, platforms, products, dependencies;
    julia_compat = "1.6",
)
