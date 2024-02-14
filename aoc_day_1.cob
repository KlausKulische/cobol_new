000100 identification division.
000200 program-id. aoc_1.
000300
000400 environment division.
000500 input-output section.
000600  file-control.
000700  select input_1 assign to 'data.dat'
000800  organization is line sequential.
000900  select out_1 assign to 'out.txt'
001000  organization is line sequential.
001100
001200 data division.
001300 file section.
001400 fd input_1.
001500 01 input_1-file.
001600  03 in_string  pic x(65).
001700 fd out_1.
001800 01 out_1_file  pic x(130).
001900
002000 working-storage section.
002100 01 ws-eof       pic a.
002200 01 ws_pointer_num  pic 99   value zero.
002300 01 fil          pic x(4) value space.
002400 01 num_part_1   pic 9    value zero.
002500 01 num_part_2   pic 9    value zero.
002600 01 num_part_3   pic 9    value zero.
002700 01 num_part_4   pic 9    value zero.
002800 01 num_part_5   pic 9    value zero.
002900 01 num_part_6   pic 9    value zero.
003000 01 num_part_7   pic 9    value zero.
003100 01 num_part_8   pic 9    value zero.
003200 01 num_part_9   pic 9    value zero.
003300 01 num_part_10  pic 9    value zero.
003400 01 num_part_11  pic 9    value zero.
003500 01 num_part_12  pic 9    value zero.
003600 01 concat_num_1 pic 9(6) value zero.
003700 01 concat_num_2 pic 9(6) value zero.
003800
003900 01 ws_out_1.
004000   03 out_string pic x(40).
004100   03 first_txt  pic x(10) value "    1st : ".
004200   03 first_num  pic 9.
004300   03 second_txt pic x(10) value "    2nd : ".
004400   03 second_num pic 9.
004500   03 third_txt  pic x(10) value "    3th : ".
004600   03 third_num  pic 9.
004700   03 fourth_txt pic x(10) value "    4th : ".
004800   03 fourth_num pic 9.
004900   03 fifth_txt  pic x(10) value "    5th : ".
005000   03 fifth_num  pic 9.
005100   03 sixth_txt  pic x(10) value "    6th : ".
005200   03 sixth_num  pic 9.
005300   03 filler     pic x value space.
005400   03 concat_out pic x(6).
005500   03 filler     pic x value space.
005600   03 concat_o   pic x(6).
005700   03 filler     pic x value space.
005800   03 pointer_num pic 99.
005900
006000 procedure division.
006100    open output out_1.
006200    open input input_1.
006300       perform until ws-eof='Y'
006400          read input_1
006500             at end
006600                move 'Y' to ws-eof
006700             not at end
006800               perform num_delimiter
006900               perform num_display
007300               perform num_concat
007400               add concat_num_1 to concat_num_2
007600               perform write_out 1 times
007700               perform num_reset
007800          end-read
007900       end-perform
008000    close input_1, out_1.
008100
008200 write_out section.
008300     move in_string     to  out_string.
008400     move num_part_6    to  first_num.
008500     move num_part_7    to  second_num.
008600     move num_part_8    to  third_num.
008700     move num_part_9    to  fourth_num.
008800     move num_part_10   to  fifth_num.
008900     move num_part_11   to  sixth_num.
009000     move concat_num_2  to  concat_out.
009100     move concat_num_1  to  concat_o.
009200     move ws_pointer_num to pointer_num.
009300     write out_1_file   from  ws_out_1 after advancing 1 line.
009400
009500 num_pointer section.
009600     unstring in_string delimited by all "1" or "2" or "3" or "4"
009700     or "5" or "6" or "7" or "8" or "9" or "0" into num_part_1
009800     count ws_pointer_num.
009900
010000 num_display section.
010100     perform num_pointer.
010200
010300 num_delimiter section.
010400     unstring in_string delimited by "1" or "2" or "3" or "4"
010500     or "5" or "6" or "7" or "8" or "9" or "0" into num_part_1
010600     delimiter in num_part_6.
010700     unstring in_string delimited by "1" or "2" or "3" or "4"
010800     or "5" or "6" or "7" or "8" or "9" or "0" into num_part_1,
010900     num_part_2 delimiter in num_part_7.
011000     unstring in_string delimited by "1" or "2" or "3" or "4"
011100     or "5" or "6" or "7" or "8" or "9" or "0" into num_part_1,
011200     num_part_2,num_part_3 delimiter in num_part_8.
011300     unstring in_string delimited by "1" or "2" or "3" or "4"
011400     or "5" or "6" or "7" or "8" or "9" or "0" into num_part_1,
011500     num_part_2,num_part_3,num_part_4 delimiter in num_part_9.
011600     unstring in_string delimited by "1" or "2" or "3" or "4"
011700     or "5" or "6" or "7" or "8" or "9" or "0" into num_part_1,
011800     num_part_2,num_part_3,num_part_4,num_part_5
011900     delimiter in num_part_10.
012000     unstring in_string delimited by "1" or "2" or "3" or "4"
012100     or "5" or "6" or "7" or "8" or "9" or "0" into num_part_1,
012200     num_part_2,num_part_3,num_part_4,num_part_5,num_part_12
012300     delimiter in num_part_11.
012400
012500 num_concat section.
012600     multiply num_part_6 by 10 giving  concat_num_1
012700     if num_part_11 not equal 0 then
012800       add num_part_11 to concat_num_1
012900     else
013000       if num_part_10 not equal 0 then
013100         add num_part_10 to concat_num_1
013200       else
013300        if num_part_9 not equal 0 then
013400          add num_part_9 to concat_num_1
013500        else
013600           if num_part_8 not equal 0 then
013700             add num_part_8 to concat_num_1
013800           else
013900             if num_part_7 not equal 0 then
014000               add num_part_7 to concat_num_1
014100             else
014200               add num_part_6 to concat_num_1
014300             end-if
014400           end-if
014500        end-if
014600       end-if
014700     end-if.
014800
014900 num_reset section.
015000     move zero to num_part_6, num_part_7, num_part_8, num_part_9,
015100       num_part_10, num_part_11.
015200
015300 end program aoc_1.
