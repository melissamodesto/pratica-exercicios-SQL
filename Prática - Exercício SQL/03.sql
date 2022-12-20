/* -- Pergunta 01 */
SELECT COUNT("endDate") AS "currentExperiences" FROM experiences;

/* -- Pergunta 02 */
SELECT "userId" AS id, COUNT("userId") AS educations 
FROM educations 
GROUP BY "userId";

/* -- Pergunta 03 */
SELECT users.name AS writer, COUNT(*) AS "testimonialCount"
FROM testimonials t
JOIN users ON t."writerId" = users.id
WHERE users.id = 435
GROUP BY users.id;

/* -- Pergunta 04 */
SELECT 
    MAX(j.salary) AS "maximumSalary",
	r.name AS role
FROM jobs j
JOIN roles r ON j."roleId" = r.id
WHERE j.active = true
GROUP BY r.id
ORDER BY "maximumSalary" ASC;

/* --Desafios
-- Pergunta 01 */
SELECT 
	s.name AS school,
	c.name AS course,
	COUNT(e.id) AS "studentsCount",
	e.status
FROM educations e
	JOIN schools s ON e."schoolId" = s.id
	JOIN courses c ON e."courseId" = c.id
WHERE e.status = 'ongoing' OR e.status = 'finished'
GROUP BY s.id, c.id, e.id
ORDER BY "studentsCount" DESC
LIMIT 3;