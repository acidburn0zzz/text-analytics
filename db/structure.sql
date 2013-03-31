CREATE TABLE "brains" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "classifier" text, "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "phrases" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "text" text, "category" varchar(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "words" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "text" text, "count" integer, "deleted" boolean, "cloud" text(255), "created_at" datetime NOT NULL, "updated_at" datetime NOT NULL, "stem" varchar(255));
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20130327204258');

INSERT INTO schema_migrations (version) VALUES ('20130327205033');

INSERT INTO schema_migrations (version) VALUES ('20130329183511');

INSERT INTO schema_migrations (version) VALUES ('20130331184753');

INSERT INTO schema_migrations (version) VALUES ('20130331185313');