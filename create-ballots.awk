#!/usr/bin/gawk -E

BEGIN {
	FS = "\t"
	print "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
	print "<ballots>"
}

{
	print "<ballot><creditor>" $1 "</creditor>"
	print "<claim>" $2 "</claim></ballot>"
}

END {
	print "</ballots>"
}
