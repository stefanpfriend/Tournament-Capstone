BEGIN TRANSACTION;

DROP TABLE IF EXISTS users , tournaments , games , matches , team;
DROP SEQUENCE IF EXISTS seq_user_id;

CREATE SEQUENCE seq_user_id
  INCREMENT BY 1
  NO MAXVALUE
  NO MINVALUE
  CACHE 1;


                                                                        --TABLE CREATION 
CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE tournaments(
        tournament_name         varchar(64)     NOT NULL,
        tournament_id           serial          NOT NULL,
        start_date              timestamp               ,
        number_of_participants  int             NOT NULL,
        team_id                 serial                  ,
        ranking_of_teams        int                     ,
        match_id                int             NOT NULL,
        
CONSTRAINT       PK_tournament_id     PRIMARY KEY (tournament_id)              
);

CREATE TABLE games(
        game_name               varchar(32)     NOT NULL,
        game_id                 serial          NOT NULL,
        start_time              time            NOT NULL,
        start_date              date            NOT NULL,
        organizer               varchar(32)     NOT NULL,
        number_of_players       int             NOT NULL,
        
CONSTRAINT       PK_game_id             PRIMARY KEY (game_id)              

);

CREATE TABLE matches(
        tournament_id           serial                  ,
        game_id                 serial                  ,
        start_time              time            NOT NULL,
        start_date              date            NOT NULL,
        game_title              varchar(64)     NOT NULL,
        team_id                 serial                  ,
        match_id                serial          NOT NULL,
        number_of_players       int             NOT NULL,
        
CONSTRAINT       PK_match_id     PRIMARY KEY (tournament_id, game_id)              
        
);

CREATE TABLE team(
        tournament_id           serial          NOT NULL,
        game_id                 serial          NOT NULL,
        team_name               varchar(64)     NOT NULL,
        team_id                 serial          NOT NULL,
        list_of_players         varchar(64)     NOT NULL,
        
CONSTRAINT       PK_team_id     PRIMARY KEY (team_id , team_name)              


);

                                                                -- INSERT STATEMENTS
INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');
DELETE FROM tournaments;


                                                                -- SELECT STATEMENTS

SELECT * FROM users;
SELECT * FROM tournaments;
SELECT * FROM games;
SELECT * FROM matches;
SELECT * FROM team;

                                                                        --MAY NEED 
--ALTER TABLE 
--      constraint  name                constraint-type         columns  value        
--ADD CONSTRAINT pk_person_address    PRIMARY KEY             (person_id,address_id);
COMMIT TRANSACTION;
