use std::io::{self, Write};
use std::collections::HashMap;

fn main() {
    const PROMPT_WIDTH: usize = 26;

    let planets: HashMap<&str, f32> = HashMap::from([
        ("Mercury", 0.38),
        ("Venus",   0.91),
        ("Moon",    0.165),
        ("Mars",    0.38),
        ("Jupiter", 2.34),
        ("Saturn",  0.93),
        ("Uranus",  0.92),
        ("Neptune", 1.12),
        ("Pluto",   0.066),
    ]);
    let mut name = String::new();
    let mut weight = String::new();

    print!("{:PROMPT_WIDTH$}", "What is your name?: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut name).expect("Failed to read name.");
    name = name.trim().to_string();

    print!("{:PROMPT_WIDTH$}", "How much do you weigh?: ");
    io::stdout().flush().unwrap();
    io::stdin().read_line(&mut weight).expect("Failed to read weight.");

    let weight: f32 = weight.trim()
                            .parse()
                            .expect("Please type a number!");

    
    println!("{:^30}", format!("{name}'s weight on each planet"));
    
    for planet in planets {
        let new_weight = planet.1 * weight;
        let planet_name = format!("{}:", planet.0);

        println!("Weight on {:<10} {:#10.2}", planet_name, new_weight);
    }
}
