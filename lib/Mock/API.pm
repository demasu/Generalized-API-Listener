package Mock::API;

use Dancer2;

use Mock::API::Order;
use Mock::API::Cancel;

use JSON::MaybeXS;

our $VERSION = '0.1';

use Data::Dumper;
$Data::Dumper::Indent = 3;

get '/' => sub {
    template 'index' => { 'title' => 'Mock::API' };
};

get '/order' => sub {
    print STDERR "# API.pm: Getting params\n";
    my $params = params;
    print STDERR "# API.pm: Params are:\n";
    print STDERR "# API.pm: API.pm: \n" . Dumper( \$params ) . "\n";
    print STDERR "# API.pm: Calling handle_request on Mock::API::Order\n";
    my $result = Mock::API::Order::handle_request( $params );
    $result = JSON::MaybeXS::encode_json( $result );

    print STDERR "# API.pm: Returning result\n";
    return $result;
};

get '/cancel' => sub {
    print STDERR "# API.pm: Getting params\n";
    my $params = params;
    print STDERR "# API.pm: Params are:\n";
    print STDERR "# API.pm: API.pm: \n" . Dumper( \$params ) . "\n";
    print STDERR "# API.pm: Calling handle_request on Mock::API::Cancel\n";
    my $result = Mock::API::Cancel::handle_request( $params );
    $result = JSON::MaybeXS::encode_json( $result );

    print STDERR "# API.pm: Returning result\n";
    return $result;
};

post '/order' => sub {
    print STDERR "# API.pm: Getting params\n";
    my $params = params;
    print STDERR "# API.pm: Params are:\n";
    print STDERR "# API.pm: API.pm: \n" . Dumper( \$params ) . "\n";
    print STDERR "# API.pm: Calling handle_request on Mock::API::Order\n";
    my $result = Mock::API::Order::handle_request( $params );
    $result = JSON::MaybeXS::encode_json( $result );

    print STDERR "# API.pm: Returning result\n";
    return $result;
};

post '/cancel' => sub {
    print STDERR "# API.pm: Getting params\n";
    my $params = params;
    print STDERR "# API.pm: Params are:\n";
    print STDERR "# API.pm: API.pm: \n" . Dumper( \$params ) . "\n";
    print STDERR "# API.pm: Calling handle_request on Mock::API::Cancel\n";
    my $result = Mock::API::Cancel::handle_request( $params );
    $result = JSON::MaybeXS::encode_json( $result );

    print STDERR "# API.pm: Returning result\n";
    return $result;
};

true;
