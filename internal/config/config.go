package config

type PostgresConfig struct {
	Host     string
	Port     string
	Username string
	Password string
	DBName   string
	SSLMode  string
}

func NewPostgresConfig() *PostgresConfig {
	return &PostgresConfig{
		Host:     "localhost",
		Port:     "5432",
		Username: "sixojke",
		Password: "sixojke",
		DBName:   "online_store",
		SSLMode:  "disable",
	}
}
