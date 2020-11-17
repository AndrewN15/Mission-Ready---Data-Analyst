select age, avg(age) over () as x_bar,
       total_claim_amount, avg(total_claim_amount) over () as y_bar
from newpolicy;

select sum((age - x_bar) * (age - y_bar)) / sum((age - x_bar) * (age - x_bar)) as slope
from (
    select age, avg(age) over () as x_bar,
           total_claim_amount, avg(total_claim_amount) over () as y_bar
    from newpolicy) s;


select slope, 
       y_bar_max - x_bar_max * slope as intercept 
from (
    select sum((age - x_bar) * (total_claim_amount - y_bar)) / sum((age - x_bar) * (age - x_bar)) as slope,
           max(x_bar) as x_bar_max,
           max(y_bar) as y_bar_max    
    from (
        select age, avg(age) over () as x_bar,
              total_claim_amount, avg(total_claim_amount) over () as y_bar
        from newpolicy) s
        )s;
    



