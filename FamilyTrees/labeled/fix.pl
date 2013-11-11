#!/usr/bin/perl -w

opendir(DIRECTORY, ".") or die "This directory does not exist!";
@allfiles = grep /j.*\.xml$/, readdir DIRECTORY;
foreach my $filename (@allfiles)
{
	#my $fixedfile = `sed \"s/\\(<point .*y=\"[[:digit:]]*\" time=\"[[:digit:]]*\"\\)/\\1 pressure=\"127\"/g\" \"$filename\"`;
	my $fixedfile = `sed \"s/\\(<point .*y=\\\"[[:digit:]]*\\\" time=\\\"[[:digit:]]*\\\"\\)/\\1 pressure=\\\"127\\\"/g\" \"$filename\"`;
	my $fh;
	open($fh, ">$filename");
	print $fh $fixedfile;
	close $fh;
}
