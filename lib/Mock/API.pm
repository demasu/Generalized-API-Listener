package Mock::API;

use Dancer2;

use Mock::API::Order;
use Mock::API::Cancel;

use JSON::MaybeXS ();

our $VERSION = '0.1';

set 'show_errors' => 0;

use Data::Dumper;
$Data::Dumper::Indent = 3;

get '/' => sub {
    template 'index' => { 'title' => 'Mock::API' };
};

get '/order' => sub {
    my $params = params;
    my $result = Mock::API::Order::handle_request( $params );
    $result = JSON::MaybeXS::encode_json( $result );

    return $result;
};

get '/cancel' => sub {
    my $params = params;
    my $result = Mock::API::Cancel::handle_request( $params );
    $result = JSON::MaybeXS::encode_json( $result );

    return $result;
};

post '/order' => sub {
    my $params = params;
    my $result = Mock::API::Order::handle_request( $params );
    $result = JSON::MaybeXS::encode_json( $result );

    return $result;
};

post '/cancel' => sub {
    my $params = params;
    my $result = Mock::API::Cancel::handle_request( $params );
    $result = JSON::MaybeXS::encode_json( $result );

    return $result;
};

get '/:endpoint' => sub {
    my $endpoint = route_parameters->get('endpoint');

    my $response = {
        message  => 'There was no route found for the requested endpoint.',
        endpoint => $endpoint,
        error    => 1
    };

    return JSON::MaybeXS::encode_json( $response );
};

true;
