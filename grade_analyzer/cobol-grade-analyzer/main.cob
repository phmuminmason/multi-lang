IDENTIFICATION DIVISION.
PROGRAM-ID. grade-ANALYZER.

DATA DIVISION.
WORKING-STORAGE SECTION. 
  01 user-name     PIC X(20).
  01 ScoreTable.
    05 test-score  PIC 999 OCCURS 4 TIMES.
  01 drop-value    PIC A.
    88 drop-lowest VALUE "Y", "y".
    88 keep-lowest VALUE "N", "n".
    88 valid-drop  VALUE "Y", "y", "N", "n".

  01 average       PIC 999V9 VALUE ZEROES.
  01 display-avg   PIC ZZ9.9 VALUE ZEROES.
  01 grade         PIC XX VALUE SPACES.

  01 total         PIC 999 VALUE ZEROES.
  01 i             PIC 9 VALUE 1.
  01 entries       PIC 9 VALUE 4.
  01 score-buffer  PIC XXX VALUE SPACES.
  01 value-buffer  PIC S999 VALUE ZEROES.

PROCEDURE DIVISION.
StartRun. 
  PERFORM Receiving
  PERFORM Calculation

  DISPLAY "Grade for " FUNCTION TRIM(user-name) 
    ": " display-avg "% (" FUNCTION TRIM(grade) ")"
STOP RUN. 

Receiving SECTION.
  ReceiveName.
    DISPLAY "Enter your name: " WITH NO ADVANCING
    ACCEPT user-name.

  ReceiveTestScores.
    PERFORM VARYING i FROM 1 BY 1 UNTIL i > entries
      DISPLAY "Enter score #" i ": " WITH NO ADVANCING
      ACCEPT score-buffer

      PERFORM ValidateTestScore

      MOVE value-buffer TO test-score(i)
    END-PERFORM.

  ReceiveDrop.
    DISPLAY "Drop lowest grade? (Y/N): " WITH NO ADVANCING
    ACCEPT drop-value
    PERFORM ValidateDrop.

Validation SECTION.
  ValidateTestScore.
    IF FUNCTION TEST-NUMVAL(score-buffer) > 0
      PERFORM TestScoreError
    ELSE
      MOVE FUNCTION NUMVAL(score-buffer) TO value-buffer
      PERFORM ValidateScoreValue
    END-IF.

  ValidateScoreValue.
    IF value-buffer < 1
      PERFORM ScoreValueError
    END-IF.

  ValidateDrop.
    EVALUATE TRUE
    WHEN drop-lowest
      DISPLAY "Dropping lowest test score."
    WHEN keep-lowest
      DISPLAY "Averaging all test scores."
    WHEN NOT valid-drop
      PERFORM DropValueError
    END-EVALUATE.

Calculation SECTION.
  CalculateAverage.
    SORT test-score ON DESCENDING KEY test-score

    IF drop-lowest THEN
      COMPUTE entries = entries - 1
    END-IF

    PERFORM VARYING i FROM 1 BY 1 UNTIL i > entries
      ADD test-score(i) TO total
    END-PERFORM

    COMPUTE average = total / entries
    MOVE average TO display-avg.

  CalculateGrade.
    EVALUATE TRUE
      WHEN average >= 97.0 MOVE "A+" TO grade
      WHEN average >= 94.0 MOVE "A " TO grade
      WHEN average >= 90.0 MOVE "A-" TO grade
      WHEN average >= 87.0 MOVE "B+" TO grade
      WHEN average >= 84.0 MOVE "B " TO grade
      WHEN average >= 80.0 MOVE "B-" TO grade
      WHEN average >= 77.0 MOVE "C+" TO grade
      WHEN average >= 74.0 MOVE "C " TO grade
      WHEN average >= 70.0 MOVE "C-" TO grade
      WHEN average >= 67.0 MOVE "D+" TO grade
      WHEN average >= 64.0 MOVE "D " TO grade
      WHEN average >= 60.0 MOVE "D-" TO grade
      WHEN OTHER MOVE "F" TO grade
    END-EVALUATE.

RaiseError SECTION.
  TestScoreError.
    DISPLAY "Error: test score must be a number."
    DISPLAY "Entered: " QUOTES score-buffer QUOTES
    PERFORM AbortProgram.

  ScoreValueError.
    DISPLAY "Error: test score must be positive."
    DISPLAY "Value received: " value-buffer
    PERFORM AbortProgram.

  DropValueError.
    DISPLAY "Error: drop answer must be " 
      QUOTE "Y" QUOTE " or " QUOTE "N" QUOTE
    DISPLAY "Received: " drop-value
    PERFORM AbortProgram.

Command SECTION.
  AbortProgram.
    STOP RUN.
