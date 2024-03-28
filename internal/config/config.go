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
		Host:     "192.168.1.199",
		Port:     "5444",
		Username: "sixojke",
		Password: "sixojke",
		DBName:   "online_store",
		SSLMode:  "disable",
	}
}
