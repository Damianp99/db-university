-- Selezionare tutti gli studenti nati nel 1990 (160)
SELECT `surname`, `name`, `date_of_birth` AS 'year_of_birth'
FROM `students`
WHERE YEAR(`date_of_birth`) = '1990';

-- Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT `cfu`, `name` AS 'cfu_over_10' 
FROM `courses` 
WHERE `cfu` > 10;

--  Selezionare tutti gli studenti che hanno più di 30 anni
SELECT `name`, TIMESTAMPDIFF(YEAR,`date_of_birth`,CURDATE()) AS `age`
FROM `students`
WHERE TIMESTAMPDIFF(YEAR,`date_of_birth`,CURDATE()) > 30;

-- Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT `period`, `year`
FROM `courses`
WHERE `period` = 'I semestre' AND `year` = 1;

-- Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT `date`, `hour`
FROM `exams`
WHERE `date` = '2020-06-20' AND `hour` >= '14:00:00';

-- Selezionare tutti i corsi di laurea magistrale (38)
SELECT `name`, `level`
FROM `degrees`
WHERE `level` = 'magistrale';

-- Da quanti dipartimenti è composta l'università? (12)
SELECT COUNT(*)
FROM `departments`

-- Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT `surname`, `name`, `phone`
FROM `teachers`
WHERE `phone` IS NULL;


---------------------------------------------------------------------
-- GROUP BY

-- Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(*) AS `students`, YEAR(`enrolment_date`) AS 'year'
FROM `students`  
GROUP BY YEAR(`enrolment_date`);

-- Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(*) AS `teachers`, `office_address` AS 'same address'
FROM `teachers`  
GROUP BY `office_address`

-- Calcolare la media dei voti di ogni appello d'esame
SELECT `exam_id`, AVG(`vote`) AS 'avarage_votes'
FROM `exam_student`  
GROUP BY `exam_id`;

-- Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(*) AS 'total_courses', `department_id`
FROM `degrees`
GROUP BY `department_id`;
