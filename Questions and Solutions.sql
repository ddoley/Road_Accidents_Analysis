        ***PROBLEM STATEMENT WITH SOLUTIONS***

--1.Find out the Current year Casualties
  Ans:
     select sum(number_of_casualties) as CY_Casualties
     from accidents
     where extract(year from accident_date)='2022'
 
--2.Find out the Currenrt Year Casualties based on Road Conditions
  Ans:
     select sum(number_of_casualties) as CY_Casualties
     from accidents
     where extract(year from accident_date)='2022' and road_surface_conditions='Dry'

-- 3.Find out the Current year Accidents
  Ans:
	 select count(distinct accident_index) as CY_Accidents
	 from accidents
	 where extract(year from accident_date)='2022'
	 
 -- 4.What is the Current Year Casualties for  Serious Accident Severity?
  Ans:
     select sum(number_of_casualties) as CY_Casualties
     from accidents
     where extract(year from accident_date)='2022' and accident_severity='Serious'
  
-- 5.What is the Current Year Casualties for  Slight Accident Severity?
 Ans:
    select sum(number_of_casualties) as CY_Casualties
    from accidents
    where extract(year from accident_date)='2022' and accident_severity='Slight'
  
 -- 6.What is the Current Year Casualties for  Fatal Accident Severity?
 Ans:
    select sum(number_of_casualties) as CY_Casualties
    from accidents
    where extract(year from accident_date)='2022' and accident_severity='Fatal'
 -- 7.Find out the Current Year Casualties for different Road Types
 Ans:
    select road_type,sum(number_of_casualties) as CY_Casualties
    from accidents
    where extract(year from accident_date)='2022'
    group by road_type
    order by CY_Casualties desc
   
 -- 8.Fins out the Total Casualties for Urban and Rural Areas
 Ans:
    select urban_or_rural_area as UoR,sum(number_of_casualties) as total,
    sum(number_of_casualties)*100/(select sum(number_of_casualties) from accidents where extract(year from accident_date)='2022') as percentage
    from accidents
    where extract(year from accident_date)='2022'
    group by UoR
   
-- 9.Find out the Total Casualties for for Day and Dark(Light_Conditions) 
 Ans:
    select 
	  case 
	     when light_conditions in ('Daylight') then 'Day'
		 when light_conditions in ('Darkness - lighting unknown','Darkness - lights lit','Darkness - lights unlit','Darkness - no lighting') then 'Dark'
		 end as Light_Group,
		 cast(sum(number_of_casualties) as decimal(10,2)),
		 cast(sum(number_of_casualties)*100/(select sum(number_of_casualties) from accidents) as decimal(10,2)) as percentage
		 from accidents
		 group by
	  case 
	     when light_conditions in ('Daylight') then 'Day'
		 when light_conditions in ('Darkness - lighting unknown','Darkness - lights lit','Darkness - lights unlit','Darkness - no lighting') then 'Dark'
		 end 
		   
   
 --10.Find out the Current Year Casualties for various Vehicle Type.
 Ans:
    select
      case
	     when vehicle_type in ('Agricultural vehicle') then 'Agricultural'
		 when vehicle_type in ('Car','Taxi/Private hire car') then 'Car'
		 when vehicle_type in ('Motorcycle 122c and under','Motorcycle 55cc and under','Motorcycle over 122cc and upto 500cc','Motorcycle over 500cc','Pedal cycle') then 'Bike'
		 when vehicle_type in ('Goods 7.5 tonnes mgw and over','Goods over 3.5t. and under 7.5t','Van/Goods 3.5 tonnes mgw or under') then 'Van'
		 when vehicle_type in ('Bus or coach (17 or more pass seats)','Minibus (8-16 passenger seats)') then 'Bus'
	     else 'Others'
	   end as vehicle_group,
	   sum(number_of_casualties) as CY_Casualties
	   from accidents
       where extract(year from accident_date)='2022'	
	   group by 
	 case
	     when vehicle_type in ('Agricultural vehicle') then 'Agricultural'
		 when vehicle_type in ('Car','Taxi/Private hire car') then 'Car'
		 when vehicle_type in ('Motorcycle 122c and under','Motorcycle 55cc and under','Motorcycle over 122cc and upto 500cc','Motorcycle over 500cc','Pedal cycle') then 'Bike'
		 when vehicle_type in ('Goods 7.5 tonnes mgw and over','Goods over 3.5t. and under 7.5t','Van/Goods 3.5 tonnes mgw or under') then 'Van'
		 when vehicle_type in ('Bus or coach (17 or more pass seats)','Minibus (8-16 passenger seats)') then 'Bus'
	     else 'Others'
	   end 

-- 11.Find out the monthly Trend of Casualties for 2022
 Ans:
    select extract(month from accident_date) as months ,sum(number_of_casualties) as CY_Casualties
    from accidents
	where extract(year from accident_date)='2022'
    group by months
		  
-- 12.Find out the monthly Trend of Casualties for 2021
 Ans:
    select extract(month from accident_date) as months ,sum(number_of_casualties) as PY_Casualties
	from accidents
	where extract(year from accident_date)='2021'
	group by months
		  
		  
		
   
  
  
  

  
  
  
