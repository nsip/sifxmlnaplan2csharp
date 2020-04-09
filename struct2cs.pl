while(<>) {
  s/Inherits://;
  s/\[\](\S+)/\1\[\]/;
  s/type (\S+) struct/public struct \1/;
  s/type (\S+) (\S+)$/using \1 = \2;/;
  s/ `(.+);/;/g;
  s/(\S+): (\S+);/\2 \1;/;
  print;
}
