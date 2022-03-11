--Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students` .`name`,`students`.`surname`, `degrees`.`name`
FROM `students` 
JOIN `degrees`
ON`degrees` .`id`= `students`.`degree_id`
WHERE`degrees`.`name`= 'Corso di Laurea in Economia'

-- Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT `degrees`.`name`, `departments`.`name`
FROM `degrees`
JOIN `departments`
ON `departments`.`id`= `degrees`.`department_id`
WHERE `departments`.`name` = 'Dipartimento di Neuroscienze';


--  Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `courses`.`name`, `teachers`.`surname`, `teachers`.`name`
FROM `courses`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`teacher_id`
JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`
WHERE `teachers`.`id` = '44';


--  Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.`surname`, `students`.`name`, `degree_id`, `degrees`.`name`, `departments`.`name`
FROM `students` 
JOIN `degrees`
ON `students`.`degree_id` = `degrees`.`id`
JOIN `departments`
ON `departments`.`id` = `degrees`.`department_id`
ORDER BY `students`.`surname` , `students`.`name`;


--  Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT *
FROM `degrees`
JOIN `courses`
ON `degrees`.`id` = `courses`.`id` 
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `course_teacher`.`course_id` = `teachers`.`id`;


--  Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT `teachers`.*, `departments`.`name` 
FROM `departments` 
JOIN `degrees` 
ON `departments`.`id` = `degrees`.`department_id` 
JOIN `courses` 
ON `degrees`.`id` = `courses`.`degree_id` 
JOIN `course_teacher` 
ON `courses`.`id` = `course_teacher`.`course_id` 
JOIN `teachers` 
ON `teachers`.`id` = `course_teacher`.`teacher_id` 
WHERE `departments`.`name` = 'Dipartimento di Matematica';
