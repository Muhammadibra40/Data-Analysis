

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM CovidDeaths
ORDER BY 1, 2;

SELECT *
FROM CovidDeaths

SELECT DISTINCT location
FROM CovidDeaths
WHERE continent IS NOT NULL

SELECT  location, 
		MAX(total_cases) AS Total_Cases, 
		MAX(total_deaths) AS "Total Deaths",
		population,
		(MAX(total_cases) / population) * 100 AS "Infection Percentage",
		(MAX(total_deaths) / MAX(total_cases)) * 100 AS "Death Percentage"
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY "Infection Percentage" DESC, "Death Percentage" DESC;

SELECT  continent, 
		MAX(total_cases) AS Total_Cases 
		--MAX(total_deaths) AS "Total Deaths",
		--population,
		--(MAX(total_cases) / population) * 100 AS "Infection Percentage",
		--(MAX(total_deaths) / MAX(total_cases)) * 100 AS "Death Percentage"
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
--ORDER BY "Infection Percentage" DESC, "Death Percentage" DESC;

SELECT  continent,
		location
FROM CovidDeaths
GROUP BY continent, location

SELECT  continent,
		MAX(total_deaths) AS "Total Deaths"
FROM CovidDeaths
WHERE continent IS NOT NULL 
GROUP BY continent
ORDER BY "Total Deaths";
		

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CovidDeaths';

ALTER TABLE CovidDeaths
ALTER COLUMN total_deaths FLOAT NULL;

SELECT  location,
		SUM(total_cases),
		SUM(new_Cases)
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY location;

ALTER VIEW population_view
AS
SELECT  DISTINCT location,
		population
FROM CovidDeaths
WHERE continent IS NOT NULL;

SELECT *
FROM population_view

SELECT  location,
		MAX(total_cases) as "max total cases"
FROM CovidDeaths
GROUP BY location
WHERE continent IS NOT NULL
ORDER BY  "max total cases" DESC;

ALTER TABLE CovidDeaths
ALTER COLUMN new_deaths INT NULL;

SELECT  SUM(new_cases) AS "World Total Cases",
		SUM(new_deaths) AS "World Total Deaths"
FROM CovidDeaths
WHERE continent IS NOT NULL
-----------------------------------------------------------------

SELECT * 
FROM CovidVaccinations

SELECT  continent,
		location,
		MIN(date)
FROM CovidVaccinations
WHERE people_vaccinated IS NOT NULL
AND continent IS NOT NULL
GROUP BY continent, location
ORDER BY MIN(date);

SELECT  continent,
		--location,
		MIN(date)
FROM CovidVaccinations
WHERE people_vaccinated IS NOT NULL
GROUP BY continent;

SELECT * 
FROM CovidVaccinations

SELECT  continent,
		location,
		MIN(date)
FROM CovidVaccinations
WHERE new_vaccinations IS NOT NULL
AND continent IS NOT NULL
GROUP BY continent, location
ORDER BY MIN(date);

SELECT *
FROM CovidDeaths cd
JOIN CovidVaccinations cv
ON cd.location = cv.location
AND cd.date = cv.date