module TextifyCodebase

include("./fsutils.jl")

function textify_codebase(root_path::String; output_name::String = "fullcodebase.dat")::Nothing
    gitignore_items = find_gitignore(root_path)
    io = IOBuffer();

    for (root, dirs, files) in walkdir(root_path)
        for dir in dirs
            (dir in gitignore_items || dir == ".git") && break
            println("Processing ", joinpath(root, dir))
        end
        for file in files
            file in gitignore_items && break
            file_extension = splitext(file)[2]
            file_extension in IMAGE_EXTENSIONS && break
            
            println("Processing ", joinpath(root, file))
            content = prepare_file_output(joinpath(root, file))
            write(io, content)
        end
    end
    
    try
        open(joinpath(root_path, output_name), "w") do f
            write(f, take!(io))
        end
    catch e
        println("Error: ", e)
    end
end

export textify_codebase

end