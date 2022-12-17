--Finding the number of countries in the dataset
SELECT COUNT(DISTINCT country_name)
FROM GlobalPollution;

--Finding the distinct regions in the dataset
SELECT COUNT(DISTINCT region_id)
FROM GlobalPollution;

--Top 5 highest populated countries
SELECT country_name
FROM GlobalPollution
ORDER BY population_population_number_of_people DESC
LIMIT 5;

--Least 5 populated countries
SELECT country_name
FROM GlobalPollution
ORDER BY population_population_number_of_people ASC
LIMIT 5;

--Top 5 highest gdp countries
SELECT country_name
FROM GlobalPollution
ORDER BY gdp DESC
LIMIT 5;

--Least 5 highest gdp countries
SELECT country_name
FROM GlobalPollution
ORDER BY gdp ASC
LIMIT 5;

--Which country is producing more food waste 
SELECT country_name,MAX(composition_food_organic_waste_percent)
FROM GlobalPollution
WHERE composition_food_organic_waste_percent != 'NA';

--Which country producing the most composition_glass_percent
SELECT country_name,MAX(composition_glass_percent)
FROM GlobalPollution
WHERE composition_glass_percent != 'NA';

--Which countries producing the most composition_metal_percent
SELECT country_name,MAX(composition_metal_percent)
FROM GlobalPollution
WHERE composition_metal_percent != 'NA';

--which country is best at recycling the waste
SELECT country_name,MAX(waste_treatment_recycling_percent) as Recycling_Percentage
FROM GlobalPollution
WHERE waste_treatment_recycling_percent != 'NA';

--Which country is producing more hazardous waste and what is the recycling percentage 
SELECT country_name,
		MAX(special_waste_hazardous_waste_tons_year) as Hazard_Waste_in_Tons,
		round((MAX(special_waste_hazardous_waste_tons_year)/sum(special_waste_hazardous_waste_tons_year))*100,2) as Contribution_Percentage
FROM GlobalPollution
WHERE special_waste_hazardous_waste_tons_year!='NA' and waste_treatment_recycling_percent != 'NA';

--Which is contributing more agricultural waste 
SELECT region_id ,sum(special_waste_agricultural_waste_tons_year)
FROM GlobalPollution
WHERE special_waste_agricultural_waste_tons_year != 'NA'
GROUP BY region_id
ORDER BY special_waste_agricultural_waste_tons_year DESC
LIMIT 1;





