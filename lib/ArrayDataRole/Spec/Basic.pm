package ArrayDataRole::Spec::Basic;

use strict;
use warnings;

use Role::Tiny;
use Role::Tiny::With;

# AUTHORITY
# DATE
# DIST
# VERSION

# constructor
requires 'new';

# mixin
with 'Role::TinyCommons::Iterator::Resettable';
with 'Role::TinyCommons::Collection::GetItemByPos';

# provides

my @role_prefixes = qw(ArrayDataRole Role::TinyCommons::Collection);
sub apply_roles {
    my ($obj, @unqualified_roles) = @_;

    my @roles_to_apply;
  ROLE:
    for my $ur (@unqualified_roles) {
      PREFIX:
        for my $prefix (@role_prefixes) {
            my ($mod, $modpm);
            $mod = "$prefix\::$ur";
            ($modpm = "$mod.pm") =~ s!::!/!g;
            eval { require $modpm; 1 };
            unless ($@) {
                #print "D:$mod\n";
                push @roles_to_apply, $mod;
                next ROLE;
            }
        }
        die "Can't find role '$ur' to apply (searched these prefixes: ".
            join(", ", @role_prefixes);
    }

    Role::Tiny->apply_roles_to_object($obj, @roles_to_apply);

    # return something useful
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

 $obj->apply_roles('R1', 'R2', ...)

Apply roles to object. R1, R2, ... are unqualified role names that will be
searched under C<ArrayDataRole::*> or C<Role::TinyCommons::Collection::*>
namespace. It's a convenience shortcut for C<< Role::Tiny->apply_roles_to_object
>>.

Return the object, so you can do something like this:

 my $obj = ArrayData::Word::ID::KBBI->new->apply_roles('FindItem::Iterator', 'PickItems::Iterator');

 my $obj = ArrayData::Word::ID::KBBI->new->apply_roles('BinarySearch::LinesInHandle');


=head1 SEE ALSO

L<Role::TinyCommons::Iterator::Resettable>

L<Role::TinyCommons::Collection::GetItemByPos>
