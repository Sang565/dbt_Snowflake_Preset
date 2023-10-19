select re.listing_id, re.review_date, li.created_at
from {{ ref('fct_reviews') }} re
join {{ ref('dim_listings_cleansed')}} li
    on re.listing_id = li.listing_id
where li.created_at >= re.review_date 
limit 10

/* --- solution ----
SELECT * FROM {{ ref('dim_listings_cleansed') }} l
INNER JOIN {{ ref('fct_reviews') }} r
USING (listing_id)
WHERE l.created_at >= r.review_date 
*/