IDENTIFICATION DIVISION.
PROGRAM-ID. TEMP-CONVERTER.

DATA DIVISION.
  WORKING-STORAGE SECTION.
    01 CELSIUS-MAX     CONSTANT 100.
    01 FAHRENHEIT-MAX  CONSTANT 212.
    01 HEAT-WARNING    CONSTANT "TEMPERATURE CANNOT BE GREATER THAN".

    01 user-temp       PIC S999V9.
    01 user-scale      PIC X.
      88 celsius       VALUE "C", "c".
      88 fahrenheit    VALUE "F", "f".
      88 valid-scale   VALUES "C", "c", "F", "f".

    01 converted-temp  PIC S999V9.

    01 new-scale       PIC X(10).
    01 new-temp        PIC -ZZ9.9.

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
    COMPUTE converted-temp = (user-temp * 9 / 5) + 32.

  ConvertToCelsius.
    PERFORM ValidateTempFahrenheit.
    MOVE "CELSIUS" TO new-scale
    COMPUTE converted-temp = (user-temp - 32) * 5 / 9.

Validation SECTION.
  ValidateTempFahrenheit.
    IF user-temp IS GREATER THAN FAHRENHEIT-MAX THEN
      DISPLAY HEAT-WARNING SPACE FAHRENHEIT-MAX user-scale
      PERFORM AbortProgram
    END-IF.

  ValidateTempCelsius.
    IF user-temp IS GREATER THAN CELSIUS-MAX THEN
      DISPLAY HEAT-WARNING SPACE CELSIUS-MAX user-scale
      PERFORM AbortProgram
    END-IF.
