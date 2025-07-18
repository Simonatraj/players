-- Finds Jackie Robinson’s hometown, including city, state, and country.
SELECT "birth_city", "birth_state", "birth_country" FROM "players" WHERE "first_name" = 'Jackie' AND "last_name" = 'Robinson';

-- Finds which side (left or right) Babe Ruth used to hit.
SELECT "bats" FROM "players" WHERE "first_name" = 'Babe' AND "last_name" = 'Ruth';

-- Finds the IDs of players with missing debut dates.
SELECT "id" FROM "players" WHERE "debut" IS NULL;

-- Lists the first and last names of players not born in the United States, sorted alphabetically.
SELECT "first_name", "last_name" FROM "players"
WHERE "birth_country" != 'USA'
ORDER BY "first_name", "last_name";

-- Lists the first and last names of right-handed batters, sorted alphabetically.
SELECT "first_name", "last_name" FROM "players" WHERE "bats" = 'R' ORDER BY "first_name", "last_name";

-- Lists players born in Pittsburgh, PA, with debut dates, sorted by debut date and name.
SELECT "first_name", "last_name", "debut" FROM "players"
WHERE "birth_state" = 'PA' AND "birth_city" = 'Pittsburgh'
ORDER BY "debut" DESC, "first_name", "last_name";

-- Counts players who bat and throw with opposite hands (left/right or right/left).
SELECT COUNT("id") FROM "players"
WHERE ("bats" = 'R' AND "throws" = 'L') OR ("bats" = 'L' AND "throws" = 'R');

-- Calculates the average height and weight of players who debuted in or after 2000.
SELECT ROUND(AVG("height"), 2) AS "Average Height", ROUND(AVG("weight"), 2) AS "Average Weight" FROM "players"
WHERE "debut" >= '2000-01-01';

-- Lists players whose final MLB game was in 2022, sorted alphabetically.
SELECT "first_name", "last_name" FROM "players"
WHERE "final_game" LIKE '%2022%'
ORDER BY "first_name", "last_name";

-- Custom query using WHERE, ORDER BY, and column renaming with AS.
SELECT "first_name", "last_name" FROM "players" AS "Older than 1996, last debuted in the team"
WHERE "birth_year" > 1996
ORDER BY "debut" DESC
LIMIT 5;
