CREATE TABLE T1 (
    Id SERIAL, -- SERIAL - auto-incrementing integer
    Date DATE NOT NULL,
    Sum DECIMAL(10, 2) NOT NULL, -- DECIMAL is an alias for NUMERIC
    State INT NOT NULL, -- mapping for separate enum table
    OperationId UUID NOT NULL,
    Message JSONB NOT NULL DEFAULT '{}'::jsonb, -- for now let's leave empty as default
    PRIMARY KEY (Id, Date)
) PARTITION BY RANGE (Date);

CREATE TABLE T1_june2025 PARTITION OF T1
    FOR VALUES FROM ('2025-06-01') TO ('2025-07-01'); -- FROM, TO)

CREATE TABLE T1_july2025 PARTITION OF T1
    FOR VALUES FROM ('2025-07-01') TO ('2025-08-01');

CREATE TABLE T1_august2025 PARTITION OF T1
    FOR VALUES FROM ('2025-08-01') TO ('2025-09-01');

CREATE TABLE T1_september2025 PARTITION OF T1
    FOR VALUES FROM ('2025-09-01') TO ('2025-10-01');