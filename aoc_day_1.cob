000100 identification division.
000200 program-id. aoc_1.
000300 
000400 environment division.
000500 input-output section.
000600  file-control.
000700  select input_1 assign to 'data.dat'
000800  organization is line sequential.
000900 
001000 data division.
001100 file section.
001200 fd input_1.
001300 01 input_1-file.
001400  03 in_string  pic x(65).
001500 
001600 working-storage section.
001700 01 ws-eof       pic a.
001800 01 fil       pic x(4) value space.
001900 01 num_part_1   pic 9    value zero.
002000 01 num_part_2   pic 9    value zero.
002100 01 num_part_3   pic 9    value zero.
002200 01 num_part_4   pic 9    value zero.
002300 01 num_part_5   pic 9    value zero.
002400 01 num_part_6   pic 9    value zero.
002500 01 num_part_7   pic 9    value zero.
002600 01 num_part_8   pic 9    value zero.
002700 01 num_part_9   pic 9    value zero.
002800 01 num_part_10  pic 9    value zero.
002900 01 concat_num_1 pic 9(6) value zero.
003000 01 concat_num_2 pic 9(6) value zero.
003100 
003200 procedure division.
003300    open input input_1.
003400       perform until ws-eof='Y'
003500          read input_1
003600             at end
003700                move 'Y' to ws-eof
003800             not at end
003900               perform num_delimiter
004000               display "1st " num_part_6 " => 2nd " num_part_7
004100                 fil "3th " num_part_8 " => 4th " num_part_9
004200                 fil "5th " num_part_10
004300               perform num_concat
004400               add concat_num_1 to concat_num_2
004500               display "concat num 1 " concat_num_2
004600               perform num_reset
004700          end-read
004800       end-perform
004900    close input_1.
005000 
005100 num_delimiter section.
005200     unstring in_string delimited by "1" or "2" or "3" or "4"
005300     or "5" or "6" or "7" or "8" or "9" or "0" into num_part_1
005400     delimiter in num_part_6
005500     unstring in_string delimited by "1" or "2" or "3" or "4"
005600     or "5" or "6" or "7" or "8" or "9" or "0" into num_part_1,
005700     num_part_2 delimiter in num_part_7.
005800     unstring in_string delimited by "1" or "2" or "3" or "4"
005900     or "5" or "6" or "7" or "8" or "9" or "0" into num_part_1,
006000     num_part_2,num_part_3 delimiter in num_part_8.
006100     unstring in_string delimited by "1" or "2" or "3" or "4"
006200     or "5" or "6" or "7" or "8" or "9" or "0" into num_part_1,
006300     num_part_2,num_part_3,num_part_4 delimiter in num_part_9.
006400     unstring in_string delimited by "1" or "2" or "3" or "4"
006500     or "5" or "6" or "7" or "8" or "9" or "0" into num_part_1,
006600     num_part_2,num_part_3,num_part_4,num_part_5
006700     delimiter in num_part_10.
006800 
006900 num_concat section.
007000     multiply num_part_6 by 10 giving  concat_num_1
007100     if num_part_10 not equal 0 then
007200       add num_part_10 to concat_num_1
007300     else
007400      if num_part_9 not equal 0 then
007500        add num_part_9 to concat_num_1
007600      else
007700         if num_part_8 not equal 0 then
007800           add num_part_8 to concat_num_1
007900         else
008000           if num_part_7 not equal 0 then
008100             add num_part_7 to concat_num_1
008200           else
008300             add num_part_6 to concat_num_1
008400     end-if.
008500 
008600 num_reset section.
008700     move zero to num_part_6, num_part_7, num_part_8, num_part_9,
008800       num_part_10.
008900 
009000*    goback.
009100 
009200 end program aoc_1.
