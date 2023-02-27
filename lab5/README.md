# Computer Vision Lab 5
## Isaac Bergl (22710992)

### Approach
My approach was to firstly convert the image to a HSV image and consider each pixel induvidually. The user can select a lower and upper threshold which will specifify the allowed range of hue values for each pixel. If the lower bound is above the upper bound the range will wrap around the hue spectrum. The hue range is displayed above the sliders.

Additionally if the saturation value is smaller than 0.05 the pixel will be ignored and classified as being outside the allowed range as this is too bright.

For iris and coloured pepper extraction bounds for the saturation and brightness were introduced, however these do not affect the original tasks of the lab.

### Iris Segmentation
The values used for iris segmentation were

- 0.44 < H < 0.64

### Green Pepper Segmentation
The values used for green pepper segmentation were

- 0.15 < H < 0.44

### Skin Segmentation
For skin segmentation, a boolean application state variable was introduced to dictate whether to limit the saturation value when considering a pixel. To detect skin the user clicks the segment skin button which will specify a hue range as well as a saturation range using the following ranges:

- 0 < H < 0.138 
- 0.1 < S < 0.38 

which is loosely based on the results of [this paper](https://arxiv.org/ftp/arxiv/papers/1708/1708.02694.pdf#:~:text=The%20hue%20component%20in%20HSV,3%2F4%2C%200.5).) but also from experimentation.

### Intruction

To run, open the containing folder in matlab and double click on the *.mlapp file. Then click the run button to run the application.