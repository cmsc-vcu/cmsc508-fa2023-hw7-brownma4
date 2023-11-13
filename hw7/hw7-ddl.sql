# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;

# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    skills_id int NOT NULL,
    skills_name varchar(255) NOT NULL,
    skills_description varchar(255) NOT NULL,
    skills_tag varchar(255),
    skills_url varchar(255),
    skills_time_commitment int,
    PRIMARY KEY (skills_id)
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (skills_id, skills_name, skills_description, skills_tag, skills_url, skills_time_commitment) values
  (1, 'Minecraft speedrunning', '<5 min runs only', 'Skill 1', 'https://minecraftSpeedrun.com', 300),
  (2, 'Competitive hotdog eating', '50+ dogs in under 1 hour', 'Skill 2', 'https://hotdogs.gov', 8000),
  (3, 'Sleeping with eyes open', '0-0', 'Skill 3', 'https://imtired.com', 3),
  (4, 'Petting cats', 'meow', 'Skill 4', 'https://cats.com', 99999),
  (5, 'Procrastinating', 'description goes here', 'Skill 5', 'https://notnow.com', 50),
  (6, 'Time travel', 'Only doctors can do it', 'Skill 6', 'https://tardis.com', 900),
  (7, 'Making pancakes', 'I always burn them :(', 'Skill 7', 'https://pancakes.com', 0),
  (8, 'Walking with socks on', 'Create a barrier between the floor', 'Skill 8', 'https://minecraftSpeedrun.com', 15);

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id INT NOT NULL,
    first_name VARCHAR(256),
    last_name VARCHAR(256) NOT NULL,
    email VARCHAR(256),
    linkedin_url VARCHAR(256),
    headshot_url VARCHAR(256),
    discord_handle VARCHAR(256),
    brief_bio TEXT,
    date_joined DATE NOT NULL,
    PRIMARY KEY (people_id)
);


# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (people_id, first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined) values
  (1, 'Bob', 'Person 1', 'bob@email.com', 'https://www.linkedin.com/in/bob', 'https://photo.com/bob.jpg', 'bob#1234', 'Bob is cool', '2014-11-09'),
  (2, 'Wade', 'Person 2', 'wade@email.com', 'https://www.linkedin.com/in/wade', 'https://photo.com/wade.jpg', 'wade#5678', 'Wade is epic', '2012-04-21'),
  (3, 'Mark', 'Person 3', 'mark@email.com', 'https://www.linkedin.com/in/mark', 'https://photo.com/mark.jpg', 'mark#9101', 'Mark is talented', '2020-02-27'),
  (4, 'Jack', 'Person 4', 'jack@email.com', 'https://www.linkedin.com/in/jack', 'https://photo.com/jack.jpg', 'jack#1122', 'Jack is tall', '2019-07-11'),
  (5, 'Gab', 'Person 5', 'gab@email.com', 'https://www.linkedin.com/in/gab', 'https://photo.com/gab.jpg', 'gab#3344', 'Gab is sweet', '2022-06-22'),
  (6, 'Bea', 'Person 6', 'bea@email.com', 'https://www.linkedin.com/in/bea', 'https://photo.com/bea.jpg', 'bea#5566', 'Bea is old', '2022-11-13'),
  (7, 'Patrick', 'Person 7', 'patrick@email.com', 'https://www.linkedin.com/in/patrick', 'https://photo.com/patrick.jpg', 'patrick#5566', 'Patrick is old', '2022-11-17'),
  (8, 'Samson', 'Person 8', 'Samson@email.com', 'https://www.linkedin.com/in/samson', 'https://photo.com/samson.jpg', 'bea#5566', 'Samson is strong', '2021-12-30'),
  (9, 'Luke', 'Person 9', 'luke@email.com', 'https://www.linkedin.com/in/luke', 'https://photo.com/luke.jpg', 'bea#5566', 'Luke is adventurous', '2002-05-12'),
  (10, 'Obi-wan', 'Person 10', 'obi-wan@email.com', 'https://www.linkedin.com/in/obi-wan', 'https://photo.com/obi-wan.jpg', 'kenobi#5566', 'Obi-wan is wise', '2000-01-01');

# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    id INT AUTO_INCREMENT PRIMARY KEY,
    skills_id INT NOT NULL,
    people_id INT NOT NULL,
    date_acquired DATE NOT NULL,
    FOREIGN KEY (skills_id) REFERENCES skills(skills_id),
    FOREIGN KEY (people_id) REFERENCES people(people_id)
);



# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
INSERT INTO peopleskills (skills_id, people_id, date_acquired) values
  (1, 1, '2015-7-17'), (3, 1, '2017-01-14'), (6, 1, '2019-01-31'),
  (3, 2, '2023-10-21'), (4, 2, '2018-02-19'), (5, 2, '2010-07-01'),
  (1, 3, '2019-11-11'), (5, 3, '2013-03-29'),
  (3, 5, '2005-12-24'), (6, 5, '2016-05-26'),
  (2, 6, '2002-09-27'), (3, 6, '2018-06-03'), (4, 6, '2007-04-01'),
  (3, 7, '2003-01-18'), (5, 7, '2006-07-02'), (6, 7, '2002-06-01'),
  (1, 8, '2009-02-19'), (3, 8, '2005-08-07'), (5, 8, '2000-08-01'), (6, 8, '2002-10-02'),
  (2, 9, '2010-08-20'), (5, 9, '2007-09-09'), (6, 9, '2009-07-01'),
  (1, 10, '2022-03-31'), (4, 10, '2007-10-17'), (5, 10, '2006-11-01');


# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(256) NOT NULL,
    sort_priority INT NOT NULL
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (name, sort_priority) VALUES
  ('Designer', 10),
  ('Developer', 20),
  ('Recruit', 30),
  ('Team Lead', 40),
  ('Boss', 50),
  ('Mentor', 60);


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    people_id INT NOT NULL,
    role_id INT NOT NULL,
    date_assigned DATE NOT NULL,
    FOREIGN KEY (people_id) REFERENCES people(people_id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_id, role_id, date_assigned) VALUES
  (1, 2, '2023-01-01'),
  (2, 5, '2023-02-01'),
  (2, 6, '2023-02-01'),
  (3, 2, '2023-03-01'),
  (3, 4, '2023-03-01'),
  (4, 3, '2023-04-01'),
  (5, 3, '2023-05-01'),
  (6, 2, '2023-06-01'),
  (6, 1, '2023-06-01'),
  (7, 1, '2023-07-01'),
  (8, 1, '2023-08-01'),
  (8, 4, '2023-08-01'),
  (9, 2, '2023-09-01'),
  (10, 2, '2023-10-01'),
  (10, 1, '2023-10-01');

