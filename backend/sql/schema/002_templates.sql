-- +goose Up
-- shift templates table stores  recurring time blocks
CREATE TABLE shift_templates (
    id BIGSERIAL PRIMARY KEY,
    week_day SMALLINT NOT NULL CHECK (week_day BETWEEN 0 AND 6),
    start_time TIME,
    end_time TIME,
    label TEXT NOT NULL,
    is_active BOOLEAN DEFAULT true,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- stores head count defaults per template 
CREATE TABLE template_roles (
    template_id BIGINT NOT NULL
                REFERENCES shift_templates (id) ON DELETE CASCADE,
    role role NOT NULL,
    default_needed SMALLINT NOT NULL CHECK (default_needed >= 0),
    PRIMARY KEY (template_id, role)
);

-- +goose Down
DROP TABLE IF EXISTS template_roles;
DROP TABLE IF EXISTS shift_templates;
