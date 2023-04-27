# Multilingual.jl

Multilingual.jl is a Julia package that provides list of words from various languages in different categories.

This package was inspired by [Languages.jl](https://github.com/JuliaText/Languages.jl) and [WordLists.jl](https://github.com/LilithHafner/WordLists.jl) packages.

## Status

In construction!

Available languages:
- English
- Portuguese
- Spanish
- Italian
- French
- German
- Romanian

Available categories:
- colors
- family
- week
- months
- seasons
- greetings
- numbers
- animals
- shapes
- body
- fruits

## Usage

The function `content` prints the words of a category in a requested language:

```Julia
julia> using Multilingual

julia> content("en","greetings")
hello => ["hello", "hi"]
welcome => welcome

julia> content("pt","week")
Friday => sexta-feira
Monday => segunda-feira
Saturday => sábado
Sunday => domingo
Thursday => quinta-feira
Tuesday => terça-feira
Wednesday => quarta-feira
week => semana
weekend => fim de semana
```

The function `compare` prints the words from two languages in a given category.

```Julia
julia> compare("es","it","months")
April :
        es => abril
        it => aprile
August :
        es => agosto
        it => agosto
December :
        es => diciembre
        it => dicembre
February :
        es => febrero
        it => febbraio
January :
        es => enero
        it => gennaio
July :
        es => julio
        it => luglio
June :
        es => junio
        it => giugno
March :
        es => marzo
        it => marzo
May :
        es => mayo
        it => maggio
November :
        es => noviembre
        it => novembre
October :
        es => octubre
        it => ottobre
September :
        es => septiembre
        it => settembre
```

The function `readData` returns all the data in a Dictionary structure.

```Julia
julia> data = readData("fr")
Dict{Any, Any} with 8 entries:
  "seasons"   => Dict{Any, Any}("Summer"=>"été",…
  "family"    => Dict{Any, Any}("grandson"=>…
  "numbers"   => Dict{Any, Any}(5=>"cinq",200=>…
  "animals"   => Dict{Any, Any}("lion"=>"lion"…
  "colors"    => Dict{Any, Any}("white"=>["blanc",…
  "week"      => Dict{Any, Any}("Friday"=>"vendredi",…
  "greetings" => Dict{Any, Any}("welcome"=>"bienvenue",…
  "months"    => Dict{Any, Any}("January"=>"janvier",…

```


## Contributing

Pull requests are welcome.
