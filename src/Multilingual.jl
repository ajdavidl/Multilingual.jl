module Multilingual

import YAML

const global LANGUAGES = ["pt", "en", "es", "it", "fr"]

export content, readData, compare

function readData(language::AbstractString)
    filename = joinpath(@__DIR__, "..", "data", language * "-content.yml")
    return YAML.load_file(filename)
end

function content(language::AbstractString, category::AbstractString)
    @assert language in LANGUAGES
    data = readData(language)
    Keys = keys(data)
    if category in Keys
        for key in sort!(collect(keys(data[category])))
            val = data[category][key]
            println("$key => $val")
        end
    else
        println("Sorry, category ", category, " does not exist in language ", language)
    end
end

function compare(language1::AbstractString, language2::AbstractString, category::AbstractString)
    @assert language1 in LANGUAGES
    @assert language2 in LANGUAGES
    data1 = readData(language1)
    Keys1 = keys(data1)
    data2 = readData(language2)
    Keys2 = keys(data2)
    if category in Keys1
        if category in Keys2
            Keys1 = collect(keys(data1[category]))
            Keys2 = collect(keys(data2[category]))
            Keys = unique([Keys1; Keys2])
            sort!(Keys)
            for k in Keys
                println(k, " :")
                println("\t" * language1 * " => ", ifelse(k in Keys1, data1[category][k], " "))
                println("\t" * language2 * " => ", ifelse(k in Keys2, data2[category][k], " "))
            end
        else
            println("Category ", category, " doesn´t exist in language ", language2)
        end
    else
        println("Category ", category, " doesn´t exist in language ", language1)
    end
end

end # module Multilingual
