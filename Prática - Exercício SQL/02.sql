/* --Pergunta 01 */
SELECT users.id, users.name, cities.name AS "city" 
FROM cities 
JOIN users ON cities.id = users."cityId" ;

/* --Pergunta 02 */
SELECT testimonials.id, t1.name AS "writer", t2.name AS "recipient", testimonials.message 
FROM testimonials 
JOIN users t1 ON testimonials."writerId" = t1.id 
JOIN users t2 ON testimonials."recipientId" = t2.id ;

/* --Pergunta 03 */
SELECT educations.id, users.name, courses.name AS "course", schools.name AS "school", educations."endDate" 
FROM educations 
JOIN users ON educations."userId" = users.id 
JOIN courses ON educations."courseId"=courses.id 
JOIN schools ON educations."schoolId"=schools.id 
WHERE users.id = 30 AND educations.status='finished' ;

/* --Pergunta 04 */
SELECT users.id, users.name, roles.name, companies.name, experiences."startDate" 
FROM experiences 
JOIN users ON experiences."userId"= users.id 
JOIN roles ON experiences."roleId" = roles.id 
JOIN companies ON experiences."companyId"=companies.id 
WHERE users.id=50 AND experiences."endDate" IS NULL ;