# simple script to create a single tab-delimted matrix file from
#        selected columns in multiple input files - where the
#        input files have the same format and have a unique identifier
#        in the column specified by onkey. The column specified by
#        extractcol is taken from each file and placed in the final
#        output

BEGIN {
	# column to use for unique row identifiers
	if (onkey == 0) {	
		onkey = 1;
	}
	# column to place in the final table
	if (extractcol == "") {
		extractcol = 2;
	}
	# placeholder reminder
	if (extractcol == "one") {
		extractcol = "one";
	}
}

{
	if (extractcol == "one") mat[$onkey, FILENAME] = 1
	else mat[$onkey, FILENAME] = $extractcol;
	if (idskey[$onkey] == 0)  {
		idskey[$onkey] = 1;
		idstring = sprintf("%s%s\t", idstring, $onkey);
	}	
	if (oldfile != FILENAME) {
		filenames = sprintf("%s\t%s", filenames, FILENAME);
		oldfile = FILENAME;
	}
}

END {
	split(filenames, fns, "\t");
	split(idstring, ids, "\t");
	printf("ExtractCol");
	for (fni in fns) {
		printf("\t%s", fns[fni]);
	}
	printf("\n");
	for (i in ids) {
		id = ids[i];
		printf("%s", id);
		for (fni in fns) {
			fn = fns[fni];
			printf("\t%s", mat[id, fn]);
		}
		printf("\n");
	}
}
