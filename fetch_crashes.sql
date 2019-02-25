SELECT
    date_extract_y(crash_date) AS year,
    date_extract_m(crash_date) AS month,
    date_extract_dow(crash_date) AS dow,
    date_extract_hh(crash_date) AS hour,
    beat_of_occurrence AS beat,
    street_direction || ' ' || street_name AS street,
    CASE(hit_and_run_i == 'Y', 1, TRUE, 0) AS hit_and_run,
    CASE(intersection_related_i == 'Y', 1, TRUE, 0) AS intersection_related,
    CASE(dooring_i == 'Y', 1, TRUE, 0) AS dooring,
    CASE(work_zone_i == 'Y', 1, TRUE, 0) AS work_zone,
    posted_speed_limit,
    lane_cnt AS lane_count,
    num_units,
    injuries_fatal,
    injuries_incapacitating,
    injuries_non_incapacitating,
    injuries_reported_not_evident,
    injuries_no_indication,
    most_severe_injury,
    traffic_control_device,
    device_condition,
    weather_condition,
    lighting_condition,
    first_crash_type,
    trafficway_type,
    alignment,
    roadway_surface_cond,
    road_defect,
    CASE(
        prim_contributory_cause IS NOT NULL,
        prim_contributory_cause,
        sec_contributory_cause IS NOT NULL,
        sec_contributory_cause) AS contributory_cause,
    longitude,
    latitude
WHERE
    crash_date <= date_police_notified
    AND date_extract_y(crash_date) >= 2016
    AND crash_date IS NOT NULL
    AND beat_of_occurrence IS NOT NULL
    AND street_name IS NOT NULL
    AND posted_speed_limit >= 0
    AND lane_cnt >= 0 AND lane_cnt <= 12
    AND num_units >= 0
    AND injuries_fatal >= 0
    AND injuries_incapacitating >= 0
    AND injuries_non_incapacitating >= 0
    AND injuries_reported_not_evident >= 0
    AND injuries_no_indication >= 0
    AND longitude < 0
    AND latitude > 0
LIMIT 1000000