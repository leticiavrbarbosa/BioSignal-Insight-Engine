from loader import load_wesad
from sqlalchemy import create_engine
import os
from dotenv import load_dotenv

load_dotenv()
engine = create_engine(os.getenv("DATABASE_URL"))

X, y = load_wesad()
print("in ingest.py")

X.to_sql("physiological_signals", engine, if_exists="replace", index=False)
y.to_sql("subject_states", engine, if_exists="replace", index=False)

print("Ingestion complete.")