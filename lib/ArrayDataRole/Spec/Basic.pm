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
with 'Role::TinyCommons::Collection::Subscript';

###

1;
# ABSTRACT: Required methods for all ArrayData::* modules

=head1 DESCRIPTION

The basic interfaces L<ArrayData> module are a resettable iterator
(L<Role::TinyCommons::Iterator::Resettable>) as well as a subscriptable
collection (L<Role::TinyCommons::Collection::Subscript>).

Subscriptable collection interface: You can retrieve an item at a particular
subscript (index) with L</get_item_at>.


=head1 ROLES MIXED IN

L<Role::TinyCommons::Iterator::Resettable>

L<Role::TinyCommons::Collection::Subscript>


=head1 REQUIRED METHODS

=head2 new

Usage:

 my $ary = ArrayData::Foo->new([ %args ]);

Constructor. Must accept a pair of argument names and values.


=head1 PROVIDED METHODS

No additional provided methods.


=head1 SEE ALSO

L<Role::TinyCommons::Iterator::Resettable>

L<Role::TinyCommons::Collection::Subscript>
