Company (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

Warehouse (
    id INT PRIMARY KEY,
    company_id INT,
    name VARCHAR(255),
    FOREIGN KEY (company_id) REFERENCES Company(id)
);

Product (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    sku VARCHAR(100) UNIQUE,
    price DECIMAL(10,2),
    product_type VARCHAR(50),
    low_stock_threshold INT
);

Inventory (
    id INT PRIMARY KEY,
    product_id INT,
    warehouse_id INT,
    quantity INT,
    UNIQUE(product_id, warehouse_id),
    FOREIGN KEY (product_id) REFERENCES Product(id),
    FOREIGN KEY (warehouse_id) REFERENCES Warehouse(id)
);

Supplier (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    contact_email VARCHAR(255)
);

ProductSupplier (
    product_id INT,
    supplier_id INT,
    PRIMARY KEY(product_id, supplier_id)
);