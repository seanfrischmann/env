#!/usr/bin/perl

use strict;
use warnings;

if ($ARGV[0] && $ARGV[0] eq '-h') {
    print <<'EOS';
Usage: s [id|name]
id is session number, not pid. Run s without args to see session id.
Name is session name
EOS
    exit;
}

my @sessions;
my $i = 1;

my @buffer = `screen -ls`;

if ($buffer[0] =~ m/No Sockets found/) {
    die("  No existing SCREEN session to reattach to...\n");
}

print <<'EOS';

  CURRENT SESSIONS
  ------------------------
EOS

for (@buffer) {
    if (m/(\d+\.\S*).*?\((Detached|Attached)\)/) {
        push (@sessions, $1);
        print "     $i.  $1\n";
        ++$i;
    }
}

print "  ------------------------\n";
print "     0.  New Session\n";

my $input;
if (scalar @ARGV) {
    chomp($input = $ARGV[0]);
} else {
    print "\n  Reattach to session: ";
    chomp($input = <>);
}

my $session;
if ($input =~ m/^\d+$/) {
    if ($input == 0) {
        print "New Session Name: ";
        chomp(my $name = <>);
        `screen -S $name`;
        exit;
    } elsif ($input > 0 && $input < $i) {
        $session = $sessions[$input-1];
    }
} else {
    for (@sessions) {
        $session = $1 if (m/(.*\.$input$)/);
    }
}

if ($session) {
	print "screen -d -r $session\n";
    `screen -d -r $session`;
} else {
    print "  Could not reattach to '$input'\n";
}
