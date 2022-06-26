CREATE TABLE animals (
    animal_id SERIAL PRIMARY KEY,
    animal_name VARCHAR(20),
    species VARCHAR(40),
    weight INTEGER NOT NULL,
    had_shots BOOLEAN
);

CREATE TABLE applicants (
    applicant_id SERIAL PRIMARY KEY,
    applicant_name VARCHAR(40),
    app_completed BOOLEAN,
    fav_pet VARCHAR REFERENCES animals(animal_name)
);

CREATE TABLE application (
    application_id SERIAL PRIMARY KEY,
    applicant_name VARCHAR REFERENCES applicants(applicant_name),
    animal_name varchar(40),
    phone INTEGER NOT NULL (10),
    email VARCHAR(40),
    had_shots REFERENCES animals(had_shots)
);

CREATE TABLE approved_applicaitons(
    applicant_name REFERENCES applicants(applicant_id),
    application_id REFERENCES application(application_id)
    adopted REFERENCES applicants(fav_pet),
    date_adopted TIMESTAMP,
    contact_info REFERENCES application(phone, email)
);