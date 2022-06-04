*&---------------------------------------------------------------------*
*& Report zuv_107_gk_rep_03
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuv_107_gk_rep_03.
WRITE: 'Aufgabe 2',/.
DATA: lt_test TYPE STANDARD TABLE OF i.
DO 10 TIMES.
  APPEND 10 - sy-index + 10 TO lt_test.
ENDDO.

LOOP AT lt_test ASSIGNING FIELD-SYMBOL(<lv_line>).
  WRITE: <lv_line>,/.
ENDLOOP.

*READ TABLE lt_test FROM 8 INTO lt_line.
*Write: lt_line.

SORT lt_test.
*Break-point.


WRITE: 'Aufgabe 3',/.
TYPES:
  BEGIN OF tys_person,
    id         TYPE i,
    first_name TYPE c LENGTH 20,
    last_name  TYPE c LENGTH 20,
    age        TYPE i,
    gender     TYPE c,
  END OF tys_person.

DATA: lt_standard_table TYPE STANDARD TABLE OF tys_person,
      counter           TYPE i.
DO 5 TIMES.
  APPEND INITIAL LINE TO lt_standard_table.
ENDDO.

LOOP AT lt_standard_table ASSIGNING FIELD-SYMBOL(<lv_line2>).
  <lv_line2>-id = counter.
  <lv_line2>-first_name = 'FirstName' && counter.
  <lv_line2>-last_name = 'LastName' && counter.
  <lv_line2>-age = counter.
  <lv_line2>-gender = 'd'.
  ADD 1 TO counter.
ENDLOOP.

READ TABLE lt_standard_table INDEX 2 ASSIGNING FIELD-SYMBOL(<ls_person>).
WRITE: <ls_person>-age.
*wir lesen initialwerte.
SORT lt_standard_table BY first_name ASCENDING.
SORT lt_standard_table BY last_name DESCENDING.

WRITE: 'Aufgabe 4',/.
DATA: lt_sorted_list     TYPE SORTED TABLE OF i WITH NON-UNIQUE KEY table_line,
      lv_insert_variable TYPE i.
DO 10 TIMES.
  "APPEND 10- sy-index + 10 TO lt_sorted_list."
  "Illegale sortierung. Append nur möglich wenn sortierung beibehalten wird."
  lv_insert_variable = 10 - sy-index + 10.
  INSERT lv_insert_variable INTO TABLE lt_sorted_list.
ENDDO.

WRITE: 'Aufgabe 5',/.
DATA: lt_sorted_list_person TYPE SORTED TABLE OF tys_person WITH UNIQUE KEY id.
lt_sorted_list_person[] = lt_standard_table[].
lt_sorted_list_person = lt_standard_table.
READ TABLE lt_sorted_list_person[] INDEX 2 ASSIGNING FIELD-SYMBOL(<ls_sorted_person>).
*<ls_sorted_person>-id = 99999.
* Not allowed. Da id ein Schlüssel

WRITE: 'Aufgabe 6',/.
TYPES:
  BEGIN OF tys_unknown,
    id     TYPE c LENGTH 10,
    anzahl TYPE i,
    preis Type Preis,
  END OF tys_unknown.
DATA: lt_hashed_list_unknown TYPE HASHED TABLE OF tys_unknown WITH UNIQUE KEY id.

DO 30 TIMES.
  DATA: lv_insert_variable2 TYPE tys_unknown,
        temp                TYPE i.
  temp = sy-index MOD 4.
  lv_insert_variable2 = VALUE #( id = 'ID' && temp anzahl = 1 preis = '123,23' ).
  COLLECT lv_insert_variable2 INTO lt_hashed_list_unknown.
* Collect zählt zahlen bei gleicher id zusammen.
ENDDO.

LOOP AT lt_hashed_list_unknown ASSIGNING FIELD-SYMBOL(<lv_line_unknown>).
Write: <lv_line_unknown>-id.
Write: <lv_line_unknown>-anzahl.
Write: <lv_line_unknown>-preis,/.
ENDLOOP.
* Kann


BREAK-POINT.

WRITE: 'Aufgabe 7',/.
*erledigt
