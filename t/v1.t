use strict;
use warnings;
 
use D2::Ajax;
use Test::More tests => 2;
use Plack::Test;
use HTTP::Request::Common;
use Test::NoWarnings;
 
subtest v1_greeting => sub {
    plan tests => 4;
 
    my $app = D2::Ajax->to_app;
 
    my $test = Plack::Test->create($app);
    my $res  = $test->request( GET '/api/v1/greeting' );
 
    ok $res->is_success, '[GET /] successful';
    is $res->content, '{"text":"Hello World"}';
    is $res->header('Content-Type'), 'application/json';
    is $res->header('Access-Control-Allow-Origin'), undef;
};
