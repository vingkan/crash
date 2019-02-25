import requests
import pandas as pd
from strings import CRASH_DATA_URL, feature_names, f_categor


def clean_text(val):
    return val.casefold().replace(" ", "_")


query_file = "fetch_crashes.sql"
out_file = "crashes_data.csv"

query_source = open(query_file, "r")
query = query_source.read()
query_source.close()

print("Querying dataset...")
r = requests.get(CRASH_DATA_URL, params={"$query": query})
rows = r.json()
data = pd.DataFrame(rows).dropna()
data["i"] = data.index

print("Returned {} rows from query.".format(len(rows)))
print("Retained {} rows after dropping nulls.".format(len(data)))
assert len(feature_names) == len(
    data.columns
), "Returned {} columns. Expected {}.".format(len(data.columns), len(feature_names))

cleaned = data.copy()
cleaned[f_categor] = cleaned[f_categor].apply(lambda val: val.apply(clean_text))
cleaned.to_csv(out_file, index=False)
print("Data saved to {}".format(out_file))
