{% set congigs = [
  {
    "table" : "AIRBNB.SILVER.SILVER_BOOKINGS",
    "columns" : "SILVER_BOOKINGS.*",
    "alias" : "SILVER_BOOKINGS"
  },
  {
    "table" : "AIRBNB.SILVER.SILVER_LISTINGS",
    "columns" : "SILVER_LISTINGS.PROPERTY_TYPE, SILVER_LISTINGS.ACCOMMODATES,	SILVER_LISTINGS.ROOM_TYPE,	SILVER_LISTINGS.CITY,	SILVER_LISTINGS.COUNTRY,	SILVER_LISTINGS.BEDROOMS,	SILVER_LISTINGS.BATHROOMS, SILVER_LISTINGS.PRICE_PER_NIGHT,	SILVER_LISTINGS.PRICE_PER_NIGHT_TAG, LISTING_CREATED_AT",
    "alias" : "SILVER_LISTINGS",
    "join_condition" : "SILVER_BOOKINGS.listing_id = SILVER_LISTINGS.listing_id"
  },
  {
    "table" : "AIRBNB.SILVER.SILVER_HOSTS",
    "columns" : "SILVER_HOSTS.HOST_ID,SILVER_HOSTS.IS_SUPERHOST,SILVER_HOSTS.HOST_NAME, SILVER_HOSTS.HOST_SINCE, SILVER_HOSTS.RESPONSE_RATE,	SILVER_HOSTS.RESPONSE_RATE_QUALITY,	SILVER_HOSTS.CREATED_AT AS CREATED_AT_HOSTS",
    "alias" : "SILVER_HOSTS",
    "join_condition" : "SILVER_LISTINGS.HOST_ID = SILVER_HOSTS.HOST_ID" 
  }

]
%}

SELECT 
  {% for config in congigs %}
    {{ config['columns'] }} {% if not loop.last %}, {% endif %}
  {% endfor %}
FROM 
  {% for config in congigs %}
    {% if loop.first %}
      {{config['table']}} AS {{config['alias']}}
    {% else %}
      LEFT JOIN {{config['table']}} AS {{config['alias']}}
      ON {{config['join_condition']}}
    
    {% endif %}
  {% endfor %}