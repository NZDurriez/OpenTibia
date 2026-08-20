-- Starter accounts for local testing.
-- Passwords are stored as SHA1, matching The Forgotten Server login check.

INSERT INTO `accounts` (`id`, `name`, `password`, `type`, `email`) VALUES
(1, '1', SHA1('1'), 1, 'player@localhost'),
(2, 'god', SHA1('god'), 6, 'god@localhost')
ON DUPLICATE KEY UPDATE
	`password` = VALUES(`password`),
	`type` = VALUES(`type`);

INSERT INTO `players` (
	`name`, `group_id`, `account_id`, `level`, `vocation`,
	`health`, `healthmax`, `experience`, `looktype`, `town_id`,
	`cap`, `sex`, `mana`, `manamax`
) VALUES
('Player', 1, 1, 8, 0, 185, 185, 4200, 128, 1, 470, 1, 90, 90),
('God', 6, 2, 2, 0, 150, 150, 100, 75, 1, 400, 1, 0, 0)
ON DUPLICATE KEY UPDATE
	`group_id` = VALUES(`group_id`),
	`account_id` = VALUES(`account_id`);
