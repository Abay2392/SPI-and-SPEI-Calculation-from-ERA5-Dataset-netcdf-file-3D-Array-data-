# SPI-and-SPEI-Calculation-from-ERA5-Dataset-netcdf-file-3D-Array-data-
MATLAB functions for calculating Standardized Precipitation Index (SPI) and Standardized Precipitation Evapotranspiration Index (SPEI) for drought assessment.
# SPI and SPEI Drought Indices in MATLAB

This repository contains MATLAB codes for computing and analyzing drought conditions using the Standardized Precipitation Index (SPI) and the Standardized Precipitation Evapotranspiration Index (SPEI).

## Repository Structure

### Core Functions

#### SPImod.m

MATLAB function for computing the Standardized Precipitation Index (SPI) at different accumulation periods using a gamma distribution fitting approach.

#### spei.m

MATLAB function for computing the Standardized Precipitation Evapotranspiration Index (SPEI) based on climatic water balance (Precipitation − Potential Evapotranspiration) and log-logistic distribution fitting.

### Application Scripts

#### compute_SPI_Sicily.m

Complete workflow for computing SPI over Sicily using precipitation datasets. The script performs data preparation, SPI calculation, and drought analysis.

#### Computed_SPEI.m

Complete workflow for computing SPEI over Sicily using precipitation and potential evapotranspiration datasets. The script performs climatic water balance calculation, SPEI estimation, and drought characterization.

## Drought Indices

### Standardized Precipitation Index (SPI)

SPI is a widely used meteorological drought index based solely on precipitation anomalies. It allows drought conditions to be monitored at multiple time scales.

### Standardized Precipitation Evapotranspiration Index (SPEI)

SPEI incorporates both precipitation and atmospheric evaporative demand through potential evapotranspiration, making it particularly suitable for drought assessments under climate change conditions.

## Applications

The codes can be applied to:

* Meteorological drought monitoring
* Agricultural drought assessment
* Climate variability analysis
* Drought early warning systems
* Drought trend detection
* Climate change impact studies

## Files Included

```text
compute_SPI_Sicily.m
Computed_SPEI.m
SPImod.m
spei.m
```

## Author

Dr. Tagele Mossie Aschale

## Acknowledgements

The SPI implementation is based on work by Taesam Lee (INRS-ETE, Quebec, Canada).

The SPEI implementation is based on work by José Delgado and Wolfgang Schwanghart (University of Potsdam).

## License

This repository is provided for research, educational, and non-commercial applications.

