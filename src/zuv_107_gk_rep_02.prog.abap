*&---------------------------------------------------------------------*
*& Report zuv_107_gk_rep_02
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zuv_107_gk_rep_02.
TYPES:
  BEGIN OF tys_person,
    id         TYPE i,
    first_name TYPE c LENGTH 20,
    last_name  TYPE c LENGTH 20,
    age        TYPE i,
    gender     TYPE c,
  END OF tys_person.

DATA: ls_person TYPE tys_person.
ls_person = VALUE #( id = 0 first_name = 'Hans' last_name = 'Zimmer' age = 99 gender = 'männlich' ).
*BREAK-POINT.
*WRITE: ls_person.^
WRITE: ls_person-id,/,
ls_person-first_name,/,
ls_person-last_name,/,
ls_person-age,/,
ls_person-gender,/.

TYPES:
  BEGIN OF tys_person2,
    id         TYPE i,
    first_name TYPE c LENGTH 40,
    last_name  TYPE c LENGTH 40,
    age        TYPE i,
    gender     TYPE c,
  END OF tys_person2.

  Data: ls_person2 Type tys_person2.
*ls_person2 = ls_person.
Move-CORRESPONDING ls_person to ls_person2.
Write: ls_person2-last_name.
