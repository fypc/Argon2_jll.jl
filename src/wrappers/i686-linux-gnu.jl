# Autogenerated wrapper script for argon2_jll for i686-linux-gnu
export libargon2

JLLWrappers.@generate_wrapper_header("argon2")
JLLWrappers.@declare_library_product(libargon2, "libargon2.so.1")
function __init__()
    JLLWrappers.@generate_init_header()
    JLLWrappers.@init_library_product(
        libargon2,
        "lib/libargon2.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
