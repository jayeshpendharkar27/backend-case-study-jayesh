from flask import request
from decimal import Decimal

@app.route('/api/products', methods=['POST'])
def create_product():
    data = request.json

    if 'name' not in data or 'sku' not in data or 'price' not in data:
        return {"error": "Missing required fields"}, 400

    price = Decimal(str(data['price']))

    existing = Product.query.filter_by(sku=data['sku']).first()
    if existing:
        return {"error": "SKU already exists"}, 400

    product = Product(
        name=data['name'],
        sku=data['sku'],
        price=price
    )

    db.session.add(product)
    db.session.commit()

    return {"message": "Product created"}