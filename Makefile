.PHONY: new help

help:
	@echo "Usage: make new NAME=<deck-name>"
	@echo ""
	@echo "Creates a new deck directory from the template."

new:
ifndef NAME
	$(error NAME is required. Usage: make new NAME=<deck-name>)
endif
	@if [ -d "$(NAME)" ]; then \
		echo "Error: Directory '$(NAME)' already exists"; \
		exit 1; \
	fi
	@cp -r template "$(NAME)"
	@echo "Created new deck: $(NAME)/"
