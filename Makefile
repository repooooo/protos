.PHONY: tag last-tag new-tag generate

PROTO_DIR = ./proto
GEN_DIR = ./gen/go

PROTO_FILES := $(shell find $(PROTO_DIR) -name "*.proto")

generate:
	protoc -I $(PROTO_DIR) \
	$(PROTO_FILES) \
	--go_out=$(GEN_DIR) \
	--go_opt=paths=source_relative \
	--go-grpc_out=$(GEN_DIR) \
	--go-grpc_opt=paths=source_relative

last-tag:
	@echo "Last tag:"
	@git describe --tags --abbrev=0

new-tag:
	@read -p "Enter new tag: " tag; \
	read -p "Are you sure you want to create and push the tag '$$tag'? (y/n): " confirm; \
	if [ "$$confirm" = "y" ] || [ "$$confirm" = "Y" ]; then \
		git tag "$$tag"; \
		git push origin "$$tag"; \
		echo "Tag '$$tag' has been successfully added and pushed."; \
	else \
		echo "Tag creation aborted."; \
	fi

tag: last-tag new-tag