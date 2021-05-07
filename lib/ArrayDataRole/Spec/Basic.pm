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
with 'Role::TinyCommons::Collection::GetItemByPos';

# provides

sub apply_roles {
    my ($obj, @ad_roles) = @_;
    Role::Tiny->apply_roles_to_object(
        $obj, map { "ArrayDataRole::$_" } @ad_roles);
    $obj;
}

###

1;
# ABSTRACT: Required methods for all ArrayData::* modules

=head1 DESCRIPTION

L<ArrayData>::* modules let you iterate elements using a resettable iterator
interface (L<Role::TinyCommons::Iterator::Resettable>) as well as get elements
by position (L<Role::TinyCommons::Collection::GetItemByPos>), like what a
regular Perl array lets you.


=head1 ROLES MIXED IN

L<Role::TinyCommons::Iterator::Resettable>

L<Role::TinyCommons::Collection::GetItemByPos>


=head1 REQUIRED METHODS

=head2 new

Usage:

 my $ary = ArrayData::Foo->new([ %args ]);

Constructor. Must accept a pair of argument names and values.

=head2 get_next_item

From L<Role::TinyCommons::Iterator::Resettable>.

=head2 has_next_item

From L<Role::TinyCommons::Iterator::Resettable>.

=head2 reset_iterator

From L<Role::TinyCommons::Iterator::Resettable>.

=head2 get_item_at_pos

From L<Role::TinyCommons::Iterator::GetItemByPos>.

=head2 has_item_at_pos

From L<Role::TinyCommons::Iterator::GetItemByPos>.


=head1 PROVIDED METHODS

=head2 apply_roles

Usage:

 $obj->apply_roles('R1', ...)

Apply ArrayDataRole::* roles (ArrayDataRole::R1, ...) to object. It's basically
a shortcut for:

 Role::Tiny->apply_roles_to_object($obj, 'ArrayDataRole::R1', ...);


=head1 SEE ALSO

L<Role::TinyCommons::Iterator::Resettable>

L<Role::TinyCommons::Collection::GetItemByPos>
