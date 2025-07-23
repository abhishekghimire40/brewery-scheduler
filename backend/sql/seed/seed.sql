
BEGIN;

TRUNCATE TABLE template_roles  RESTART IDENTITY CASCADE;
TRUNCATE TABLE shift_templates RESTART IDENTITY CASCADE;

----------------------------------------------------------------
-- 1. Shift templates
INSERT INTO shift_templates (id, weekday, start_time, end_time, label)
VALUES
-- Monday (0)
( 1, 0, '11:00', '15:00', 'Mon Lunch'),
( 2, 0, '15:00', '23:00', 'Mon Dinner'),

-- Tuesday (1)
( 3, 1, '11:00', '15:00', 'Tue Lunch'),
( 4, 1, '15:00', '23:00', 'Tue Dinner'),

-- Wednesday (2)
( 5, 2, '11:00', '15:00', 'Wed Lunch'),
( 6, 2, '15:00', '23:00', 'Wed Dinner'),

-- Thursday (3)
( 7, 3, '11:00', '15:00', 'Thu Lunch'),
( 8, 3, '15:00', '23:00', 'Thu Dinner'),

-- Friday (4)
( 9, 4, '11:00', '15:00', 'Fri Lunch'),
(10, 4, '15:00', '23:00', 'Fri Dinner'),

-- Saturday (5)
(11, 5, '11:00', '15:00', 'Sat Lunch'),
(12, 5, '15:00', '23:00', 'Sat Dinner'),

-- Sunday (6)
(13, 6, '12:00', '16:00', 'Sun Lunch'),
(14, 6, '16:00', '22:00', 'Sun Dinner');

----------------------------------------------------------------
-- 2. Role head-counts
--    template_id  role                default_needed
----------------------------------------------------------------
INSERT INTO template_roles (template_id, role, default_needed) VALUES
-- Mon Lunch  ---------------------------------------------------
( 1, 'host',             1),
( 1, 'server',           2),
( 1, 'food_runner',      1),
( 1, 'bartender_north',  1),
( 1, 'kitchen_line',     4),

-- Mon Dinner ---------------------------------------------------
( 2, 'host',             1),
( 2, 'server',           3),
( 2, 'food_runner',      1),
( 2, 'bartender_north',  1),
( 2, 'bartender_south',  1),
( 2, 'cocktailer',       1),
( 2, 'kitchen_line',     5),

-- Tue Lunch ----------------------------------------------------
( 3, 'host',             1),
( 3, 'server',           2),
( 3, 'food_runner',      1),
( 3, 'bartender_north',  1),
( 3, 'kitchen_line',     4),

-- Tue Dinner ---------------------------------------------------
( 4, 'host',             1),
( 4, 'server',           3),
( 4, 'food_runner',      1),
( 4, 'bartender_north',  1),
( 4, 'bartender_south',  1),
( 4, 'cocktailer',       1),
( 4, 'kitchen_line',     5),

-- Wed Lunch ----------------------------------------------------
( 5, 'host',             1),
( 5, 'server',           2),
( 5, 'food_runner',      1),
( 5, 'bartender_north',  1),
( 5, 'kitchen_line',     4),

-- Wed Dinner ---------------------------------------------------
( 6, 'host',             1),
( 6, 'server',           3),
( 6, 'food_runner',      1),
( 6, 'bartender_north',  1),
( 6, 'bartender_south',  1),
( 6, 'cocktailer',       1),
( 6, 'kitchen_line',     5),

-- Thu Lunch ----------------------------------------------------
( 7, 'host',             1),
( 7, 'server',           2),
( 7, 'food_runner',      1),
( 7, 'bartender_north',  1),
( 7, 'kitchen_line',     4),

-- Thu Dinner ---------------------------------------------------
( 8, 'host',             1),
( 8, 'server',           3),
( 8, 'food_runner',      1),
( 8, 'bartender_north',  1),
( 8, 'bartender_south',  1),
( 8, 'cocktailer',       1),
( 8, 'kitchen_line',     5),

-- Fri Lunch ----------------------------------------------------
( 9, 'host',             1),
( 9, 'server',           3),
( 9, 'food_runner',      1),
( 9, 'bartender_north',  1),
( 9, 'kitchen_line',     5),

-- Fri Dinner ---------------------------------------------------
(10, 'host',             1),
(10, 'server',           4),
(10, 'food_runner',      2),
(10, 'bartender_north',  1),
(10, 'bartender_south',  1),
(10, 'cocktailer',       1),
(10, 'kitchen_line',     6),

-- Sat Lunch ----------------------------------------------------
(11, 'host',             1),
(11, 'server',           3),
(11, 'food_runner',      1),
(11, 'bartender_north',  1),
(11, 'kitchen_line',     5),

-- Sat Dinner ---------------------------------------------------
(12, 'host',             1),
(12, 'server',           4),
(12, 'food_runner',      2),
(12, 'bartender_north',  1),
(12, 'bartender_south',  1),
(12, 'cocktailer',       1),
(12, 'kitchen_line',     6),

-- Sun Lunch ----------------------------------------------------
(13, 'host',             1),
(13, 'server',           2),
(13, 'food_runner',      1),
(13, 'bartender_north',  1),
(13, 'kitchen_line',     4),

-- Sun Dinner ---------------------------------------------------
(14, 'host',             1),
(14, 'server',           3),
(14, 'food_runner',      1),
(14, 'bartender_north',  1),
(14, 'bartender_south',  1),
(14, 'cocktailer',       1),
(14, 'kitchen_line',     5);

COMMIT;
