# ICEC30/ICMC2026 Poster

This folder contains a LaTeX poster package for presentation P1-061.

## Folder Layout

- `poster.tex`: active LaTeX poster driver, sized to 90 cm x 150 cm.
- `sections/`: section-level poster content files. The active driver currently inputs only `sections/introduction.tex`.
- `poster.pdf`: final compiled poster.
- `build.ps1`: local build helper for the active poster.
- `assets/`: only the logos and figure files referenced by `poster.tex`.
- `vendor/gemini-local/`: local Gemini/SMU beamer theme files used by the active poster.
- `vendor/beamerposter/`: local LaTeX support files needed by the beamerposter build.

Generated build files, zip export packages, old template candidates, rejected drafts, preview PNGs, local font tests, and unused assets have been removed. Running `build.ps1` recreates a temporary `build/` folder and refreshes `poster.pdf`.

## Build

From this folder:

```powershell
.\build.ps1
```

Manual equivalent:

```powershell
New-Item -ItemType Directory -Path build -Force | Out-Null
xelatex --disable-installer -interaction=nonstopmode -halt-on-error -output-directory=build poster.tex
xelatex --disable-installer -interaction=nonstopmode -halt-on-error -output-directory=build poster.tex
Copy-Item build\poster.pdf poster.pdf -Force
```

## Notes

The active poster uses an SMU/Gemini-inspired beamerposter layout in the required 90 cm x 150 cm portrait size. The source is organized as a compact driver plus section-level inputs under `sections/`. At the current revision, only the Introduction section is included in the rendered poster; Methods, DIC Results, AE/LN2 Results, Discussion, and Conclusions are split into separate files and intentionally commented out in `poster.tex`.

The take-home message band has been removed. Each IMRD&C section is now wrapped in an SMU-style colored block with a colored title bar and lightly tinted section background.

The scientific content is aligned with the paper's validation story and evidence boundaries, but it is rewritten as a standalone conference-presentation narrative rather than copied from the manuscript. The Introduction now uses natural poster prose rather than visible rhetorical labels; its schematic introduces the physical problem, corrugation-based strain-release mechanism, and integrity-verification logic without exposing the writing structure. The earlier Introduction table was removed because it repeated the same validation layers already shown in the visual logic.

The Methods section follows the requested logic chain: selected best-performing corrugated profile, patent-guided processing machine and specimen preparation, DIC for strain-release mechanism, AE for damage-evolution screening, and integrated membrane LN2 cycling. The page is intentionally figure-led and dense, with enlarged DIC/AE/LN2 panels and compact tables rather than blank bands.

The poster language intentionally keeps the evidence boundaries from the manuscript: DIC supports the strain-redistribution mechanism, AE supports cyclic activity ranking and inspection priority, and LN2 pressure-retention testing supports preliminary assembly integrity. The poster does not claim full LH2-temperature service qualification.

AI disclosure for workflow traceability: this poster source was prepared with AI assistance and should be reviewed by the authors before submission or printing.
