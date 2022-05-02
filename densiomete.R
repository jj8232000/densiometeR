## Spherical Crown Densiometer mimic ##
#library(this.path)
library(jpeg)
library(purrr)
library(countcolors)
library(magick)

# Designates path and working directory of images
#full_path <- dirname(this.path()) %>% # designates path to repo
  #setwd()
#system("filepath.bat", show.output.on.console = FALSE) # runs filepath, querying user with file dialog
#imagedir <- choose.dir(default = "", caption = "Select image directory") %>% # file dialog. default setting sets base directory to choose from; can specify further if necessary
#setwd()

example_img <- file.choose(new = FALSE) # saves path as a string via file dialog
processed_img <- readJPEG(example_img) # converts file in path to a pure color map

# RGB approximation to % out of 255
white <- c(1, 1, 1) # 255, 255, 255
sky_blue <- c(.529, .808, .922) # 135, 206, 235
grey <- c(.5, .5, .5) # 128, 128, 128
dark_grey <- c(.663, .663, .663) # 169, 169, 169
light_grey <- c(.827, .827, .827) # 211, 211, 211
black <- c(0, 0, 0) # 0, 0, 0
light_green <- c(.565, 0.933, .565) # 144, 238, 144

# Converts 3-channel RGB image to a 2-channel bilateral image
#test_img <- image_read(example_img) %>%
#  image_convert(type = 'Bilevel') -> test_img
#readJPEG(test_img) 

# Quantifies number of pixels in image that correspond to the sky and takes it as a fraction of 100
canopy.negative <- countColors(example_img, center = c(white, sky_blue), radius = c(0.4, 0.40), plotting = TRUE, target.color = c("red", "blue"))
canopy.negative$pixel.fraction
