# protos

This project contains `.proto` files defining gRPC services and messages.

## Requirements

To generate Go code from `.proto` files, you will need:

- **protoc** (Protocol Buffers Compiler) — [Download here](https://grpc.io/docs/protoc-installation/).
- **protoc-gen-go** and **protoc-gen-go-grpc** plugins for Go code generation.

### Installation

1. Install the required plugins by running:

   ```bash
   go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
   go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
   ```
2. Make sure `$GOPATH/bin` is in your `PATH`:

   ```bash
    export PATH="$PATH:$(go env GOPATH)/bin"
   ```
   To add it permanently, add the line above to your shell configuration file (e.g., `~/.bashrc` or `~/.zshrc`).

### Using Makefile

To generate Go code from `.proto` files using `Makefile`, you can use the `generate` target. This will automatically find all `.proto` files in the `proto` directory and generate the corresponding Go code.

1. Ensure you have the required `protoc` plugins installed (see Installation section above).

2. Run the following command to generate the Go code:

   ```bash
   make generate
   ```
   This will:

   - Look for `.proto` files in the `./proto` directory.

   - Generate Go code in the `./gen/go` directory.

   - Use the `--go_out` and `--go-grpc_out` options to generate the necessary files for gRPC services and messages.

   - The generated Go files will be placed in the `./gen/go` directory, with paths relative to the source `.proto` files.