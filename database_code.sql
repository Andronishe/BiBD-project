create database gamestores_aggregator;

create table t_game_category
(
    id       int auto_increment
        primary key,
    category varchar(255) not null,
    constraint t_book_categories_name_uindex
        unique (category),
    constraint t_game_categories_id_uindex
        unique (id)
);

create table t_games_authors
(
    id      int auto_increment
        primary key,
    company varchar(100) not null,
    email   varchar(100) not null,
    constraint t_book_authors_email_uindex
        unique (email),
    constraint tb_id_unique
        unique (id)
)
    charset = utf8;

create table t_games
(
    id           int auto_increment
        primary key,
    author_id    int           not null,
    title        varchar(100)  not null,
    publish_date date          not null,
    category     int default 1 not null,
    constraint tb_id_unique
        unique (id),
    constraint t_books_author_id_fk
        foreign key (author_id) references t_games_authors (id)
            on update cascade on delete cascade,
    constraint t_games_category_id_fk
        foreign key (category) references t_game_category (id)
            on update cascade on delete cascade
)
    charset = utf8;

create index t_books_publish_date_index
    on t_games (publish_date);

create index t_book_authors_firstname_lastname_index
    on t_games_authors (company);

create table t_gamestores
(
    id         int auto_increment
        primary key,
    name       varchar(100) not null,
    `web-site` varchar(60)  null,
    constraint tbs_id_unique
        unique (id)
)
    charset = utf8;

create table t_gamestore_games
(
    id       int auto_increment
        primary key,
    store_id int                        not null,
    game_id  int                        not null,
    count    int                        not null,
    price    decimal(5, 2) default 0.00 not null,
    constraint t_bookstore_books_store_id_book_id_uindex
        unique (store_id, game_id),
    constraint tbs_id_unique
        unique (id),
    constraint t_bookstore_books_book_id_fk
        foreign key (game_id) references t_games (id)
            on update cascade on delete cascade,
    constraint t_bookstore_books_store_id_fk
        foreign key (store_id) references t_gamestores (id)
            on update cascade on delete cascade
)
    charset = utf8;

create table t_users
(
    idu      int auto_increment
        primary key,
    login    varchar(20) not null,
    password varchar(20) not null,
    constraint t_users_login_uindex
        unique (login)
);

create table t_gamestore_sold_games
(
    id          int auto_increment
        primary key,
    store_id    int                        not null,
    game_id     int                        not null,
    price       decimal(5, 2) default 0.00 null,
    status      bit           default b'0' not null,
    insert_date date                       not null,
    update_date date                       not null,
    user_id     int                        null,
    constraint tbs_id_unique
        unique (id),
    constraint t_bookstore_sold_store_id_books_id_fk
        foreign key (game_id) references t_games (id),
    constraint t_bookstore_sold_store_id_fk
        foreign key (store_id) references t_gamestores (id)
            on delete cascade,
    constraint t_gamestore_sold_games_user_id_fk
        foreign key (user_id) references t_users (idu)
            on delete cascade
)
    charset = utf8;

create index t_bookstore_sold_books_status_index
    on t_gamestore_sold_games (status);

create index t_bookstore_sold_books_update_date_index
    on t_gamestore_sold_games (update_date);

create definer = root@localhost trigger t_bookstore_sold_books_before_insert
    before insert
    on t_gamestore_sold_games
    for each row
    SET NEW.insert_date = NOW(), NEW.update_date = NOW();

create definer = root@localhost trigger t_bookstore_sold_books_before_update
    before update
    on t_gamestore_sold_games
    for each row
    SET NEW.insert_date = OLD.insert_date, NEW.update_date = NOW();

