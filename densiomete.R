## Spherical Crown Densiometer mimic ##
library(jpeg)
library(purrr)
library(countcolors)
library(magick)
library(imager)
library(this.path)

# RGB approximation to % out of 255
white <- c(1, 1, 1) # 255, 255, 255
sky_blue <- c(.529, .808, .922) # 135, 206, 235
grey <- c(.5, .5, .5) # 128, 128, 128
dark_grey <- c(.663, .663, .663) # 169, 169, 169
light_grey <- c(.827, .827, .827) # 211, 211, 211
black <- c(0, 0, 0) # 0, 0, 0
light_green <- c(.565, 0.933, .565) # 144, 238, 144

counter <- 1 # sets a counter to keep track of iterations...distasteful solution

# Designates path and working directory of images
full_path <- dirname(this.path()) # designates path to repo
polar_path <- file.path(full_path, "polarpath", fsep = "/") %>% # creates child path at polarized image directory
  setwd() # sets working directory to path above
image_path <- choose.dir(default= "", caption = "Select image directory") # saves image path as a string via file dialog
datalist <- list() # creates empty list to store data in


# # polar projection attempt 1
# sample_img <- file.choose(new = FALSE)
# processed_img <- image_read(sample_image) # reads image in from previosuly designated path
# polar_img <- image_distort(processed_img, "Polar", c(0), bestfit = TRUE) # maps from cartesian to polar coordinates
# image_write(polar_img, file.path(full_path, "imagepath/sample.png", fsep = "/"), format = "PNG") # saves image as png


# # polarity projection attempt 2
# sample_img <- file.choose(new = FALSE)
# processed_img <- load.image(sample_img) # loads sample image 
# processed_img <- mirror(load.image(example_img), "y")
# map_shift <- function(x, y) {
# list(
#     x = y * cos((x - 200) / 400 * 2 * pi) / 2 + 200,
#     y = y * sin((x - 200) / 400 * 2 * pi) / 2 + 200
#     )
# }
# polar_img <- imwarp(processed_img, map = map_shift)
# plot(polar_img)


# # 3 channel RGB to 2 channel bilateral
# sample_img <- file.choose(new = FALSE) # designates path to image
# processed_image <- image_read(sample_img) %>% # reads sample image to R
# image_convert(type = 'Bilevel') -> bilateral_img # converts 3 channel RGB image to a 2 channel bilateral image

setwd(image_path)
files <- list.files(pattern = "\\.jpg$", full.names = FALSE, recursive = FALSE) # creates list of files in polarpath

# recursive generation of canopy quantification

for(i in files){
  # processed_img <- image_read(files[counter]) # reads image in from previosuly designated path
  # polar_img <- image_distort(processed_img, "Polar", c(0), bestfit = TRUE) # maps from cartesian to polar coordinates
  # image_write(polar_img, file.path(imagepath, files(counter), fsep = "/"), format = "PNG") # saves image as png
    # Quantifies number of pixels in image that correspond to the sky and takes it as a fraction of 100
    canopy_negative <- countColors(files[counter], center = c(white, sky_blue), radius = c(0.4, 0.4), plotting = TRUE, target.color = c("red", "blue")) # takes 40% of RGB radius around white and skyblue
    canopy_negative$pixel.fraction -> datalist[[i]] # adds fractional value to datalist
    counter <- counter + 1 # advances counter
}

finaldata <- cbind(files, datalist) # adds names of images next to fraction
setwd(full_path) # designates path as program directory
write.table((finaldata),"densiometerlog.csv", sep = ",", col.names = FALSE, row.names = FALSE) # writes data to Excel table