package ArrayDataRole::Spec::Basic;

# AUTHORITY
# DATE
# DIST
# VERSION

use Role::Tiny;
use Role::Tiny::With;

# constructor
requires 'new';

# mixin
with 'Role::TinyCommons::Iterator::Resettable';

###

1;
# ABSTRACT: Required methods for all ArrayData::* modules

=head1 DESCRIPTION

The basic interface of an ArrayData module is a resettable iterator
(L<Role::TinyCommons::Iterator::Resettable>). You can call L</reset_iterator> to
jump to the first element, then call L</get_next_item> repeatedly
to get elements one at a time until all the elements are retrieved. If you need
to go back to the first element, you can call L</reset_iterator> again.


=head1 ROLES MIXED IN

L<Role::TinyCommons::Iterator::Resettable>


=head1 REQUIRED METHODS

=head2 new

Usage:

 my $ary = ArrayData::Foo->new([ %args ]);

Constructor. Must accept a pair of argument names and values.


=head1 PROVIDED METHODS

No additional provided methods.


=head1 SEE ALSO

L<Role::TinyCommons::Iterator::Resettable>
