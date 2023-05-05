mod common;

use crate::common::cli::Arguments;
use crate::common::error::FeedError;
use clap::Parser;
use tracing::info;

#[tokio::main]
async fn main() -> Result<(), FeedError> {
    let args = Arguments::parse();
    common::tracing::initialise(&args);
    info!("Argumented received: {:?}", args);

    info!("Gracefully terminated. See ya! 👋😘❤️");
    Ok(())
}
