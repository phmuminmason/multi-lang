IDENTIFICATION DIVISION.
  PROGRAM-ID. Interplanetary-Weights.

ENVIRONMENT DIVISION.
  INPUT-OUTPUT SECTION.
    FILE-CONTROL.
      SELECT planet-file ASSIGN "planets.dat"
        ORGANIZATION IS LINE SEQUENTIAL.

DATA DIVISION. 
  FILE SECTION.     
  FD planet-file.
    01 planet.
      05 planet-name   PIC A(10).
      05 planet-factor PIC 9V999.

  WORKING-STORAGE SECTION.
    01 user.
      05 user-name       PIC X(10).
      05 user-weight     PIC 99V99.
      05 input-weight    PIC 99.99.
    01 new-weight        PIC 999V99 VALUE ZEROS.

    01 prompt-line     PIC X(26) VALUE SPACES.
    01 output-line     PIC X(20).
    01 weight-display  PIC Z(7)9.99 VALUE ZEROS.
    01 EOF               PIC X VALUE 'N'.

PROCEDURE DIVISION.
  MOVE "What is your name?: " TO prompt-line
  DISPLAY prompt-line WITH NO ADVANCING
  ACCEPT user-name.

  MOVE "How much do you weigh?: " TO prompt-line
  DISPLAY prompt-line WITH NO ADVANCING
  ACCEPT input-weight.
  MOVE input-weight TO user-weight.


  DISPLAY FUNCTION TRIM(user-name) "'s weight on other planets"

  OPEN INPUT planet-file
    PERFORM run-planets UNTIL EOF = 'Y'.
  CLOSE planet-file.
STOP RUN.

run-planets.
  READ planet-file INTO planet
    AT END 
      MOVE 'Y' TO EOF
    NOT AT END
      PERFORM Calculate-Weights
      PERFORM Print-Report
  END-READ.

Calculate-Weights.
  MULTIPLY user-weight BY planet-factor GIVING new-weight.
  MOVE new-weight TO weight-display.

Print-Report.
  STRING "Weight on " planet-name INTO output-line
  DISPLAY output-line weight-display.

*>Write-Planet.
  *>DISPLAY "ENTER A PLANET"
  *>ACCEPT planet-name.
*>
  *>DISPLAY "ENTER A NUMBER"
  *>ACCEPT planet-factor
  *>MOVE planet-factor TO factor-out
*>
  *>OPEN OUTPUT planet-file
    *>WRITE planet
  *>CLOSE planet-file.
