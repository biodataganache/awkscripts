# awkscripts
A collection of useful awk scripts I've written over the years

These are very simple scripts that allow manipulation of table-type files, that is, 
files that are delimited (tab, e.g.) and that have a row/column type structure and generally
have an identifier key that is often (though not always) unique. They all output to stdout 
and can be included in piped commands.

The examples directory contains a set of files and a use_cases.txt file that runs through
some of the ways that I use these scripts. This can certainly be expanded.

Please note: I've not included any error catching and behavior can be undesirable/unexpected
             in some cases.
