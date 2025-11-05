{% macro margin_percent(revenue, purchase_cost, macro_var=2) %}
    ROUND(SAFE_DIVIDE({{ revenue }} - {{ purchase_cost }}, {{ revenue }}),{{ macro_var }})
{% endmacro %}