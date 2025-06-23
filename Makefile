# Makefile for HKU Beamer Theme
# Usage: make example, make clean, or make help

LATEX = pdflatex
EXAMPLE = example
THEME_FILES = beamerthemeHKUstyle.sty beamercolorthemeHKUstyle.sty beamerinnerthemeHKUstyle.sty beamerouterthemeHKUstyle.sty

.PHONY: example clean help all

# Default target
all: example

# Build the example presentation
example: $(EXAMPLE).pdf

$(EXAMPLE).pdf: $(EXAMPLE).tex $(THEME_FILES) figures/HKU.png
	$(LATEX) $(EXAMPLE).tex
	$(LATEX) $(EXAMPLE).tex  # Run twice for proper references

# Clean auxiliary files
clean:
	rm -f *.aux *.log *.nav *.out *.snm *.toc *.synctex.gz *.fdb_latexmk *.fls
	@echo "Cleaned auxiliary files"

# Clean everything including PDF
distclean: clean
	rm -f $(EXAMPLE).pdf
	@echo "Cleaned all generated files"

# Check if theme files exist
check:
	@echo "Checking theme files..."
	@for file in $(THEME_FILES); do \
		if [ -f "$$file" ]; then \
			echo "✓ $$file exists"; \
		else \
			echo "✗ $$file missing"; \
		fi; \
	done
	@if [ -f "figures/HKU.png" ]; then \
		echo "✓ figures/HKU.png exists"; \
	else \
		echo "✗ figures/HKU.png missing"; \
	fi

# Show help
help:
	@echo "HKU Beamer Theme Makefile"
	@echo ""
	@echo "Available targets:"
	@echo "  example    - Build the example presentation (default)"
	@echo "  clean      - Remove auxiliary files"
	@echo "  distclean  - Remove all generated files"
	@echo "  check      - Check if all required files exist"
	@echo "  help       - Show this help message"
	@echo ""
	@echo "Usage:"
	@echo "  make example    # Build example.pdf"
	@echo "  make clean      # Clean up auxiliary files"
	@echo "  make check      # Verify all files are present" 