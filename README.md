# HKU Beamer Theme

A professional LaTeX Beamer theme for The University of Hong Kong (HKU) presentations with modern project structure and VS Code integration.

## Overview

The HKU Beamer Theme provides a clean, professional design for academic and professional presentations. It features HKU branding, customizable color schemes, and various layout options including an optional sidebar navigation. The project is structured for maintainability with modular chapters and clean build management.

## Preview of the demo slides

<img width="1258" alt="image" src="https://github.com/user-attachments/assets/47f9ddb5-a497-417b-ab5f-099cd0fea52c" />

<img width="1258" alt="image" src="https://github.com/user-attachments/assets/1e1d5a09-561d-4bbf-81b4-c430b2cefda8" />

<img width="1258" alt="image" src="https://github.com/user-attachments/assets/665725f2-7596-4833-8889-2d39d10f6d27" />

<img width="500" alt="image" src="https://github.com/user-attachments/assets/5f32dca9-84ae-436c-baa8-143f8d7a3cca" />


## Project Structure

This theme uses a modular structure with separate folders for different components:

```
hku-beamer-theme/
├── main.tex                    # Main LaTeX file (uses \input for chapters)
├── main.pdf                    # Output PDF (copied from build/)
├── build/                      # All auxiliary files (.aux, .log, .nav, etc.)
├── styles/                     # All theme files (.sty)
│   ├── beamerthemeHKUstyle.sty
│   ├── beamercolorthemeHKUstyle.sty
│   ├── beamerinnerthemeHKUstyle.sty
│   └── beamerouterthemeHKUstyle.sty
├── figures-global/             # Shared figures (HKU logo, etc.)
│   └── HKU.png
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
└── [documentation and utility files]
```

### Folder Organization Benefits

- **Clean directory**: Only source files and final PDF in root
- **Modular content**: Each chapter in its own folder with dedicated figures
- **Auxiliary isolation**: All build artifacts in `build/` folder
- **Style separation**: All theme files organized in `styles/` folder
- **Figure organization**: Global vs. chapter-specific figure separation

## Features

- **Professional Design**: Clean layout with HKU branding and logo integration
- **Arial Font Support**: Automatically uses Arial fonts (true Arial with XeLaTeX, Helvetica with pdfLaTeX)
- **Flexible Options**: Multiple customization options for different presentation needs
- **Bilingual Support**: Works with both English and Chinese content
- **Color Schemes**: Blue (default) and red color schemes available
- **Navigation**: Optional sidebar navigation with section/subsection overview
- **Wide Screen Support**: Compatible with both 4:3 and 16:9 aspect ratios
- **Mathematical Support**: Full LaTeX math support with customizable fonts
- **Modular Structure**: Easy to organize and maintain large presentations

## Official HKU Branding

This theme follows the official [HKU Brand Guidelines](https://www.hku.hk/about/uid/basic.html) and uses the authentic HKU visual identity:

### HKU Green
- **Official Color**: HKU Green (Pantone 3308C)
- **Hex Code**: #024638
- **RGB Values**: RGB(2, 70, 56)
- **Description**: A blue-green hue derived from the University's Coat of Arms and academic gowns, reflecting heritage and bringing color harmony to key assets.

### Color Usage
- **Primary Color**: HKU Green is used as the default theme color for headers, structure elements, and branding
- **Alternative Color**: A red color scheme is available as an alternative option
- **Auxiliary Colors**: Lighter shades of HKU Green are used for accent elements and supporting graphics

This ensures that all presentations using this theme maintain consistency with HKU's official visual identity and branding standards.

## Installation and Setup

### Method 1: Clone and Use (Recommended)

1. Clone or download this repository:
   ```bash
   git clone <repository-url>
   cd hku-beamer-theme
   ```

2. The project is ready to use with the example content structure

### Method 2: Existing Project Integration

1. Copy the `styles/` folder to your project
2. Copy `figures-global/HKU.png` to your project
3. Update your main LaTeX file to include the styles path (see compilation section)

## VS Code Setup with LaTeX Workshop

For the best experience, use VS Code with the LaTeX Workshop extension and the provided configuration.

### Required VS Code Extensions

1. **LaTeX Workshop** - Main LaTeX support
2. **Code Spell Checker** (optional) - For spell checking

### VS Code Settings Configuration

Add this configuration to your VS Code `settings.json` (File → Preferences → Settings → Open Settings JSON):

```json
{
  // LaTeX Workshop Configuration - Optimized for HKU Beamer Theme
  "latex-workshop.latex.recipes": [
    {
      "name": "xelatex ✖2 (beamer) + copy",
      "tools": [
        "xelatex",
        "xelatex",
        "copy_pdf"
      ]
    },
    {
      "name": "xelatex ✖2 (beamer)",
      "tools": [
        "xelatex",
        "xelatex"
      ]
    },
    {
      "name": "pdflatex ✖2 (beamer)", 
      "tools": [
        "pdflatex",
        "pdflatex"
      ]
    }
  ],
  "latex-workshop.latex.tools": [
    {
      "name": "xelatex",
      "command": "xelatex",
      "args": [
        "-synctex=1",
        "-interaction=nonstopmode",
        "-file-line-error",
        "-halt-on-error",
        "-output-directory=build",
        "%DOC%"
      ],
      "env": {
        "TEXINPUTS": "./styles//:"
      }
    },
    {
      "name": "pdflatex",
      "command": "pdflatex",
      "args": [
        "-synctex=1",
        "-interaction=nonstopmode",
        "-file-line-error",
        "-halt-on-error",
        "-output-directory=build",
        "%DOC%"
      ],
      "env": {
        "TEXINPUTS": "./styles//:"
      }
    },
    {
      "name": "copy_pdf",
      "command": "cp",
      "args": [
        "build/%DOCFILE%.pdf",
        "%DOCFILE%.pdf"
      ]
    }
  ],
  
  // Build and Display Settings
  "latex-workshop.view.pdf.viewer": "tab",
  "latex-workshop.latex.autoBuild.run": "onSave",
  "latex-workshop.latex.autoClean.run": "onBuilt",
  "latex-workshop.latex.outDir": "build",
  
  // Clean File Types (beamer-specific)
  "latex-workshop.latex.clean.fileTypes": [
    "*.aux", "*.bbl", "*.blg", "*.idx", "*.ind", "*.lof", "*.lot",
    "*.out", "*.toc", "*.acn", "*.acr", "*.alg", "*.glg", "*.glo",
    "*.gls", "*.ist", "*.fls", "*.fdb_latexmk", "*.nav", "*.snm",
    "*.vrb", "*.synctex.gz", "*.xdv"
  ],
  
  // IntelliSense and Error Handling
  "latex-workshop.intellisense.package.enabled": true,
  "latex-workshop.intellisense.unimathsymbols.enabled": true,
  "latex-workshop.message.error.show": true,
  "latex-workshop.message.warning.show": false,
  
  // Suppress common font warnings
  "latex-workshop.message.latexlog.exclude": [
    "LaTeX Font Warning.*Arial.*undefined",
    "Font shape.*Arial.*undefined", 
    "Some font shapes were not available, defaults substituted"
  ],
  
  // SyncTeX for forward/backward search
  "latex-workshop.synctex.afterBuild.enabled": true,
  "latex-workshop.view.pdf.internal.synctex.keybinding": "double-click"
}
```

### Key Configuration Features

- **Clean Build Management**: All auxiliary files go to `build/` directory
- **Style Path Resolution**: `TEXINPUTS` environment variable finds theme files
- **Auto-build**: Compiles automatically when you save files
- **Auto-clean**: Removes auxiliary files after successful build
- **PDF Copy**: Final PDF copied to main directory for easy access
- **Error Filtering**: Suppresses common font warnings
- **SyncTeX**: Click in PDF to jump to source code

## Compilation

### Using VS Code (Recommended)

With the above configuration:
1. Open `main.tex` in VS Code
2. Save the file (Ctrl+S) - it will build automatically
3. View the PDF in VS Code's integrated viewer
4. All auxiliary files will be in the `build/` folder

### Manual Compilation

If you prefer command-line compilation:

```bash
# Set environment variable for style files
export TEXINPUTS="./styles//:"

# Compile with XeLaTeX (recommended for Arial fonts)
xelatex -output-directory=build main.tex
xelatex -output-directory=build main.tex  # Run twice for proper cross-references

# Copy PDF to main directory
cp build/main.pdf main.pdf
```

For pdfLaTeX (alternative):
```bash
export TEXINPUTS="./styles//:"
pdflatex -output-directory=build main.tex
pdflatex -output-directory=build main.tex
cp build/main.pdf main.pdf
```

## Usage

### Basic Document Structure

Your main document (`main.tex`) should include chapters using `\input`:

```latex
\documentclass[9pt]{beamer}

% Add tolerance for minor overfull issues
\hfuzz=1pt

\usepackage{listings}

% HKU Beamer Theme
  \usetheme[
      sidebar,      % Show sidebar with navigation
      footline,     % Show footline with page numbers
      green,        % Color scheme: green (default) or red
      english,      % Use English labels
      sectiontoc,   % Show section table of contents
  ]{HKUstyle} 

\title[Short Title]{Your Full Presentation Title}
\subtitle{Your Subtitle}
\author[Short Name]{Your Full Name}
\institute[HKU]{The University of Hong Kong\\Department of Your Department}
\date{\today}

\begin{document}

% Title Page
{\background
    \begin{frame}[plain,noframenumbering]
        \titlepage
    \end{frame}
}

% Outline
\begin{frame}
    \frametitle{Outline}
    \tableofcontents
\end{frame}

% Include all chapters
\input{chapters/introduction/introduction}
\input{chapters/theme-options/theme-options}
\input{chapters/examples/examples}
\input{chapters/conclusion/conclusion}

% Final page
{\background
    \begin{frame}[plain,noframenumbering]
        \finalpage{\Huge Thank You!}
    \end{frame}
}

\end{document}
```

### Creating New Chapters

1. Create a new folder in `chapters/`: `chapters/new-chapter/`
2. Create the chapter file: `chapters/new-chapter/new-chapter.tex`
3. Create figures folder: `chapters/new-chapter/figures/`
4. Add `\input{chapters/new-chapter/new-chapter}` to `main.tex`

Example chapter structure:
```latex
\section{Your Section Name}

\begin{frame}
    \frametitle{Frame Title}
    Your content here...
    
    % Reference chapter-specific figure
    \includegraphics[width=0.5\textwidth]{chapters/new-chapter/figures/your-figure.png}
\end{frame}
```

### Figure Organization

- **Global figures** (shared across chapters): Place in `figures-global/`
- **Chapter-specific figures**: Place in `chapters/[chapter-name]/figures/`

Reference figures with relative paths:
```latex
% Global figure
\includegraphics{figures-global/HKU.png}

% Chapter-specific figure
\includegraphics{chapters/introduction/figures/my-diagram.pdf}
```

## Theme Options

Configure the theme by passing options to `\usetheme`:

```latex
\usetheme[option1, option2, ...]{HKUstyle}
```

### Available Options

| Option | Default | Description |
|--------|---------|-------------|
| `sidebar` | off | Enable sidebar navigation with section/subsection overview |
| `footline` | off | Enable footline with author, title, and page numbers |
| `green` | on | Use HKU Green color scheme (official HKU branding) |
| `red` | off | Use alternative red color scheme |
| `english` | off | Use English labels (default: Chinese) |
| `wide` | off | Support for 16:9 aspect ratio presentations |
| `sectiontoc` | off | Show section table of contents before each section |
| `mathserif` | off | Use serif font for mathematics |
| `hideothersubsections` | off | Hide subsections not in current section |
| `hideallsubsections` | off | Hide all subsections in navigation |
| `hidetitle` | off | Hide title in sidebar |
| `hideauthor` | off | Hide author in sidebar |
| `hideinstitute` | off | Hide institute in sidebar |
| `shownavsym` | off | Show navigation symbols |

### Common Configurations

**Minimal presentation:**
```latex
\usetheme[english]{HKUstyle}
```

**Full-featured presentation:**
```latex
\usetheme[sidebar, footline, green, english, sectiontoc]{HKUstyle}
```

**Wide screen presentation:**
```latex
\usetheme[wide, sidebar, footline, green, english]{HKUstyle}
```

## Special Commands

### Background and Special Frames
```latex
% Title page with background
{\background
  \begin{frame}[plain,noframenumbering]
    \titlepage
  \end{frame}
}

% Final page
{\background
  \begin{frame}[plain,noframenumbering]
    \finalpage{\Huge Thank You!}
  \end{frame}
}
```

### Utility Commands
```latex
\source{Source attribution}        % Small gray source text
\toscript{Text in scriptsize}      % Smaller text
\toscriptt{Text in tiny size}      % Even smaller text
\Scale[4]{E=mc^2}                  % Scale mathematical expressions
\Resize{2cm}{E=mc^2}              % Resize mathematical expressions
```

## Troubleshooting

### Common Issues

1. **Style files not found**: Ensure TEXINPUTS is set correctly
2. **Logo not displaying**: Check that `figures-global/HKU.png` exists
3. **Build fails**: Check that `build/` directory exists and is writable
4. **Overfull warnings**: The theme includes `\hfuzz=1pt` to suppress minor warnings

### VS Code Specific Issues

1. **PDF not updating**: Check the LaTeX Workshop output panel for errors
2. **Auto-build not working**: Ensure `latex-workshop.latex.autoBuild.run` is set to `"onSave"`
3. **Style errors**: Make sure the TEXINPUTS environment variable is configured in tools

## Advanced Customization

### Modifying Colors
Edit colors in `styles/beamercolorthemeHKUstyle.sty`:

```latex
\definecolor{beamer@headercolor}{RGB}{2,70,56}% HKU Green (Pantone 3308C, #024638)
\definecolor{beamer@barcolor}{RGB}{34,94,82}% HKU Green auxiliary color (lighter shade)
```

### Layout Adjustments
Modify layout in `styles/beamerouterthemeHKUstyle.sty`:

```latex
\setlength{\beamer@width}{2cm}% Sidebar width
\setlength{\beamer@height}{1.8\baselineskip}% Header height
```

## Examples and Templates

The project includes example chapters showing:
- Title pages and navigation
- Mathematical content
- Tables and figures
- Code listings
- Block environments

Study the `chapters/` folder for usage examples.

## Maintenance and Updates

### Adding New Chapters
1. Create folder: `chapters/new-chapter/`
2. Create files: `new-chapter.tex` and `figures/` subfolder
3. Add input line to `main.tex`

### Updating Theme
1. Modify files in `styles/` folder
2. Test with example content
3. Update documentation as needed

## License

This theme is provided for use by The University of Hong Kong community and collaborators. Please respect HKU branding guidelines when using this theme.

## Contributing

To contribute improvements:
1. Test changes with the modular structure
2. Ensure VS Code LaTeX Workshop compatibility
3. Update documentation
4. Follow the established folder organization

## Support

For questions or issues:
- Check this documentation
- Review the example chapters in `chapters/`
- Consult LaTeX Beamer documentation for general usage
- Check VS Code LaTeX Workshop documentation for editor-specific issues 
