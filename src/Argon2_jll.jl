module argon2_jll

using JLLWrappers, Artifacts, Libdl

export libargon2

# Select platform-specific wrapper at parse time for the OS/arch combination,
# then fall back to a runtime check for libc variant (glibc vs musl) on Linux.
@static if Sys.isapple() && Sys.ARCH === :aarch64
    include("wrappers/aarch64-apple-darwin.jl")
elseif Sys.isapple() && Sys.ARCH === :x86_64
    include("wrappers/x86_64-apple-darwin.jl")
elseif Sys.islinux() && Sys.ARCH === :aarch64
    if Base.BinaryPlatforms.libc(Base.BinaryPlatforms.HostPlatform()) == "musl"
        include("wrappers/aarch64-linux-musl.jl")
    else
        include("wrappers/aarch64-linux-gnu.jl")
    end
elseif Sys.islinux() && Sys.ARCH === :armv6l
    if Base.BinaryPlatforms.libc(Base.BinaryPlatforms.HostPlatform()) == "musl"
        include("wrappers/armv6l-linux-musleabihf.jl")
    else
        include("wrappers/armv6l-linux-gnueabihf.jl")
    end
elseif Sys.islinux() && Sys.ARCH === :armv7l
    if Base.BinaryPlatforms.libc(Base.BinaryPlatforms.HostPlatform()) == "musl"
        include("wrappers/armv7l-linux-musleabihf.jl")
    else
        include("wrappers/armv7l-linux-gnueabihf.jl")
    end
elseif Sys.islinux() && Sys.ARCH === :i686
    if Base.BinaryPlatforms.libc(Base.BinaryPlatforms.HostPlatform()) == "musl"
        include("wrappers/i686-linux-musl.jl")
    else
        include("wrappers/i686-linux-gnu.jl")
    end
elseif Sys.iswindows() && Sys.ARCH === :i686
    include("wrappers/i686-w64-mingw32.jl")
elseif Sys.islinux() && Sys.ARCH === :powerpc64le
    include("wrappers/powerpc64le-linux-gnu.jl")
elseif Sys.islinux() && Sys.ARCH === :x86_64
    if Base.BinaryPlatforms.libc(Base.BinaryPlatforms.HostPlatform()) == "musl"
        include("wrappers/x86_64-linux-musl.jl")
    else
        include("wrappers/x86_64-linux-gnu.jl")
    end
elseif Sys.isfreebsd() && Sys.ARCH === :aarch64
    include("wrappers/aarch64-unknown-freebsd.jl")
elseif Sys.isfreebsd() && Sys.ARCH === :x86_64
    include("wrappers/x86_64-unknown-freebsd.jl")
elseif Sys.iswindows() && Sys.ARCH === :x86_64
    include("wrappers/x86_64-w64-mingw32.jl")
else
    error("Argon2_jll does not support the current platform $(Base.BinaryPlatforms.HostPlatform())")
end

end # module Argon2_jll
