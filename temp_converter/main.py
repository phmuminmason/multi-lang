print('Python Temperature Converter')

HEAT_ERROR = 'Temperature cannot be greater than'
SCALE_ERROR = 'Scale must be "C" or "F"'
REPORT = 'equivalent is:'

temp = float(input('Enter a temperature: '))
scale = input('Enter a scale (C/F): ')

new_temp = 0.0
new_scale = ''

celsius = scale == "c" or scale == "C"
fahrenheit = scale == "f" or scale == "F"
valid_temp = True

if celsius:
    if temp > 100.0:
        valid_temp = False
        print(HEAT_ERROR, '100°C')
    else:
        new_temp = (temp * 9 / 5) + 32
        new_scale = "Fahrenheit"
elif fahrenheit:
    if temp > 212.0:
        valid_temp = False
        print(HEAT_ERROR, '212°F')
    else:
        new_temp = (temp - 32) * 5 / 9
        new_scale = "Celsius"
else: 
    print(SCALE_ERROR)

if (celsius or fahrenheit) and valid_temp:
    print(f"The {new_scale} {REPORT} {new_temp:.2f}°")
