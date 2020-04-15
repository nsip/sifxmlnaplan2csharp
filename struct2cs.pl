@code = ();
@using1 = ();
@using2 = ();

while(<>) {
  #s/Inherits://;
  s/\[\](\S+)/\1\[\]/;
  s/INHERITS//;
  s/type (\S+) struct/public struct \1/;
  s/type (\S+) (\S+)$/using \1 = \2;/;
  s/ `(.+);/;/g;
  s/ `(.+)$/;/g;
  s/(\S+): (\S+);/\2 \1;/;
  if (m/using/ && m/= string;/) {
    push @using1, $_;
  } elsif (m/using/) {
    push @using2, $_;
  } else {
    push @code, $_;
  }
}

foreach $x (@using1) { print $x; }
foreach $x (@using2) { print $x; }
foreach $x (@code) { print $x; }
