{{
  config(
    materialized='incremental',
    unique_key='booking_id'
    )
   
}}

SELECT 
  booking_id,
  listing_id,
  booking_date,
  {{multiply('nights_booked','booking_amount',2)}}  AS Total_Booking_Amount,
  cleaning_fee,
  service_fee,
  booking_status,
  created_at
FROM {{ref('bronze_bookings')}}