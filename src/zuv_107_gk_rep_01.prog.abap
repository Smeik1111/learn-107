*&---------------------------------------------------------------------*
*& Report zuv_107_gk_rep_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuv_107_gk_rep_01.
WRITE: /,/,'Neue Aufgabe: 1 a',/.
WRITE: 'Überschrift',
 /,
 'Unterschrift'.

WRITE: /,/,'Neue Aufgabe: 1 b',/.
DATA: lv_test_string  TYPE string VALUE 'Überschrift',
      lv_test_string2 TYPE string VALUE 'Unterschrift'.
WRITE: lv_test_string, /, lv_test_string2.

WRITE: /,/,'Neue Aufgabe: 2 a',/.
DATA: lv_d TYPE d.
lv_d = '20220602'.
WRITE: lv_d.

WRITE: /,/,'Neue Aufgabe: 2 b',/.
SET COUNTRY 'US'.
DATA: lv_buffer_date TYPE c LENGTH 10.
WRITE lv_d TO lv_buffer_date.
WRITE: lv_buffer_date,/.

SET COUNTRY 'DE'.
WRITE lv_d TO lv_buffer_date.
WRITE: lv_buffer_date.

WRITE: /,/,'Neue Aufgabe: 2 c',/.
DATA:  lv_datumsvariable TYPE d.
WRITE sy-datum TO lv_datumsvariable.
WRITE: lv_datumsvariable.

WRITE: /,/,'Neue Aufgabe: 2 d',/.
DATA:  lv_datumsvariable_aufgabe_2d TYPE d.
lv_datumsvariable_aufgabe_2d = '20110101'.
SUBTRACT 1 FROM lv_datumsvariable_aufgabe_2d.
WRITE: lv_datumsvariable_aufgabe_2d.

WRITE: /,/,'Neue Aufgabe: 3 a',/.
WRITE: 'DO',/.
DO 10 TIMES.
  WRITE: sy-index.
  WRITE: 'Hello World',/.
ENDDO.

WRITE: /,'While',/.
WHILE sy-index < 11.
  WRITE: sy-index.
  WRITE: 'Hello World',/.
ENDWHILE.


WHILE sy-index < 11.
  WRITE: sy-index.
  WHILE sy-index < 4.
    WRITE: sy-index.
    Exit.
  ENDWHILE.
  WRITE: 'Hello World',/.
  WRITE: sy-index.
ENDWHILE.


WRITE: /,/,'Neue Aufgabe: 4 a',/.
BREAK-POINT.
Data: lv_breakpoint_test Type d Value 'asdasadd'.
lv_breakpoint_test = 'asBaCadd'.
lv_breakpoint_test = '02032111'.
* Buchstaben sind in Type d erlaubt, Zeichenfolgen von über 8 Zeichen werden auf 8 gekürzt
BREAK-POINT.
