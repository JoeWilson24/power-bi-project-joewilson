SELECT SUM(staff_numbers) AS TotalStaffUK
FROM dim_stores
WHERE Country = 'United Kingdom';