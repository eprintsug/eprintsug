######################################################################
#
# EPrints::Search::Condition::IsNull
#
######################################################################
#
#
######################################################################

=pod

=head1 NAME

B<EPrints::Search::Condition::IsNull> - "IsNull" search condition

=head1 DESCRIPTION

Matches items where the field is null.

=cut

package EPrints::Search::Condition::IsNull;

use EPrints::Search::Condition::Comparison;

@ISA = qw( EPrints::Search::Condition::Comparison );

use strict;

sub new
{
	my( $class, @params ) = @_;

	return $class->SUPER::new( "is_null", @params );
}

sub logic
{
	my( $self, %opts ) = @_;

	my $prefix = $opts{prefix};
	$prefix = "" if !defined $prefix;
	if( !$self->{field}->get_property( "multiple" ) )
	{
		$prefix = "";
	}

	my $db = $opts{session}->get_database;
	my $table = $prefix . $self->table;

	my @sql_and = ();
	foreach my $col_name ( $self->{field}->get_sql_names )
	{
		push @sql_and, $db->quote_identifier( $table, $col_name )." is Null";
	}
	return "( ".join( " AND ", @sql_and ).")";
}

1;

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

