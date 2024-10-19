SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CovidDeaths'


-- Table 1

SELECT  SUM(new_cases) as "Total Cases", 
		SUM(new_deaths) as "Total Deaths", 
		SUM(new_deaths)/SUM(New_Cases)*100 as "Death Percentage"
FROM CovidDeaths
WHERE continent is not null 
ORDER BY 1,2;


-- Table 2

SELECT  location, 
		SUM(new_deaths) as "Total Death Count"
FROM CovidDeaths
WHERE continent is null 
and location not in ('World', 'European Union', 'International')
GROUP BY location
ORDER BY "Total Death Count" desc;

-- Table 3

SELECT  location, 
		Population, 
		MAX(total_cases) as "Highest Infection Count",  
		Max((total_cases/population))*100 as "Percent Population Infected"
FROM CovidDeaths
GROUP BY Location, Population
ORDER BY "Percent Population Infected" DESC;

-- Table 4

SELECT  Location, 
		Population,date, 
		MAX(total_cases) as "Highest Infection Count",  
		Max((total_cases/population))*100 as "Percent Population Infected"
FROM CovidDeaths
GROUP BY Location, Population, date
ORDER BY "Percent Population Infected" DESC;