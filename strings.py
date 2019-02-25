CRASH_DATA_URL = "https://data.cityofchicago.org/resource/85ca-t3if.json"

f_target = ["hit_and_run"]

f_dummy = ["year", "month", "dow", "hour", "beat", "street"]

f_binary = ["intersection_related", "dooring", "work_zone"]

f_cont = [
    "posted_speed_limit",
    "lane_count",
    "num_units",
    "injuries_fatal",
    "injuries_incapacitating",
    "injuries_no_indication",
    "injuries_non_incapacitating",
    "injuries_reported_not_evident",
]

f_categor = [
    "alignment",
    "contributory_cause",
    "device_condition",
    "first_crash_type",
    "most_severe_injury",
    "lighting_condition",
    "road_defect",
    "roadway_surface_cond",
    "traffic_control_device",
    "trafficway_type",
    "weather_condition",
]

f_other = ["longitude", "latitude"]

feature_names = ["i"] + f_target + f_dummy + f_binary + f_cont + f_categor + f_other

weekday_order = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
