# adds a blank tab column at the position indicated by
#  col variable. Setting column to 0 will add a column at the
#  very first field.
# Usage:
# awk -f [this_file] -v col=[column] [input_file] > [output_file]

BEGIN {
	FS = "\t";
	column = col;
}

{
	first = "";
	for (i=1;i<=NF;i++) {
		if ((i-1)==column) printf("\t");
		printf("%s%s", first, $i);
		first = "\t";
	}
	printf("\n");
}
