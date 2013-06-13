use Config;

open OUT, ">remote.fpl";
print OUT "#!$Config{perlpath}\n";
print OUT while <DATA>;
close OUT;
chmod 0755, "remote.fpl";
__END__

# Contributed by Don Bindner <dbindner@truman.edu>

use FCGI;

my $socket = FCGI::OpenSocket( "/tmp/testing-fastcgi-node.socket", 5 );
my $request = FCGI::Request( \*STDIN, \*STDOUT, \*STDERR,
    \%ENV, $socket );

my $count;
while( $request->Accept() >= 0 ) {
    print "Content-type: text/html\r\n\r\n";
    print ++$count;
}

FCGI::CloseSocket( $socket );
