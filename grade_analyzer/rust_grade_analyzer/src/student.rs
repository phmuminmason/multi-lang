use crate::prompt::prompt;

pub struct Student {
    pub name: String,
    pub scores: [u8; 4],
    pub drop: bool,
    pub average: f64,
    pub grade: String,
}

impl Student {
    pub fn new() -> Student {
        let student = Student {
            name: String::new(),
            scores: [0; 4],
            drop: true,
            average: 0.0,
            grade: String::new(),
        };

        return student;
    }

    pub fn get_name(&mut self) {
        let name = prompt("Enter your name:").unwrap();
        
        self.name = name.trim().to_owned();
    }

    pub fn get_scores(&mut self) {
        // `0..4` is more idiomatic than `0..=3`
        for i in 0..4 {
            let p = format!("Enter score for test{}:", i + 1);
            // The &String is automatically cast as &str
            let s = prompt(&p).unwrap();

            self.scores[i] = s.trim()
                                .parse()
                                .expect("Score must be a natural number");
        }
    }

    pub fn get_drop(&mut self) {
        let reply: String = prompt("Drop Score?").unwrap();

        match reply.to_uppercase().trim() {
            "Y" => {
                println!("Dropping lowest score...");
                self.drop = true;
            },
            "N" => {
                println!("Averaging all scores...");
                self.drop = false;
            },
            _ => panic!("Answer must be Y or N."), // Must bail out
        }
    }

    pub fn evaluate(&mut self) {
        self.average = self.calculate_average();
        self.grade = self.calculate_grade().to_string();
    }

    fn calculate_average(&self) -> f64 {
        // `.iter()` Creates an iterator that borrows the array and references its elements
        // `.map()` copies and transforms each value; the closure here converts them into u16
        // `.sum()` adds the converted values
        let total: u16 = self.scores.iter() 
            .map(|&score| score as u16)
            .sum();

        // `if` and `else` are expressions so they can return values by themselves
        if self.drop {
            // Returns a &u8, so it must be de-referenced with `*`
            //  before being used or cast into a u16
            let lowest: u16 = *self.scores.iter().min().unwrap() as u16;

            (total - lowest) as f64 / 3.0
        } else {
            total as f64 / 4.0
        }
    }

    fn calculate_grade(&self) -> &str {
        match self.average {
            1.0..60.0 => "F",
            60.0..64.0 => "D-",
            64.0..67.0 => "D",
            67.0..70.0 => "D+",
            70.0..74.0 => "C-",
            74.0..77.0 => "C",
            77.0..80.0 => "C+",
            80.0..84.0 => "B-",
            84.0..87.0 => "B",
            87.0..90.0 => "B+",
            90.0..94.0 => "A-",
            94.0..97.0 => "A",
            97.0..101.0 => "A+",
            _ => panic!(
                    "Error - Invalid Average: {}\nAverage must be between 1 and 100.", 
                    self.average
                )
        }
    }

    pub fn report(&self) -> String {
        format!(
            "Grade for {}: {:.1}% ({})", 
            self.name, self.average, self.grade
        )
    }
}
