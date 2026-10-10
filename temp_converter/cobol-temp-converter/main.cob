IDENTIFICATION DIVISION.
PROGRAM-ID. TEMP-CONVERTER.

DATA DIVISION.
  WORKING-STORAGE SECTION.
    01 user-temp PIC S999V99.
    01 user-scale PIC X.
      88 celsius VALUE "C", "c".
      88 fahrenheit VALUE "F", "f".
      88 valid-scale VALUES "C", "c", "F", "f".

    01 converted-temp PIC S999V99.

    01 new-scale PIC X(10).
    01 new-temp  PIC -ZZ9.99.

PROCEDURE DIVISION.
  Begin.
    DISPLAY "TEMPERATURE CONVERSION APPLICATION".

    DISPLAY "ENTER A TEMPERATURE: " WITH NO ADVANCING
    ACCEPT user-temp.

    DISPLAY "ENTER A SCALE (C/F): " WITH NO ADVANCING
    ACCEPT user-scale.

    EVALUATE TRUE
      WHEN celsius PERFORM ConvertToFahrenheit
      WHEN fahrenheit PERFORM ConvertToCelsius
      WHEN NOT valid-scale 
        DISPLAY "SCALE MUST BE " QUOTE "C" QUOTE " OR " QUOTE "F" QUOTE
        PERFORM AbortProgram
    END-EVALUATE.

    MOVE converted-temp TO new-temp.

    DISPLAY "THE " FUNCTION TRIM(new-scale) " EQUIVALENT IS: " new-temp.

STOP RUN.

AbortProgram.
  STOP RUN.

Conversion SECTION.
  ConvertToFahrenheit.
    PERFORM ValidateTempCelsius.
    MOVE "FAHRENHEIT" TO new-scale.
    COMPUTE converted-temp = ((9 / 5) * user-temp) + 32.

  ConvertToCelsius.
    PERFORM ValidateTempFahrenheit.
    MOVE "CELSIUS" TO new-scale
    COMPUTE converted-temp = (5 / 9) * (user-temp - 32).

Validation SECTION.
  ValidateTempFahrenheit.
    IF user-temp IS GREATER THAN 212.00 THEN
      DISPLAY "TEMP CANNOT BE GREATER THAN 212.0 F"
      PERFORM AbortProgram
    END-IF.

  ValidateTempCelsius.
    IF user-temp IS GREATER THAN 100.00 THEN
      DISPLAY "TEMP CANNOT BE GREATER THAN 100.0 C"
      PERFORM AbortProgram
    END-IF.
