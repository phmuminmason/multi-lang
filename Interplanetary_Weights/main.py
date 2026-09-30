MERCURY = 0.38
VENUS = 0.91
MOON = 0.165
MARS = 0.38
JUPITER = 2.34
SATURN = 0.93
URANUS = 0.92
NEPTUNE = 1.12
PLUTO = 0.066

TEMPLATE = "Weight on "

name = input(f"{'What is your name?:':26}")
earthWeight = float(input(f"{'How much do you weigh?:':26}"))

mercuryWeight = MERCURY * earthWeight
venusWeight = VENUS * earthWeight
moonWeight = MOON * earthWeight
marsWeight = MARS * earthWeight
jupiterWeight = JUPITER * earthWeight
saturnWeight = SATURN * earthWeight
uranusWeight = URANUS * earthWeight
neptuneWeight = NEPTUNE * earthWeight
plutoWeight = PLUTO * earthWeight

print(f"{'Your weight on other planets':^30}")
print(f'{TEMPLATE + 'Mercury:':20} {mercuryWeight:>10.2f}')
print(f'{TEMPLATE + 'Venus:':20} {venusWeight:>10.2f}')
print(f'{TEMPLATE + 'Moon:':20} {moonWeight:>10.2f}')
print(f'{TEMPLATE + 'Mars:':20} {marsWeight:>10.2f}')
print(f'{TEMPLATE + 'Jupiter:':20} {jupiterWeight:>10.2f}')
print(f'{TEMPLATE + 'Saturn:':20} {saturnWeight:>10.2f}')
print(f'{TEMPLATE + 'Uranus:':20} {uranusWeight:>10.2f}')
print(f'{TEMPLATE + 'Neptune:':20} {neptuneWeight:>10.2f}')
print(f'{TEMPLATE + 'Pluto:':20} {plutoWeight:>10.2f}')
