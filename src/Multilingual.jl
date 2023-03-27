module Multilingual

import YAML

export content, readData
function readData(language::AbstractString)

    filename = joinpath(@__DIR__, "..", "data", language * "-content.yml")
    return YAML.load_file(filename)
end

function content(language::AbstractString, category::AbstractString)
    @assert language in ["pt", "en", "es"]
    data = readData(language)
    Keys = keys(data)
    if category in Keys
        for (i, j) in data[category]
            println(i, " => ", j)
        end
    else
        println("Sorry, category " * category * " does not exist.")
    end
end


end # module Multilingual
