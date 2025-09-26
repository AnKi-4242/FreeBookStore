# FreeBookStore Datenbank

## Projektbeschreibung
Das Repository enthält die komplette Datenbank für das FreeBookStore-Projekt. Die Datenbank unterstützt eine Anwendung zum privaten Bücherverleih, in der Nutzer Bücher anbieten, ausleihen und Wunschlisten verwalten können. Die Struktur basiert auf dem ERM, in dem die Beziehungen zwischen den einzelnen Entitäten abgebildet sind.

## Inhalt des Repositories
- `freebookstore_dump.sql` – komplette Datenbank inkl. Struktur und Testdaten
- Präsentations-PDFs Phase 1 & Phase 2
- Präsentations-PDF der dritten Phase zur Beschreibung von Aufbau und Funktionalität des DBMS 
- Abstract (1–1,5 Seiten) - Beschreibung der Lösung in inhaltlicher und konzeptioneller Hinsicht sowie ein "making of" der technischen Herangehensweise
- Screenshots / Dokumentation zur Veranschaulichung des Vorgehens und der Tests 

## Installation
1. Vorausgesetzt: MySQL 8.0 oder höher erforderlich; MySQL Workbench/anderes SQL-Client-Tool
2. SQL-Datei `freebookstore_dump.sql` ausführen
3. Tabellen müssen in der folgenden Reihenfolge erstellt werden: address, author, available, book, genre, location - danach: user -> user_book -> author_book -> genre_book -> user_book_location -> request -> loan -> messages -> reviews -> conflict -> photo -> wishlist -> wishlist_user 
4. INSERT-Statements ausführen, um Testdaten zu befüllen
Hinweis: Die SQL-Datei enthält bereits alle nötigen Tabellen, Fremdschlüssel, Auto-Increment-Spalten und Testdaten.

## Nutzung
- Testabfragen und Joins sind in den Präsentationen dokumentiert
- Fremdschlüssel und Löschverhalten (`ON DELETE CASCADE` / `SET NULL`) können getestet werden

## Technische Hinweise
- Engine: InnoDB
- Charset: utf8mb4
- Alle PKs, FKs und zusammengesetzten PKs implementiert
- Testdaten bertücksichtigen realistische Mehrfachnennungen und inhaltlich ähnliche Datensätze

## Autor
- Name: Kickartz, Anna
- Erstellt im Rahmen des Kurses "Projekt: Data-Mart-Erstellung in SQL"