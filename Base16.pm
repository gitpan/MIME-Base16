package MIME::Base16;

require 5.005_62;
use strict;
use warnings;

use vars qw( $VERSION );
$VERSION = '1.1';

sub import {
	*encode = \&encode_base16;
	*decode = \&decode_base16;
}

sub decode_base16 {
	my $arg = shift;
	my $ret = "";
	for(my $i=0;$i<length($arg);$i+=2){
		my $tmp = substr($arg,$i,2);
		my $int = hex($tmp);
		$ret .= chr ($int);
	}
	return $ret;
}

sub encode_base16 {
	my $arg = shift;
	my $ret = "";
	for(my $i=0;$i<length($arg);$i+=1){
		my $tmp = ord(substr($arg,$i,1));
		#$ret .= sprintf "%x", $tmp;#old
		$ret .= sprintf "%02x", $tmp;#new
	}
	return $ret;
}

1;
__END__

=head1 NAME

MIME::Base16 - Base16 encoder / decoder

=head1 SYNOPSIS

      use MIME::Base16; 

      $encoded = MIME::Base16::encode($data);
      $decoded = MIME::Base16::decode($encoded);

=head1 DESCRIPTION

Encode data similar way like MIME::Base64 does.

=head1 EXPORT

NOTHING

=head1 AUTHOR

Stefan Gipper <stefanos@cpan.org>, http://www.coder-world.de/

=head1 SEE ALSO

perl(1), MIME::Base64(3pm).

=cut
