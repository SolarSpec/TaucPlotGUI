<div id="top"></div>

<!-- PROJECT SHIELDS -->
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]



<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://github.com/SolarSpec/TaucPlotGUI">
    <img src="TaucPlotGUI_resources/logo.png" alt="SolarSpec" width="160" height="120">
  </a>

<h3 align="center">Tauc Plot GUI</h3>

  <p align="center">
    A Graphical User Interface for calculating bandgap energies and visualizing Direct Allowed and Indirect Allowed transition Tauc plots
    <br />
    <a href="https://github.com/SolarSpec/TaucPlotGUI"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/SolarSpec/TaucPlotGUI">View Demo</a>
    ·
    <a href="https://github.com/SolarSpec/TaucPlotGUI/issues">Report Bug</a>
    ·
    <a href="https://github.com/SolarSpec/TaucPlotGUI/issues">Request Feature</a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

[![Tauc Screenshot][product-screenshot]](https://solarspec.ok.ubc.ca/)
An interactive GUI that allows for an input of absorption data to yield indirect and direct transition Tauc plots, giving subsequent bandgap energies

<p align="right">(<a href="#top">back to top</a>)</p>



### Built With

* [MATLAB](https://www.mathworks.com/products/matlab.html)
* [Image Processing Toolbox](https://www.mathworks.com/help/images/)
* [Curve Fitting Toolbox](https://www.mathworks.com/help/curvefit/)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- GETTING STARTED -->
## Getting Started

To begin using this app is very simple. Just verify you have the necessary prequisites and follow the installation instructions.

### Prerequisites

Make sure MATLAB is installed. It is available for download in the Software Distribution section under the Help tab after you log into [Canvas.](https://canvas.ubc.ca/)
Click on the "Add-Ons" dropdown menu of your MATLAB Home screen. Then click on "Manage Add-Ons" and ensure you have the Image Processing Toolbox and the Signal Processing Toolbox. If not, click on "Get Add-Ons" button instead and search for the aforementioned products.


### Installation

1. Clone the repo to your PC
   ```sh
   git clone https://github.com/SolarSpec/TaucPlotGUI.git
   ```
2. Install the application 
   ```
   Click on the .mlappinstall file in your repository to open and install in MATLAB
   ```
3. Browse the APPS header
   ```
   You will find the recently installed application and can add it to your favourites
   ```

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

Expert Scientist Guidelines for Band Gap Estimation:
If multiple band gaps are observed, estimate band gap using the Tauc regions that explains 
higher proportion of Tauc property change.


In cases where a clear baseline is not observed but a trend for transition between the baseline 
and the absorption tail is observed, estimate band gap using best approximation of baseline.


Do not estimate a band gap when neither a clear baseline nor a trend for transition between the 
baseline and the absorption tail are observed.


Do not estimate band gap when only a lower limit of the band gap energy can be determined (due 
to the absorption transient extending beyond the high-energy limit of the spectrometer).

<!-- Here is a simple example of the app used on a small dataset. The filtering is turned on and we'd like to export all the kinetics data by clicking the "Export CSV Data" button. We can view where the file was saved in the text on the left panel and can then open the CSV file to view the data.

_Please note that the bottom of each CSV contains an extra row of information attributed to the BackgroundLevel data of each TDMS file. This is simply a convention to carry this data if it is loaded back into the PIAS app. If one does not intend to load it back into the app, you may delete this row or store the variables somewhere else in the CSV as to not lose it for future use._

  <div class="row">
    <img src="PIASpectra_resources/ExportButton.png" alt="Export">
  </div>
  <div class="row" style="float:left">
    <img src="PIASpectra_resources/TopCSV.png" alt="Top" style="width:50%;height:50%;padding: 5px"><img src="PIASpectra_resources/BottomCSV.png" alt="Bottom" style="width:50%;height:50%;padding: 5px">
  </div>


_For more information on data filtering and decimation, please refer to the [Documentation](https://www.mathworks.com/help/signal/ref/decimate.html#d123e21788)_ -->

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ROADMAP -->
## Roadmap

- [X] Plot absorbtion vs. wavelength
  - [X] Use ROI lines to cut data at certain wavelengths
- [X] Calculate subsequent DA and IA data
- [X] Plot and fit DA and IA Tauc plots
- [X] Calculate subsequent bandgap energies
- [X] View possible issues with fit through code table

See the [open issues](https://github.com/SolarSpec/TaucPlotGUI/issues) for a full list of proposed features (and known issues).

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- LICENSE -->
## License

MATLAB code distributed under the BSD 3-Clause License. See `LICENSE.txt` for more information. Please note that the MARS method used both in MATLAB and the accompanying python files exhibits public works from NREL/HTEM that is under Copyright 2017 Alliance for Sustainable Energy, LLC. See `LICENSE.txt` in the NREL-HTEM directory for more information. 

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- CONTACT --
## Contact

SolarSpec - [SolarSpec Website](https://solarspec.ok.ubc.ca/) - vidihari@student.ubc.ca

Project Link: [https://github.com/SolarSpec/TaucPlotGUI](https://github.com/SolarSpec/TaucPlotGUI)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Group Leader - Dr. Robert Godin](https://solarspec.ok.ubc.ca/people/)
* [Santosh Suram](https://pubs.acs.org/doi/abs/10.1021/acscombsci.6b00053)
* [The Entire SolarSpec Team](https://solarspec.ok.ubc.ca/people/)

<p align="right">(<a href="#top">back to top</a>)</p>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/SolarSpec/TaucPlotGUI.svg?style=for-the-badge
[contributors-url]: https://github.com/SolarSpec/TaucPlotGUI/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/SolarSpec/TaucPlotGUI.svg?style=for-the-badge
[forks-url]: https://github.com/SolarSpec/TaucPlotGUI/network/members
[stars-shield]: https://img.shields.io/github/stars/SolarSpec/TaucPlotGUI.svg?style=for-the-badge
[stars-url]: https://github.com/SolarSpec/TaucPlotGUI/stargazers
[issues-shield]: https://img.shields.io/github/issues/SolarSpec/TaucPlotGUI.svg?style=for-the-badge
[issues-url]: https://github.com/SolarSpec/TaucPlotGUI/issues
[license-shield]: https://img.shields.io/github/license/SolarSpec/TaucPlotGUI.svg?style=for-the-badge
[license-url]: https://github.com/SolarSpec/TaucPlotGUI/blob/main/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/haris-vidimlic-06730019b/
[product-screenshot]: TaucPlotGUI_resources/Screenshot.png