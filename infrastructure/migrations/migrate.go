package main

import (
	"fmt"
	"os"

	"database/sql"
	_ "github.com/lib/pq"
	"github.com/rubenv/sql-migrate"
)

const MIGRATIONS_PATH = "infrastructure/migrations"

// Run database migrations
func main() {
	fmt.Print("Migrating database...")

	migrations := &migrate.FileMigrationSource{Dir: MIGRATIONS_PATH}

	database, error := sql.Open("postgres", "postgres://database:5432/telegramud?sslmode=disable;user=telegramud")
	defer database.Close()

	if error != nil {
		fmt.Println(error)
	}

	executedMigrationsCount, error := migrate.Exec(database, "postgres", migrations, migrate.Up)
	if error != nil {
		fmt.Println(error)
	}

	fmt.Printf("done. Applied %d migrations!\n", executedMigrationsCount)

	os.Exit(0)
}
