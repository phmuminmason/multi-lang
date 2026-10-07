use std::io::{self, Write};

fn main() {
    let mut principal = String::new();
    let mut rate = String::new();
    let mut time = String::new();

    print!("Enter principal: $");
    io::stdout().flush().unwrap();

    io::stdin().read_line(&mut principal)
               .expect("Failed to read principal.");

    let principal: f32 = principal.trim().parse()
                                  .expect("Principal must be a number!");

    print!("Enter rate: %");
    io::stdout().flush().unwrap();

    io::stdin().read_line(&mut rate).expect("Failed to read Rate.");
    let rate: f32 = rate.trim().parse()
                        .expect("Rate must be a number!");

    print!("Enter time (years): ");
    io::stdout().flush().unwrap();

    io::stdin().read_line(&mut time).expect("Failed to read time.");

    let time: f32 = time.trim().parse().expect("Time must be a number.");

    let interest: f32 = principal * (rate / 100.0) * time;

    println!("Interest ${interest:#.2}");
}
