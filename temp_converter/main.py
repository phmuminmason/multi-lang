print('Python Temperature Converter')

CELSIUS_MAX = 100.0
FAHRENHEIT_MAX = 212.0
HEAT_ERROR = 'Temperature cannot be greater than'
SCALE_ERROR = 'Scale must be "C" or "F"'

temp = float(input('Enter a temperature: '))
scale = input('Enter a scale (C/F): ')

new_temp = 0.0
new_scale = ''

celsius = scale == "c" or scale == "C"
fahrenheit = scale == "f" or scale == "F"

valid_temp = True

if celsius:
    if temp > CELSIUS_MAX:
        valid_temp = False
        print(f"{HEAT_ERROR} {CELSIUS_MAX}°C")
    else:
        new_temp = (temp * 9 / 5) + 32
        new_scale = "Fahrenheit"
elif fahrenheit:
    if temp > FAHRENHEIT_MAX:
        valid_temp = False
        print(f"{HEAT_ERROR} {FAHRENHEIT_MAX}°F")
    else:
        new_temp = (temp - 32) * 5 / 9
        new_scale = "Celsius"
else: 
    print(SCALE_ERROR)

if (celsius or fahrenheit) and valid_temp:
    print(f"The {new_scale} equivalent is: {new_temp:.1f}°")
