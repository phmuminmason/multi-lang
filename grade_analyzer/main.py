NP_SCORE_ERROR = 'Test score must be positive!'
INV_DROP_ERROR = 'Answer must be "Y" or "N"'
A_PLUS_THRESHOLD = 97.0
PASSING_THRESHOLD = 60.0

lowest_score = 0
number_of_scores = 4
letter_grade = ""
grade_sign = ""

name = input("What is your name?: ")

test1 = int(input("Enter your first score: "))
if test1 <= 0:
    print(NP_SCORE_ERROR)
    exit(1) # Exit code makes for better error handling
lowest_score = test1

test2 = int(input("Enter your second score: "))
if test2 <= 0:
    print(NP_SCORE_ERROR)
    exit(1)
if test2 < lowest_score:
    lowest_score = test2

test3 = int(input("Enter your third score: "))
if test3 <= 0:
    print(NP_SCORE_ERROR)
    exit(1)
if test3 < lowest_score:
    lowest_score = test3

test4 = int(input("Enter your fourth score: "))
if test4 <= 0:
    print(NP_SCORE_ERROR)
    exit(1)
if test4 < lowest_score:
    lowest_score = test4

drop_char = input('Drop the lowest score? (Y/N): ').upper()

if not (drop_char == 'N' or drop_char == 'Y'):
    print(INV_DROP_ERROR)
    exit(2)

drop = drop_char == 'Y'

score_sum = test1 + test2 + test3 + test4

if drop:
    number_of_scores = 3
    score_sum -= lowest_score

average = score_sum / number_of_scores

if average % 10 > 7:
    grade_sign = '+'
elif average % 10 < 4:
    grade_sign = '-'

if average >= A_PLUS_THRESHOLD:
    letter_grade = 'A+'
    grade_sign = ''
elif average >= 90:
    letter_grade = 'A'
elif average >= 80:
    letter_grade = 'B'
elif average >= 70:
    letter_grade = 'C'
elif average >= PASSING_THRESHOLD:
    letter_grade = 'D'
else:
    letter_grade = 'F'
    grade_sign = ''

letter_grade += grade_sign

print(f'Grade for {name}: {average:.1f}% ({letter_grade})')
