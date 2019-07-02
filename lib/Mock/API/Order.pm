package Mock::API::Order;

use strict;
use warnings;

use Data::Dumper;
$Data::Dumper::Indent = 3;

sub handle_request {
    my ( $params ) = @_;
    print STDERR "# Order.pm: In handle_request\n";

    my $response = {
        'result'  => 1,
        'data'    => [],
        'message' => '',
    };

    my ($quantity_name) = grep { $_ =~ /quantity|amount|number/i } keys(%{$params});
    print STDERR "# Order.pm: Quantity name is: [$quantity_name]\n";
    my $quantity = delete $params->{$quantity_name};
    print STDERR "# Order.pm: Quantity is: [$quantity]\n";

    my %obj = ();
    foreach my $param ( keys( %{$params} ) ) {
        $obj{$param} = $params->{$param};
    }
    print STDERR "# Order.pm: Object built is:\n";
    print STDERR "# Order.pm: handle_request: \n" . Dumper( \%obj ) . "\n";

    my @licenses;
    my $i = 0;
    foreach my $iter ( 1..$quantity ) {
        my @chars = ( "A".."Z", 1..9 );
        my $string = 'KEY-';
        $string   .= $chars[rand @chars] for 1..15;
        print STDERR "# Order.pm: String is: [$string]\n";
        my %temp   = %obj;
        print STDERR "# Order.pm: handle_request: \n" . Dumper( \%temp ) . "\n";
        $temp{license_key} = $string;
        push @licenses, \%temp;
        $i++;
        last if $i >= 10;
    }
    print STDERR "# Order.pm: Licenses are:\n";
    print STDERR "# Order.pm: handle_request: \n" . Dumper( \@licenses ) . "\n";
    print STDERR "# Order.pm: Obj is:\n";
    print STDERR "# Order.pm: handle_request: \n" . Dumper( \%obj ) . "\n";

    $response->{data} = \@licenses;
    print STDERR "# Order.pm: Final response is:\n";
    print STDERR "# Order.pm: handle_request: \n" . Dumper( \$response ) . "\n";

    return $response;
}

1;

__END__
$VAR1 = \{
            'quantity' => '123',
            'product' => 'professional'
          };
