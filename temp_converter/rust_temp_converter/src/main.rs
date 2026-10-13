use std::io::{self, Write};

const CELSIUS_MAX: f32 = 100.0;
const FAHRENHEIT_MAX: f32 = 212.0;

fn main() {
    let mut temp = String::new();
    let mut scale = String::new();

    println!("Rust Temperature Converter");
    print!("Enter a Temperature: ");
    io::stdout().flush().unwrap();

    io::stdin().read_line(&mut temp).expect("Failed to read Temp!");
    let temp: f32 = temp.trim().parse().expect("Temp must be a number!");

    print!("Enter a Scale (C/F): ");
    io::stdout().flush().unwrap();

    io::stdin().read_line(&mut scale).expect("Failed to read Scale!");
    scale = scale.trim().to_string().to_uppercase();

    match scale.as_str() {
        "F" => convert_to_celsius(temp),
        "C" => convert_to_fahrenheit(temp),
        _ => println!("Scale must be \"C\" or \"F\"")
    }
}

fn convert_to_fahrenheit(t: f32) {
    if t > CELSIUS_MAX {
        warn_temp(CELSIUS_MAX, "C");
    } else {
        let new_temp = (t * 9.0 / 5.0) + 32.0;
        println!("The Fahrenheit equivalent is: {new_temp:.2}"); 
    }
}

fn convert_to_celsius(t: f32) {
    if t > FAHRENHEIT_MAX {
        warn_temp(FAHRENHEIT_MAX, "F");
    } else {
        let new_temp = (t - 32.0) * 5.0 / 9.0;
        println!("The Celsius equivalent is: {new_temp:.2}"); 
    }
}

fn warn_temp(temp: f32, scale: &str) {
    println!("Temp cannot exceed {temp:#.2}{scale}");
}
