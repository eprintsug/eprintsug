######################################################################
#
# EPrints::TempDir
#
######################################################################
#
#
######################################################################

package EPrints::TempDir;

use File::Temp;

use strict;

=pod

=head1 NAME

EPrints::TempDir - Create temporary directories that are removed automatically

=head1 DESCRIPTION

DEPRECATED

Use C<<File::Temp->newdir()>>;

=head1 SEE ALSO

L<File::Temp>

=cut

sub new
{
	my $class = shift;

	return File::Temp->newdir( @_, TMPDIR => 1 );
}

1;

__END__

=head1 COPYRIGHT

=for COPYRIGHT BEGIN

Copyright 2021 University of Southampton.
EPrints 3.4 is supplied by EPrints Services.

http://www.eprints.org/eprints-3.4/

=for COPYRIGHT END

=for LICENSE BEGIN

This file is part of EPrints 3.4 L<http://www.eprints.org/>.

EPrints 3.4 and this file are released under the terms of the
GNU Lesser General Public License version 3 as published by
the Free Software Foundation unless otherwise stated.

EPrints 3.4 is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with EPrints 3.4.
If not, see L<http://www.gnu.org/licenses/>.

=for LICENSE END

