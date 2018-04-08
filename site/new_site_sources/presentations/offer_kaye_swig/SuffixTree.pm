package SuffixTree;
use strict;
require Exporter;
require DynaLoader;
use vars qw/$VERSION @ISA @EXPORT/;
$VERSION = '0.03';
@ISA = qw(Exporter DynaLoader);
package SuffixTree;
bootstrap SuffixTree;
package SuffixTree;
@EXPORT = qw(ST_CreateTree ST_PrintTree ST_FindSubstring ST_DeleteTree
		create_tree print_tree find_substring delete_tree);

sub create_tree($);
sub print_tree($);
sub find_substring($$);
sub delete_tree($);

sub create_tree($) {
	return ST_CreateTree($_[0], length($_[0]));
}

sub print_tree($) {
	ST_PrintTree(shift);
}

sub find_substring($$) {
	return ST_FindSubstring($_[0],$_[1],length($_[1]));
}

sub delete_tree($) {
	ST_DeleteTree(shift);
}

=head1 NAME

SuffixTree - Efficient string manipulation data structure interface for Perl.

=head1 SYNOPSIS

	use SuffixTree;

	my $str = "mississippi";
	my $tree=create_tree($str);
	print_tree($tree);
	my $position = find_substring($tree, "ssis");

	printf("\nPosition of ssis in mississippi is %ld.\n\n", $position);

	delete_tree($tree); # NOTICE: this method will soon become deprecated

=head1 DEPRECATED SYNOPSIS

	use SuffixTree;

	my $str = "mississippi";
	my $tree=ST_CreateTree($str, length($str));
	ST_PrintTree($tree);
	my $position = ST_FindSubstring($tree, "ssis", 4);

	printf("\nPosition of ssis in mississippi is %ld.\n\n", $position);

	ST_DeleteTree($tree);


=head1 DESCRIPTION

The intention of this project is to provide an open-source implementation
for an efficient data structure for strings manipulation - the Suffix Tree.

The code was written with as much consistency with the theoretical algorithm
as possible (see references). It provides a set of interface functions for
creating and searching the tree.

The suffix tree is implemented in ANSI-C. The code is written based on the
original algorithm by E.Ukkonen. This is the Perl interface for the underlying
ANSI-C implementation.

=head1 FUNCTIONS

All functions are exported by default. Please note that all these interface
functions were automatically extracted from the ANSI-C header file, so they
might not behave as Perlish as you'd expect them to. This is something we
will definitly address in the future.

=over 3

=item $tree = create_tree($string)

Allocates memory for the tree and starts Ukkonen's construction algorithm.
Parameters: A string. Returns a reference to the tree.

=item $position = find_substring($tree, $substring)

Searches for a string in the tree. It traverses the tree down starting
its root like in a regular trie. Parameters: the tree to search in, a
substring to look for. Returns the position it was found in the source
string or ST_ERROR if string is not in the tree.
NOTE: We did not make sure how ST_ERROR 'looks like' in Perl. This should be
further explained in future releases.

=item print_tree($tree)

Prints the tree.
Parameters: the tree to print.

=item delete_tree($tree)

Deletes a suffix tree.
Parameters: the tree to delete.
Returns   : void.

=head1 DEPRECATED FUNCTIONS

All functions are exported by default. Please note that all these interface
functions were automatically extracted from the ANSI-C header file, so they
might not behave as Perlish as you'd expect them to. This is something we
will definitly address in the future.

=over 3

=item $tree = ST_CreateTree($string, length($string))

Allocates memory for the tree and starts Ukkonen's construction algorithm.
Parameters: A string, length of the string. Returns a reference to the tree.

=item $position = ST_FindSubstring($tree, $substring, length($substring))

Searches for a string in the tree. It traverses the tree down starting
its root like in a regular trie. Parameters: the tree to search in, a
substring to look for, length of substring. Returns the position it was
found in the source string or ST_ERROR if string is not in the tree.
NOTE: We did not make sure how ST_ERROR 'looks like' in Perl. This should be
further explained in future releases.

=item ST_PrintTree($tree)

Prints the tree.
Parameters: the tree to print.

=item ST_DeleteTree($tree)

Deletes a suffix tree.
Parameters: the tree to delete.
Returns   : void.

=head1 BUGS

This Perl interface was mostly built automatically (using SWIG). Little to no
attention was given to testing. In future relases of this Perl Module (along with
its underlying ANSI-C implementation) we hope to fix all problems that might
currenly interfere with successful usage of this module. Please send bug reports
to the author(s) of this module.

=head1 FUTURE WORK

[1] A better Perl-ish interface

[2] Building tests for this module (for the `make test` part of the installation)

[3] Object Oriented like usage

=head1 PORTABILITY

	Please read the README file for information.

=head1 SEE ALSO

	http://cs.haifa.ac.il/~shlomo/suffix_tree/

=head1 AUTHOR

Shlomo Yona E<lt>shlomo@cs.haifa.ac.ilE<gt>

=head1 THANKS TO

Offer Kaye (http://okaye.esmartweb.com/) for useful ideas and support.

=head1 COPYRIGHT

Copyright (c) 2002, 2003 Shlomo Yona. All rights reserved.

This library is free software.
You can redistribute it and/or modify it under the same terms as Perl itself.

=cut

1;
