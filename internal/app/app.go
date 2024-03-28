package app

import (
	"log"

	"github.com/sixojke/course-work-db/internal/config"
	"github.com/sixojke/course-work-db/schema"
)

func Run() {
	cfg := config.NewPostgresConfig()
	log.Println(schema.MigratePostgres(cfg))
}
