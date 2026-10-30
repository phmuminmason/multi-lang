// Declares modules and loads contents from the so-named files.
// Content can be accessed (if public) through paths, as seen below.
mod student;
mod prompt;

// Path for the Student struct. 
// The `use` statement brings names into scope. Without it, the whole
//  path `crate::student::Student` would need to be written out each time
//  instead of just `Student`
use crate::student::Student;

fn main() {
    let mut student = Student::new();

    student.get_name();
    student.get_scores();
    student.get_drop();
    student.evaluate();

    println!("{}", student.report());
}
