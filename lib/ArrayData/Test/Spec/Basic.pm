package ArrayData::Test::Spec::Basic;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use warnings;

use Role::Tiny::With;

with 'ArrayDataRole::Spec::Basic';

my $elems = [
    1,
    2,
    undef,
    4,
];

sub new {
    my $class = shift;
    bless {pos=>0}, $class;
}

sub _elems {
    my $self = shift;
    $elems;
}

sub get_next_item {
    my $self = shift;
    die "Out of range" unless $self->{pos} < @$elems;
    $elems->[ $self->{pos}++ ];
}

sub has_next_item {
    my $self = shift;
    $self->{pos} < @$elems;
}

sub get_iterator_pos {
    my $self = shift;
    $self->{pos};
}

sub reset_iterator {
    my $self = shift;
    $self->{pos} = 0;
}

1;

# ABSTRACT: A test table data

=for Pod::Coverage ^(.+)$
