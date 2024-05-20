CREATE TABLE manufacturers (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(128) NOT NULL,
    country VARCHAR(50) NOT NULL,
    description TEXT
);

CREATE TABLE categories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(128) NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE products (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255) NOT NULL,
    description TEXT,
    image_url TEXT,
    manufacturer_id UUID REFERENCES manufacturers(id),
    price DECIMAL(10, 2) NOT NULL,
    category_id UUID REFERENCES categories(id),
    stock_quantity INT NOT NULL
);

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(50) UNIQUE,
    username VARCHAR(32) NOT NULL,
    password TEXT NOT NULL,
    contact_info TEXT NOT NULL,
    preferences TEXT
);

CREATE TABLE orders (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    date TIMESTAMP DEFAULT now(),
    product_id UUID REFERENCES products(id),
    status VARCHAR(50) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    address TEXT NOT NULL
);

CREATE TABLE cart (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    product_id UUID REFERENCES products(id),
    quantity BIGINT NOT NULL,
    user_id UUID REFERENCES users(id)
);

CREATE TABLE user_orders (
  user_id UUID REFERENCES users(id), 
  order_id UUID REFERENCES orders(id)
);
