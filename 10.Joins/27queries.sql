select name, title, publish_year from authors a
join books
on a.id = author_id

-- Show the name of each author together with the title of the book they wrote and the year in which that book was published. Show only books published after 2005.


select a.name, b.title, b.publish_year from authors a
join books b
on b.author_id = a.id
where b.publish_year > 1860
;



-- Show Books Adapted Within 50 Years and Rated Lower Than the Adaptation rating


select b.title, b.publish_year, ad.release_year, b.rating as b_rating, ad.rating as ad_rating from books b
join adaptations ad

on b.id = ad.book_id

where ad.release_year - b.publish_year <= 200
and b.rating < ad.rating;



