baremodule Argon2_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("Argon2")
JLLWrappers.@generate_main_file("Argon2", UUID("2b4f1e85-fc50-5eed-88c0-58968af4dd78"))
end  # module Argon2_jll
