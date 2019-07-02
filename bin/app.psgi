#!/usr/bin/env perl

use strict;
use warnings;
use FindBin;
use lib "$FindBin::Bin/../lib";


# use this block if you don't need middleware, and only have a single target Dancer app to run here
use Mock::API;

Mock::API->to_app;

=begin comment
# use this block if you want to include middleware such as Plack::Middleware::Deflater

use Mock::API;
use Plack::Builder;

builder {
    enable 'Deflater';
    Mock::API->to_app;
}

=end comment

=cut

=begin comment
# use this block if you want to mount several applications on different path

use Mock::API;
use Mock::API_admin;

use Plack::Builder;

builder {
    mount '/'      => Mock::API->to_app;
    mount '/admin'      => Mock::API_admin->to_app;
}

=end comment

=cut

