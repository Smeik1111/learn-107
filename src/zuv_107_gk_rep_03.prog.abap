*&---------------------------------------------------------------------*
*& Report zuv_107_gk_rep_03
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuv_107_gk_rep_03.
Write: 'Augabe 2',/.
DATA: lt_test TYPE STANDARD TABLE OF i.
Field-SYMBOLS: <lt_line> Type i.
DO 10 TIMES.
  APPEND 10 - sy-index + 10 TO lt_test.
ENDDO.

Loop at lt_test ASSIGNING <lt_line>.
    Write: <lt_line>,/.
endloop.

*READ TABLE lt_test FROM 8 INTO lt_line.
*Write: lt_line.

SORT lt_test.
Break-point.
