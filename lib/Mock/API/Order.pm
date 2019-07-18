package Mock::API::Order;

use strict;
use warnings;

sub handle_request {
    my ( $params ) = @_;

    my $response = {
        'result'  => 1,
        'data'    => [],
        'message' => '',
    };

    my ($quantity_name) = grep { $_ =~ /quantity|amount|number/i } keys(%{$params});
    my $quantity = delete $params->{$quantity_name};

    my %obj = ();
    foreach my $param ( keys( %{$params} ) ) {
        $obj{$param} = $params->{$param};
    }

    my @licenses;
    my $i = 0;
    foreach my $iter ( 1..$quantity ) {
        my @chars = ( "A".."Z", 1..9 );
        my $string = 'KEY-';
        $string   .= $chars[rand @chars] for 1..15;
        my %temp   = %obj;
        $temp{license_key} = $string;
        push @licenses, \%temp;
        $i++;
        last if $i >= 10;
    }

    if ( scalar( @licenses ) )  {
        $response->{data} = \@licenses;
    }
    else {
        $response->{data} = 'There was nothing returned';
        $response->{result} = 0;
    }

    return $response;
}

1;

__END__
$VAR1 = \{
            'quantity' => '123',
            'product' => 'professional'
          };
