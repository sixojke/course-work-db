package schema

import (
	"errors"
	"fmt"

	"github.com/golang-migrate/migrate"
	_ "github.com/golang-migrate/migrate/database/postgres"
	_ "github.com/golang-migrate/migrate/source/file"
	"github.com/sixojke/course-work-db/internal/config"
	"github.com/sixojke/course-work-db/pkg/utils"
)

func MigratePostgres(cfg *config.PostgresConfig) error {
	err := migrateUp(fmt.Sprintf("postgres://%s:%s@%s:%s/%s?sslmode=%s",
		cfg.Username, cfg.Password, cfg.Host, cfg.Port, cfg.DBName, cfg.SSLMode))
	if err != nil {
		return err
	}

	return nil
}

func migrateUp(conn string) error {
	path, err := utils.CustomPath(`/schema`)
	if err != nil {
		return err
	}
	m, err := migrate.New(
		"file:"+path,
		conn,
	)
	if err != nil {
		return fmt.Errorf("create migration: %s", err)
	}

	if err := m.Up(); err != nil {
		if !errors.Is(err, migrate.ErrNoChange) {
			return fmt.Errorf("load migration: %s", err)
		}
	}

	return nil
}
