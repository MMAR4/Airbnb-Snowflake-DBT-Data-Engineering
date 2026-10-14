{% macro tag(col) %}
  CASE 
    WHEN {{col}} < 100 THEN 'low' 
    WHEN {{col}} < 200 THEN 'medium' 
    ELSE 'high'
  END 
{% endmacro %}

  {# {% if col < 100 %}
    low
  {% elif col < 200 %}  
    medium 
  {% else %}
    high
  
  {% endif %} #}