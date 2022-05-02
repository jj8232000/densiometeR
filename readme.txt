READ ME:
densiometeR - documentation and changelog

Who is this for?
- Anyone who wants to experiment with pulling canopy density from images

REQUIREMENTS:
- Windows OS - designed for Windows with built in Shell scripts
- FFMPEG - for pre-processing videos (https://www.youtube.com/watch?v=IECI72XEox0)
- R, RStudio, and RTools - for importing packages (https://cran.r-project.org/bin/windows/Rtools/rtools40.html)
		To install packages used in the R script, run: install.packages("package_name") in the R terminal

- This program is a heuristic approach to densiometer readings in the field.
To save time in the field and potentially those entering the data later, I tried my hand at digital processing.

This primarily uses R, but I'll be using ImageJ to pre-process the images into hemispheres, and potentially Shell/FFMpeg to handle batch processing
The foundational package is "countcolors" which I'm suggesting can be used for canopy density calculations.
To approximate canopy cover, I set a range of colors (white to sky blue) to be detected and quantified as NON-canopy % of the overall image.

Further testing is in order to determine optimal balance of accuracy and efficiency. Bottom line is that benthic macroinvertebrate sampling densiometer readings
simply do not demand the precision that more involved researchers with smaller data sets may need. As spherical crown densiometer readings are already heavily
prone to human error, any error on the computer part is likely to be far more accurate than a personal estimation



Literature found after original determinations with similar methods
https://www.azandisresearch.com/2019/02/03/analyzing-hemispherical-photos/