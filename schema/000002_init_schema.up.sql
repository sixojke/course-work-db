CREATE INDEX idx_products_manufacturer_id ON products(manufacturer_id);
CREATE INDEX idx_products_category_id ON products(category_id);
CREATE INDEX idx_users_username ON users(username);
CREATE INDEX idx_orders_product_id ON orders(product_id);
CREATE INDEX idx_orders_user_id ON orders(user_id);
CREATE INDEX idx_cart_product_id ON cart(product_id);
CREATE INDEX idx_cart_user_id ON cart(user_id);
