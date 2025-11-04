{% test unique_combination_of_columns(model, columns) %}

with duplicates as (
    select
        {% for column in columns %}
            {{ column }}{% if not loop.last %},{% endif %}
        {% endfor %}
    from {{ model }}
    group by {% for column in columns %}
               {{ column }}{% if not loop.last %},{% endif %}
             {% endfor %}
    having count(*) > 1
)
select * from duplicates

{% endtest %}