-- users table:
id (uuid, primary key)
email (text, unique)
cv_text (text)
cv_vector (vector(1536))  -- OpenAI embedding dimension
cv_hash (text)
skills (jsonb)
experience_level (text)
preferences (jsonb)
created_at (timestamp)
updated_at (timestamp)
active (boolean)


-- jobs table:
id (uuid, primary key)
job_id_hash (text, unique)
source (text)
title (text)
company (text)
description (text)
job_vector (vector(1536))
requirements (jsonb)
salary (jsonb)
location (text)
url (text)
posted_date (date)
scraped_at (timestamp)


-- matches table:
id (uuid, primary key)
user_id (uuid, foreign key)
job_id (uuid, foreign key)
score (float)
sent_at (timestamp)
clicked (boolean)
applied (boolean)