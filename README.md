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
- Catalan

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
- transport
- astronomy
- house
- soccer

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
Dict{Any, Any} with 14 entries:
  "family"    => Dict{Any, Any}("grandson"=>"le petit-fils", "brother-in-law"=> ...
  "animals"   => Dict{Any, Any}("lion"=>"lion", "giraffe"=>"girafe", "whale"=> ...
  "colors"    => Dict{Any, Any}("white"=>["blanc", "blanche"], "green"=>["vert", ...
  "week"      => Dict{Any, Any}("Thursday"=>"jeudi", "week"=>"semaine", "Wednesday" ...
  "astronomy" => Dict{Any, Any}("satellite"=>"satellite", "meteor"=>"météore",  ...
  "transport" => Dict{Any, Any}("yacht"=>"yacht", "truck"=>"camion", "bus"=>"bus", ...
  "numbers"   => Dict{Any, Any}(5=>"cinq", 200=>"deux cents", 16=>"seize", 20=> ...
  "greetings" => Dict{Any, Any}("welcome"=>"bienvenue", "hello"=>["salut", "bonjour" ...
  "shapes"    => Dict{Any, Any}("pyramid"=>"pyramide", "triangle"=>"triangle", ...
  "seasons"   => Dict{Any, Any}("Summer"=>"été", "Autumn"=>"automne", "Spring" ...
  "body"      => Dict{Any, Any}("nail"=>"ongle", "mouth"=>"bouche", "ear"=> ...
  "fruits"    => Dict{Any, Any}("blackberry"=>"mûre", "lemon"=>"citron", "pear" ...
  "house"     => Dict{Any, Any}("living_room"=>"salon", "roof"=>"toit", "toilet" ...
  "months"    => Dict{Any, Any}("January"=>"janvier", "May"=>"mai", "December" ...
```


## Contributing

Pull requests are welcome.
