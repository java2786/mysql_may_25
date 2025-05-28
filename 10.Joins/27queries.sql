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


-- Show the title of each book together with the title of its adaptation and the year of the adaptation release. Show all books, regardless of whether they had adaptations.


select b.title as book, ad.title as adaptation, ad.release_year from books b
left join adaptations ad
on b.id = ad.book_id;


select b.title as book, ad.title as adaptation, ad.release_year from adaptations ad
right join books b
on b.id = ad.book_id;




-- Show all books with their movie adaptations. Select each book's title, the name of its publishing house, the title of its adaptation, and the type of the adaptation. Keep the books with no adaptations in the result.


select 
    b.title as book, 
    b.publishing_house, 
    ad.title as adaptation, 
    ad.type 
from books b
left join adaptations ad
    on b.id = ad.book_id
where 
ad.type = 'movie' or ad.type is NULL;


select 
    b.title as book, 
    b.publishing_house, 
    ad.title as adaptation, 
    ad.type 
from adaptations ad
right join books b
    on b.id = ad.book_id;



-- group by
select 
    count(b.title), ad.type 
from books b
left join adaptations ad
    on b.id = ad.book_id
group by ad.type;