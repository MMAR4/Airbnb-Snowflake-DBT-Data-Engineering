# Source Data

This directory contains the three source CSV datasets used in the Airbnb Data Engineering Pipeline.

## Files

- **Bookings CSV** — Contains booking-related records and attributes.
- **Hosts CSV** — Contains host information and attributes.
- **Listings CSV** — Contains property listing details and attributes.

## Usage

These datasets serve as the source data for the pipeline. In the implemented workflow, the files are stored in Amazon S3 and loaded into Snowflake staging tables before being transformed using dbt.

These local CSV copies are provided for data inspection and reference.

## Notes

- Verify the dataset's licence and redistribution terms before sharing.
- Do not include credentials or sensitive information.
- Column names and file contents should match the source tables expected by the dbt project.
