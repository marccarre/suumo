setup-coverage:
    rustup update
    rustup component add llvm-tools-preview
    cargo install grcov

setup: setup-coverage
    rustup component add clippy
    brew install markdownlint-cli
    brew install pre-commit
    pre-commit install
    pre-commit install --hook-type commit-msg

build:
    cargo build

lint: build
    pre-commit run --all-files
    cargo clippy
    cargo clippy --fix

cover:
    mkdir -p target/coverage/html
    CARGO_INCREMENTAL=0 RUSTFLAGS='-Cinstrument-coverage' LLVM_PROFILE_FILE='cargo-test-%p-%m.profraw' cargo test
    grcov . --binary-path ./target/debug/deps/ -s . -t html --branch --ignore-not-existing --ignore '../*' --ignore "/*" -o target/coverage/html
    grcov . --binary-path ./target/debug/deps/ -s . -t lcov --branch --ignore-not-existing --ignore '../*' --ignore "/*" -o target/coverage/tests.lcov
    rm -f *.profraw
    open ./target/coverage/html/index.html
