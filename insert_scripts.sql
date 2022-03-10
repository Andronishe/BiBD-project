use bookstores_aggregator;
insert t_gamestores(name, `web-site`)
VALUES ('steam', 'https://store.steampowered.com/?l=russian'),
       ('epic games store', 'https://www.epicgames.com/store/ru/'),
       ('microsoft store', 'https://www.microsoft.com/ru-by/store/games/windows?icid=CatNavWindowsGames'),
       ('warp', 'https://warp.by/'),
       ('ps store', 'https://www.playstation.com/ru-ru/'),
       ('digital house', 'https://digitalhouse.by/'),
       ('origin', 'https://www.origin.com/rus/en-us/store'),
       ('gamestore', 'https://gamestore.by/');


insert t_games_authors(company, email)
VALUES ('ubisoft', 'ubisoft@gmail.com'),
       ('rockstar games', 'rockstar@gmail.com'),
       ('electronic arts', 'electronic@gmail.com'),
       ('Valve Corporation', 'Valve@gmail.com'),
       ('besethda', 'besethda@gmail.com'),
       ('sony', 'sony@gmail.com'),
       ('mojang', 'mojang@gmail.com');


insert t_game_category(category)
VALUES ('shooter'),
       ('sport'),
       ('strategy'),
       ('adventure'),
       ('arcade'),
       ('stealth-action');


insert t_games(author_id, title, publish_date, category)
VALUES (3, 'mass effect 2', '2012-01-09', 1),
       (5, 'skyrim', '2009-07-25', 5),
       (6, 'dark souls', '2013-01-27', 5),
       (1, 'assains creed 4', '2005-04-05', 6),
       (3, 'fifa 22', '2021-09-21', 2),
       (2, 'gta 5 ', '2014-23-02', 1),
       (4, 'zelda', '2005-05-12', 3),
       (4, 'half-life1', '2007-07-07', 1),
       (4, 'half-life alyx', '2020-08-23', 1),
       (7, 'minecraft', '2013-03-19', 4),
       (2, 'rdr 2', '2019-12-12', 1),
       (3, 'forza 14', '2016-04-16', 2),
       (4, 'portal 2', '2013-06-09', 4),
       (2, 'l.a. noire', '2010-01-23', 4),
       (3, 'hitman 3', '2018-09-13', 6),
       (6, 'journey', '2015-11-07', 4),
       (6, 'the last of us', '2014-06-05', 4),
       (1, 'far cry 3', '2013-10-01', 1),
       (3, 'NFS mv', '2004-07-14', 2);

-- 8 магазинов
-- 19 игр

insert t_gamestore_games(store_id, game_id, count, price)
VALUES (2, 12, 54, 100),
       (3, 1, 67, 95),
       (5, 2, 50, 90),
       (2, 14,12, 30),
       (3, 4, 10, 25),
       (1, 16, 42, 60),
       (6, 5, 70, 45),
       (7, 3, 30, 20),
       (7, 18, 2, 150),
       (8, 6, 12, 125),
       (6, 11, 20, 35),
       (1, 9, 3, 15),
       (1, 5, 11, 10),
       (5, 19, 27, 10),
       (2, 18, 33, 30),
       (2, 11, 65, 40),
       (2, 3, 8, 30),
       (3, 9, 60, 90),
       (3, 16, 23, 45),
       (3, 12, 4, 5),
       (4, 13, 20, 110),
       (4, 16, 50, 139),
       (4, 3, 32, 99),
       (4, 10, 12, 45),
       (5, 5, 76, 30),
       (5, 13, 18, 59),
       (6, 19, 8, 24),
       (6, 10, 15, 32),
       (7, 8, 2, 64),
       (7, 15, 12, 43),
       (8, 14, 41, 33),
       (8, 17, 5, 160);