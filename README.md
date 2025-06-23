# HKU Beamer Theme

A professional LaTeX Beamer theme for The University of Hong Kong (HKU) presentations.

## Overview

The HKU Beamer Theme provides a clean, professional design for academic and professional presentations. It features the HKU branding, customizable color schemes, and various layout options including an optional sidebar navigation.

## Features

- **Professional Design**: Clean layout with HKU branding and logo integration
- **Arial Font Support**: Automatically uses Arial fonts (true Arial with XeLaTeX/LuaLaTeX, Helvetica with pdfLaTeX)
- **Flexible Options**: Multiple customization options for different presentation needs
- **Bilingual Support**: Works with both English and Chinese content
- **Color Schemes**: Blue (default) and red color schemes available
- **Navigation**: Optional sidebar navigation with section/subsection overview
- **Wide Screen Support**: Compatible with both 4:3 and 16:9 aspect ratios
- **Mathematical Support**: Full LaTeX math support with customizable fonts

## Installation

### Method 1: Local Installation
1. Download all theme files (`beamerthemeHKUstyle.sty`, `beamercolorthemeHKUstyle.sty`, `beamerinnerthemeHKUstyle.sty`, `beamerouterthemeHKUstyle.sty`)
2. Place them in your project directory alongside your main `.tex` file
3. Ensure you have the HKU logo file (`figures/HKU.png`) in the correct location

### Method 2: System Installation
1. Copy the theme files to your LaTeX distribution's theme directory
2. Refresh your LaTeX installation's file database
3. The theme will be available system-wide

## Font Configuration

The HKU Beamer Theme automatically provides Arial font support:

- **With pdfLaTeX**: Uses Helvetica fonts (virtually identical to Arial) via the `helvet` package
- **With XeLaTeX/LuaLaTeX**: Uses true Arial system fonts via the `fontspec` package

### Compilation Methods

**Standard compilation (pdfLaTeX):**
```bash
pdflatex your-presentation.tex
```

**For true Arial fonts (recommended):**
```bash
xelatex your-presentation.tex
```

Both methods produce professional results with Arial-style fonts throughout your presentation.

## Basic Usage

```latex
\documentclass{beamer}
\usetheme[options]{HKUstyle}

\title{Your Presentation Title}
\author{Your Name}
\institute{Your Department}
\date{\today}

\begin{document}
  {\background
    \begin{frame}[plain,noframenumbering]
      \titlepage
    \end{frame}
  }
  
  \begin{frame}
    \frametitle{Your Frame Title}
    Your content here...
  \end{frame}
\end{document}
```

## Theme Options

The theme supports various options that can be specified when loading the theme:

```latex
\usetheme[option1, option2, ...]{HKUstyle}
```

### Available Options

| Option | Default | Description |
|--------|---------|-------------|
| `sidebar` | off | Enable sidebar navigation with section/subsection overview |
| `footline` | off | Enable footline with author, title, and page numbers |
| `blue` | on | Use blue color scheme (HKU standard) |
| `red` | off | Use red color scheme |
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
\usetheme[sidebar, footline, blue, english, sectiontoc]{HKUstyle}
```

**Wide screen presentation:**
```latex
\usetheme[wide, sidebar, footline, blue, english]{HKUstyle}
```

## Color Schemes

### Blue Scheme (Default)
- Header color: RGB(0,65,130)
- Accent color: RGB(38,81,107)
- Professional and clean appearance

### Red Scheme
- Header color: RGB(175,33,37)
- Accent color: RGB(180,76,76)
- Warmer, more dynamic appearance

## Special Commands

### Background Command
Use `\background` to apply the theme's background design to special frames:

```latex
{\background
  \begin{frame}[plain,noframenumbering]
    \titlepage
  \end{frame}
}
```

### Final Page
Use `\finalpage{}` to create a styled final slide:

```latex
{\background
  \begin{frame}[plain,noframenumbering]
    \finalpage{\Huge Thank You!}
  \end{frame}
}
```

### Utility Commands
- `\source{text}` - Add source attribution in small gray text
- `\toscript{text}` - Format text in scriptsize
- `\toscriptt{text}` - Format text in tiny size
- `\Scale[factor]{math}` - Scale mathematical expressions
- `\Resize{width}{math}` - Resize mathematical expressions

## Logo Requirements

The theme expects the HKU logo to be located at `figures/HKU.png`. Make sure to:

1. Create a `figures/` directory in your project folder
2. Place the HKU logo file as `HKU.png` in that directory
3. Ensure the logo is in PNG format with transparent background for best results

## Troubleshooting

### Common Issues

1. **Logo not displaying**: Ensure `figures/HKU.png` exists and is accessible
2. **Compilation errors**: Check that all required packages are installed
3. **Font issues**: Install the `newtxtext` and `newtxmath` packages
4. **Chinese text issues**: Use XeLaTeX compiler for better Chinese support

### Required Packages

The theme automatically loads these packages:
- `tikz` - For graphics and backgrounds
- `calc` - For length calculations
- `graphicx` - For logo inclusion
- `newtxtext`, `newtxmath` - For typography
- `amsmath`, `amsfonts` - For mathematics
- `tcolorbox` - For colored boxes
- `tabularx` - For advanced tables
- Other utility packages

## Examples

See `example.tex` for a comprehensive demonstration of the theme's features including:
- Title pages
- Section navigation
- Mathematical content
- Tables and figures
- Code listings
- Block environments

## Customization

### Modifying Colors
To modify the color scheme, edit the RGB values in `beamercolorthemeHKUstyle.sty`:

```latex
\definecolor{beamer@headercolor}{RGB}{0,65,130}% Main color
\definecolor{beamer@barcolor}{RGB}{38,81,107}% Accent color
```

### Adjusting Layout
Layout parameters can be modified in `beamerouterthemeHKUstyle.sty`:

```latex
\setlength{\beamer@width}{2cm}% Sidebar width
\setlength{\beamer@height}{1.8\baselineskip}% Header height
```

## License

This theme is provided for use by The University of Hong Kong community and collaborators. Please respect HKU branding guidelines when using this theme.

## Changelog

### v1.0.0 (2024-01-01)
- Initial release based on cleaned up SEU theme
- Renamed to HKU branding
- Removed redundant packages and code
- Added comprehensive documentation
- Created example presentation
- Improved code organization and comments

## Contributing

To contribute improvements or report issues:
1. Test your changes with the provided example
2. Ensure backward compatibility
3. Update documentation as needed
4. Follow the existing code style and organization

## Support

For questions or issues with the theme, please refer to:
- This documentation
- The example presentation (`example.tex`)
- LaTeX Beamer documentation for general beamer usage 