BEGIN {
	# simple script to remove a column from a table-type matrix file (tab-delimited, e.g.)

	FS = "\t";
	# column to be removed
	# TODO: allow for specification of ranges of columns
	if (column==0) column =1;
}

{
	first = "";
	for (i=1;i<=NF;i++) {
		if (i != column) {
			printf("%s%s", first, $i);
			first = "\t";
		}
	}
	printf("\n");
}
