package Mock::API::Cancel;

use strict;
use warnings;

use Data::Dumper;
$Data::Dumper::Indent = 3;

sub handle_request {
    my ($params) = @_;
    print STDERR "# Cancel.pm: In handle_request\n";

    print STDERR "# Cancel.pm: I got the params:\n";
    print STDERR "# Cancel.pm: handle_request: \n" . Dumper( \$params ) . "\n";

    return "Success";
}

1;
