CREATE TABLE products (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(255),
    description TEXT,
    image_url TEXT,
    manufacturer_id UUID,
    price DECIMAL(10, 2),
    category_id UUID,
    stock_quantity INT
);

CREATE TABLE categories (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(128),
    description TEXT
);

CREATE TABLE manufacturers (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name VARCHAR(128),
    country VARCHAR(50),
    description TEXT
);

CREATE TABLE users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(50),
    username VARCHAR(32),
    password TEXT,
    contact_info TEXT,
    preferences TEXT,
    order_history UUID[]
);

CREATE TABLE orders (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    date TIMESTAMP DEFAULT now(),
    product_id UUID,
    status VARCHAR(50),
    amount DECIMAL(10, 2),
    user_id UUID
);

CREATE TABLE cart (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    product_id UUID,
    quantity BIGINT,
    user_id UUID
);