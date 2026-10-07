principal = int(input("Enter principal: $"))
rate = float(input("Enter rate: %")) / 100
time = int(input("Enter time (years): "))

interest = principal * rate * time

print(f"Interest: ${interest:>.2f}")
