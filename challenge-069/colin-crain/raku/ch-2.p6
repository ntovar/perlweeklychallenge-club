#!/usr/bin/env perl6
#
#
#       one-zero-zero-one.raku
#
#         TASK #2 › 0/1 String
#         Submitted by: Mohammad S Anwar
#             A 0/1 string is a string in which every character is
#             either 0 or 1.
#
#             Write a script to perform switch and reverse to generate
#             S30 as described below:
#
#             switch:
#
#                 Every 0 becomes 1 and every 1 becomes 0. For example,
#                 “101” becomes “010”.
#
#             reverse:
#
#                 The string is reversed. For example, "001” becomes
#                 “100”.
#
#             Please follow the rule as below:
#
#                 S0 = “”
#                 S1 = “0”
#                 S2 = “001”
#                 S3 = “0010011”
#                 …
#                 SN = SN-1 + “0” + switch(reverse(SN-1))
#
#
#       2020 colin crain
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##



sub MAIN ( Int $n = 26) {
    S($n).say;
}

sub S ($n) {
    return '' unless $n;
    my $str = S($n-1);
    $str ~ '0' ~ $str.trans('01'=>'10').flip;
}
