# this will transpose the rows in a TDL to columns
BEGIN {
	FS = "\t";

}
{
	n += 1;
	for (i=1;i<=NF;i++) {
		columns[i,n] = $i;
	}
	c = NF;
}

END {
	for (i=1;i<=c;i++) {
		first = "";
		for (nt=1;nt<=n;nt++) {
			printf("%s%s", first, columns[i,nt]);
			first = "\t";
		}
		printf("\n");
	}
}
