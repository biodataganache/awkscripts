BEGIN {
	# Simple merge table script for text-based matrix files (e.g. tab-separated values with columns and rows)
	# Default behavior will filter input file lines based on whether there is a matching
	#         'key' (value specified in a particular column) in the reference file
	# Merge behavior (both=1) will output each line with a matched key as a concatenated
	#         [line from input file][separator][line from reference file] 

	# file separator to use to parse lines
	if (fs == 0) FS = "\t";

	# column number for key from the input file
	if (idcolumn==0) idcolumn = 1;

	# placeholder: include lines from both files in output?
	if (both == 0) both = 0;

	# placeholder: require a record to be present to output?
	#    if filter < 0 then output the line whether or not there's a matched key
	#        this option makes sense with the 'both=1' option   
	if (filter==0) filter=0;

	# column number for key from the reference file
	if (refcolumn==0) refcolumn=1;

	# make key comparison case insensitive?
	if (nocase==0) nocase=0;

	# invert the sense of the match - will output a line from the input file if the indicated key is NOT in the reference file
	if (invert==0) invert=0;

	# reference file for merge
	if (reffile==0) print "No reference file specified, '-v reffile=file'";
	else {
		i = 0;
		while (getline < reffile) {
			if (refcolumn == -1) value = i;
			else value = $refcolumn;
			i += 1;
			if (nocase) value=tolower(value);
			ids[value] = $0;
		}
	}
}

{
	if (idcolumn == -1) id = NR;
	else id = $idcolumn;
	if (nocase) id = tolower(id);
	if (invert==0 && (ids[id] || filter<0)) {
		if (both) printf("%s\t%s\n", $0, ids[id]);
		else print $0;
	}
	if (invert && ids[id] == 0) {
		print $0;
	}
}
