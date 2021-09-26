package ArrayData::Test::Spec::Basic;

use strict;
use warnings;

use Role::Tiny::With;

with 'ArrayDataRole::Spec::Basic';

# AUTHORITY
# DATE
# DIST
# VERSION

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
    die "StopIteration" unless $self->{pos} < @$elems;
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

sub get_item_at_pos {
    my ($self, $pos) = @_;
    if ($pos < 0) {
        die "Out of range" unless -$pos <= @$elems;
    } else {
        die "Out of range" unless $pos < @$elems;
    }
    $elems->[ $pos ];
}

sub has_item_at_pos {
    my ($self, $pos) = @_;
    if ($pos < 0) {
        return -$pos <= @$elems ? 1:0;
    } else {
        return $pos < @$elems ? 1:0;
    }
}

1;

# ABSTRACT: A test array data

=for Pod::Coverage ^(.+)$
