# Autogenerated wrapper script for argon2_jll for i686-w64-mingw32
export libargon2

JLLWrappers.@generate_wrapper_header("argon2")
JLLWrappers.@declare_library_product(libargon2, "libargon2.dll")
function __init__()
    JLLWrappers.@generate_init_header()
    JLLWrappers.@init_library_product(
        libargon2,
        "bin\\libargon2.dll",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
