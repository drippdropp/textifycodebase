const IMAGE_EXTENSIONS::Vector{String} = String[".png", ".jpg", ".jpeg", ".gif", ".bmp", ".tiff", ".svg", ".ico"]

function find_gitignore(root_path::String)::Vector{String}
    files_in_path = readdir(root_path)

    if ".gitignore" in files_in_path
        gitignore_content = read(joinpath(root_path, ".gitignore"), String)
        gitignore_items = filter(x -> x != "", split(gitignore_content, "\n"))
        gitignore_items |> sort
    else
        String[]
    end
end

function prepare_file_preamble(file_path::String)::String
    file_name = basename(file_path)
    file_size = string(filesize(file_path), " bytes")
    file_lines = string(countlines(file_path), " lines")
    divider_block = "#" ^ 80
    
    string("$(divider_block)\n$file_name::$file_size::$file_lines\n$file_path\n$(divider_block)\n\n")
end

function pad_string(s::String; max_len::Int64 = 80)::String
    str_len = length(s)
    str_len < max_len ? s * " " ^ (max_len - str_len) : s
end

function prepare_file_output(file_path::String)::String
    file_preamble = prepare_file_preamble(file_path)
    file_content = read(file_path, String)
    
    if isnothing(file_content)
        file_content = ""
    end
 
    file_preamble * file_content * "\n"
end