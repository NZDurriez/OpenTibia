-- Starter accounts for local testing.
-- Passwords are SHA1. Protocol 13.10 HTTP login looks up `email`, not `name`,
-- so email is set to the same value you type in the client (1 / god).

INSERT INTO `accounts` (`id`, `name`, `password`, `type`, `email`) VALUES
(1, '1', SHA1('1'), 1, '1'),
(2, 'god', SHA1('god'), 6, 'god')
ON DUPLICATE KEY UPDATE
	`password` = VALUES(`password`),
	`type` = VALUES(`type`),
	`email` = VALUES(`email`);

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
