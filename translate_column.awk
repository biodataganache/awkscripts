# Simple script to use a reference file to serve as a map for
#      translation between keys. That is a key in the input file
#      in the column specified by withcolumn will be used to match
#      the reference file using the column specified by tocolumn
#      and in the case of a match the value of the column fromcolumn
#      from the reference file will be used to replace the withcolumn
#      in the output

BEGIN {
	FS = "\t";
	
	if (reffile==0) print "Please specify a reference file for translation '-v reffile=[file]'";
	if (fromcolumn==0) fromcolumn = 1;
	if (tocolumn==0) tocolumn=2;
	if (withcolumn==0) withcolumn=1;
	if (addto==0) addto=0;
	
	while (getline < reffile) {
		ids[$fromcolumn] = $tocolumn;
	}
}

{
	if (ids[$withcolumn]) {
		first = "";
		for (i=1;i<=NF;i++) {
			value = $i;
			if (i == withcolumn) {
				value = "";
				if (addto == 1) value = sprintf("%s\t", $withcolumn);
				 
				value = sprintf("%s%s", value, ids[$withcolumn]);
			
			}
			printf("%s%s", first, value);
			first = "\t";
		}
		printf("\n");
	}
}
