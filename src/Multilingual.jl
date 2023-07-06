module Multilingual

import YAML

const global LANGUAGES = ["pt", "en", "es", "it", "fr", "de", "ro", "ca"]

export content, readData, compare

"""

    readData(language::AbstractString)

Reads the YAML file with all words and categories for the specified language.

# Argument
- `language::AbstractString` : the target language code. Examples: "en", "es", "pt", "it", "fr", "ca", "ro", "de"


# Example
```julia-repl
julia> fr = readData("fr");
```
"""
function readData(language::AbstractString)
    filename = joinpath(@__DIR__, "..", "data", language * "-content.yml")
    return YAML.load_file(filename)
end

"""

    content(language::AbstractString, category::AbstractString)

Prints the words of a category in specified language.

# Arguments
- `language::AbstractString` : the target language code. Examples: "en", "es", "pt", "it", "fr", "ca", "ro", "de"
- `category::AbstractString` : the category of the words. Examples: colors, family, week, greetings and others.


# Examples
```julia-repl
julia> content("en","greetings")
hello => ["hello", "hi"]
welcome => welcome
```
"""
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


"""

    compare(language1::AbstractString, language2::AbstractString, category::AbstractString)

Prints the words of a category in two specified languages. It compares the words in the two languages.

# Arguments
- `language1::AbstractString` : the language code. Examples: "en", "es", "pt", "it", "fr", "ca", "ro", "de"
- `language2::AbstractString` : the language code. Examples: "en", "es", "pt", "it", "fr", "ca", "ro", "de"
- `category::AbstractString` : the category of the words. Examples: colors, family, week, greetings and others.


# Examples
```julia-repl
julia> compare("pt","es","greetings")
hello :
        pt => ["olá", "oi"]
        es => hola
welcome :
        pt => ["bem-vindo", "bem-vinda", "bem-vindos", "bem-vindas"]
        es => ["bienvenido", "bienvenidos"]
```
"""
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
