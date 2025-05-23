-- Show student name and score using subqueries
select  e.score, (select name from Students s where student_id = e.student_id) as std_name from Exam_scores e;

-- Show student name and score using join
select e.score, s.name from Exam_scores e right join Students s on s.student_id = e.student_id;



-- Show student name, subject name and score using subqueries
select  e.score, (select name from Students s where student_id = e.student_id) as std_name, (select subject_name from Subjects where subject_id = e.subject_id) as sub_name from Exam_scores e;


-- Show student name, subject name and score using join
-- homework

