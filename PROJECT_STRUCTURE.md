# HKU Beamer Theme - Project Structure

## Overview
This project has been restructured for better organization and cleaner directory management.

## Directory Structure

```
hku-beamer-theme/
├── main.tex                    # Main LaTeX file (uses \input for chapters)
├── main.pdf                    # Output PDF (copied from build/)
├── build/                      # All auxiliary files (.aux, .log, .nav, etc.)
├── styles/                     # All style files (.sty)
├── figures-global/             # Shared figures (like HKU logo)
├── chapters/                   # Individual chapters
│   ├── introduction/
│   │   ├── introduction.tex
│   │   └── figures/           # Chapter-specific figures
│   ├── theme-options/
│   │   ├── theme-options.tex
│   │   └── figures/
│   ├── examples/
│   │   ├── examples.tex
│   │   └── figures/
│   └── conclusion/
│       ├── conclusion.tex
│       └── figures/
├── build.sh                    # Automated build script
└── [documentation files]
```

## Key Features

### 1. Clean Directory
- Only source files (`.tex`) and output (`.pdf`) in main directory
- All auxiliary files in `build/` folder
- No clutter from `.aux`, `.log`, `.nav`, etc.

### 2. Modular Structure
- Each chapter in its own folder
- Each chapter has its own figures folder
- Easy to locate and edit specific content

### 3. LaTeX Workshop Configuration
The VS Code settings automatically:
- Build files to `build/` directory
- Clean auxiliary files after build
- Copy PDF to main directory for viewing

### 4. Style Files Organization
- All `.sty` files in `styles/` folder
- Automatic path resolution in `main.tex`

## Usage

### Building the Document
The document builds automatically in VS Code with LaTeX Workshop, or manually:

**Option 1: Using the build script (recommended)**
```bash
./build.sh
```

**Option 2: Manual build**
```bash
export TEXINPUTS="./styles//:"
xelatex -output-directory=build main.tex
xelatex -output-directory=build main.tex  # Run twice for cross-references
cp build/main.pdf main.pdf
```

**Note**: The `TEXINPUTS="./styles//:"` environment variable is crucial for LaTeX to find the style files in the `styles/` folder.

### Adding New Chapters
1. Create new folder in `chapters/`
2. Add chapter `.tex` file
3. Create `figures/` subfolder
4. Add `\input{chapters/new-chapter/new-chapter}` to `main.tex`

### Adding Figures
- For chapter-specific figures: place in `chapters/[chapter]/figures/`
- For shared figures: place in `figures-global/`
- Reference with relative paths from project root

## Benefits
- **Cleaner workspace**: Only essential files visible
- **Better organization**: Easy to find and edit content
- **Scalable**: Easy to add new chapters
- **Version control friendly**: Fewer generated files in git
- **Professional structure**: Follows LaTeX best practices 