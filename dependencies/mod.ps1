$parent = split-path $psscriptroot
$zone = "$psscriptroot\zone_source"
$output = "$env:localappdata\plutonium\storage\t6\mods\$(split-path $parent -leaf)"

$null = new-item $output -itemtype directory -force

& c:\laupetin\linker.exe `
    --base-folder $parent `
    --gdt-search-path $zone `
    --add-asset-search-path $psscriptroot `
    --asset-search-path $parent `
    --source-search-path $zone `
    --output-folder $output `
    mod

[ordered]@{
    name = 'Hello, World!'
    author = 'burgermusic32'
    description = 'did not test anything btw'
    version = (get-date -format f)
} | convertto-json | set-content "$output\mod.json" -encoding utf8 -nonewline