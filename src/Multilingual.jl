module Multilingual

import YAML

export content

function content(language::AbstractString, category::AbstractString)
    @assert language in ["pt", "en"]
    filename = joinpath(@__DIR__, "..", "data", language * "-content.yml")
    data = YAML.load_file(filename)
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
