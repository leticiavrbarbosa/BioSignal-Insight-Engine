CREATE TABLE IF NOT EXISTS subjects (
    subject_id  VARCHAR PRIMARY KEY,
    notes       TEXT
);

CREATE TABLE IF NOT EXISTS  physiological_signals (
    id      SERIAL PRIMARY KEY,
    subject_id  VARCHAR REFERENCES subjects(subject_id),
    time_recorded   TIMESTAMPTZ NOT NULL,
    ecg     FLOAT, 
    eda     FLOAT, -- electrodermal activity (stress marker)
    resp    FLOAT, -- respiration 
    temp    FLOAT -- skin temperature 
);

CREATE TABLE IF NOT EXISTS  subject_states (
    id  SERIAL PRIMARY KEY,
    subject_id VARCHAR REFERENCES subjects(subject_id),
    start_time  TIMESTAMPTZ,
    end_time    TIMESTAMPTZ,
    state_label VARCHAR -- 'baseline', 'stress', 'amusement'
);