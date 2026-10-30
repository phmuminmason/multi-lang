use std::io::{self, Write};

pub fn prompt(message: &str) -> io::Result<String> {
    let mut input = String::new();

    print!("{} ", message);
    io::stdout().flush().unwrap();

    io::stdin().read_line(&mut input).expect("Failed to read input");

    // It is idiomatic to omit `return` for the final expression
    Ok(input)
}
