use clap::Parser;
use clap_verbosity_flag::{InfoLevel, Verbosity};

#[derive(Parser, Debug)]
#[command(author="Marc Carré", version, about="Real estate data collection from suumo.jp", long_about = None)]
pub struct Arguments {
    #[clap(flatten)]
    pub verbose: Verbosity<InfoLevel>,

    #[arg(long, default_value_t = false)]
    pub debug: bool,
}
