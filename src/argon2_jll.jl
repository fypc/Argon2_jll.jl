# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule argon2_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("argon2")
JLLWrappers.@generate_main_file("argon2", UUID("2b4f1e85-fc50-5eed-88c0-58968af4dd78"))
end  # module argon2_jll
