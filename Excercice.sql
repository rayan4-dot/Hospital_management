`1. CRUD Operations : Insérer un nouveau patient:`
INSERT INTO patients (first_name, last_name, gender, date_of_birth, phone_number, email, address)
VALUES
(1,'John', 'Doe', 'Male', '1985-06-15', '123-456-7890', 'john.doe@example.com', '123 Elm St')


`2. SELECT Statement : Récupérer tous les départements:`
SELECT * FROM departements

`3. ORDER BY Clause : Trier les patients par date de naissance.`
SELECT * FROM patients
ORDER BY date_of_birth;

`4. Filtrer les patients uniques par sexe (DISTINCT).`
SELECT DISTINCT gender FROM patients

`LIMIT Clause : Obtenir les 3 premiers médecins.`
SELECT * FROM doctors
LIMIT 3;

`6. WHERE Clause : Patients nés après 2000.`
SELECT * FROM patients
WHERE date_of_birth > '2000-01-01';

`7. Logical Operators : Médecins dans des départements spécifiques.`
SELECT * FROM doctors
WHERE departement_id IN (1, 2);

`8. Special Operators : Vérifier des plages de dates.`
SELECT * FROM admissions
WHERE admission_date BETWEEN '2024-12-03' AND '2024-12-05';

`9. Conditional Expressions : Nommer les catégories d'âge des patients `
SELECT *, 
CASE
 WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) < 18 THEN 'Child'
  WHEN TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE()) >= 18 AND TIMESTAMPDIFF(YEAR, date_of_birth, 
  CURDATE()) < 65 THEN 'Adult' 
  ELSE 'Senior' 
  END AS age_category 
  FROM patients;

  `10. Aggregate Functions : Nombre total de rendez-vous Comptez le nombre total de rendez-vous enregistrés`
  SELECT COUNT(*) AS total_appointments 
  FROM appointments;

  `11. COUNT avec GROUP BY : Nombre de médecins par département Comptez le nombre de médecins dans chaque département.`
  SELECT departement_id, COUNT(*) AS total_doctors 
  FROM doctors 
  GROUP BY departement_id;

  `12. AVG : Âge moyen des patients Calculez l'âge moyen des patients.`
  SELECT AVG(TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE())) AS average_age 
  FROM patients;

  `13. MAX : Dernier rendez-vous Trouvez la date et l'heure du dernier rendez-vous enregistré.`
SELECT MAX(appointment_date) AS last_appointment
FROM appointments;

`14. SUM : Total des admissions par chambre Calculez le total des admissions pour chaque chambre.`
SELECT room_id, SUM(admission_count) AS total_admissions
FROM (
  SELECT room_id, COUNT(*) AS admission_count
  FROM admissions
  GROUP BY room_id
) AS admission_counts;

`15. Constraints : Vérifier les patients sans e-mail Récupérez tous les patients dont le champ email est vide.`
SELECT * FROM patients
WHERE email IS NULL;

`16. Jointure : Liste des rendez-vous avec noms des médecins et patients Récupérez les rendez-vous avec les noms des médecins et des patients.`
SELECT 
    a.appointment_id, 
    a.appointment_date, 
    d.first_name AS doctor_first_name, 
    d.last_name AS doctor_last_name,
    p.first_name AS patient_first_name,
    p.last_name AS patient_last_name
FROM 
    appointments a
JOIN 
    doctors d ON a.doctor_id = d.doctor_id
JOIN
    patients p ON a.patient_id = p.patient_id;

`17. DELETE : Supprimer les rendez-vous avant 2024 Supprimez tous les rendez-vous programmés avant 2024.`
DELETE FROM appointments
WHERE appointment_date < '2024-01-01';

`18. UPDATE : Modifier un département Changez le nom du département "Oncology" en "Cancer Treatment".`
UPDATE departements
SET departement_name = 'Cancer Treatment'
WHERE departement_name = 'Oncology';

`19. HAVING Clause : Patients par sexe avec au moins 2 entrées Listez les genres ayant au moins deux patients.`

`20. Créer une vue : Admissions actives Créez une vue listant toutes les admissions en cours.`
CREATE VIEW simple_admissions AS
SELECT admission_id, patient_id
FROM admissions;

