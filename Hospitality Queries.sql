-- Total Revenue
select sum(revenue_generated) as Total_revenue
from fact_bookings;
-- Total Bookings
select count(booking_id) as Total_Bookings
from fact_bookings;
-- Occupancy Rate
select (sum(successful_bookings)/sum(capacity))*100 As Occupancy
from fact_aggregated_bookings;
-- Utilize Capacity
select sum(capacity) as Utilize_Capacity
from fact_aggregated_bookings;
-- Cancellation rate
select 
(count(case when booking_status = "cancelled" then 1 end)/count(booking_id))*100 as Cancellation_rate
from fact_bookings;
-- Monthly trend
select	dim_date.`mmm yy` as Week,sum(fact_bookings.revenue_generated) as Revenue
from dim_date
inner join fact_bookings on dim_date.date=fact_bookings.booking_date
group by `mmm yy`;
-- city wise revenue
select dim_hotels.property_name as Hotels,sum(fact_bookings.revenue_realized) as Revenue
from dim_hotels
inner join fact_bookings on dim_hotels.property_id=fact_bookings.property_id
group by dim_hotels.property_name;
-- Class wise Revenue
select dim_rooms.room_class As Room_Class,sum(fact_bookings.revenue_generated) As Revenue
from dim_rooms
inner join fact_bookings on dim_rooms.room_id=fact_bookings.room_category
group by dim_rooms.room_class;
-- checked out cancel no show
select booking_status,sum(revenue_generated) as Revenue,count(booking_id) as Bookings
from fact_bookings
group by booking_status;
-- Weekly key
select dim_date.`week no` As Week_No,sum(fact_bookings.revenue_generated) as Revenue,count(fact_bookings.booking_id) As Bookings
from dim_date
inner join fact_bookings on dim_date.date=fact_bookings.booking_date
group by `week no`;
-- weekday and weekend revenue and bookings
select dim_date.day_type,sum(fact_bookings.revenue_generated) as Revenue,count(fact_bookings.booking_id) as Bookings
from dim_date
inner join fact_bookings on dim_date.date=fact_bookings.booking_date
group by day_type;